import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDB {
  static Database? _db;

  static const _databaseName = "Refaclo.db";

  Future<Database?> get db async {
    if (_db == null) {
      _db = await init();
      return _db;
    } else
      return _db;
  }

  String pathData = '';

  init() async {
    String dataBaseBath = await getDatabasesPath();
    String path = join(dataBaseBath, _databaseName);
    pathData = path;
    Database refalcoAppDb = await openDatabase(path,
        onCreate: _onCreate, version: 1,
        );
    return refalcoAppDb;
  }

  deleteDataBase() async {
    print("deleted DataBase");
    await deleteDatabase(pathData);
  }

//تابع للتحديث على الداتا بيز (مممكن التحديث يكون اضافة جدول جديد
  //فانت مابصير تكريت جدول وترجع تستدعيoncreat
  //لازم تستدعي ال upgrade
  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < newVersion) {
      print('upgrage');
      // you can execute drop table and create table
      db.execute("ALTER TABLE Note ADD COLUMN Date TEXT;");
    }
  }
//////////
  _onCreate(Database db, int version) async {
    /*
  ملاحظات
  يفضل مايكون اسم العامود نفس اسم الداتا بيز 1
  يفضل الاوتوانكرمينت تنحط اخر شي 2
   */

    //DataBase for Missions
    await db.execute(
        'CREATE TABLE "favItems" (idOrder INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT, totalPriceOrder TEXT, cratedTimeOrder TEXT)');
    //DataBase For note
    await db.execute('CREATE TABLE addresses (id INTEGER PRIMARY KEY AUTOINCREMENT,lat TEXT,lng TEXT)');
    await db.execute('CREATE TABLE items (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price TEXT)');
    await db.execute('CREATE TABLE orders (id INTEGER PRIMARY KEY AUTOINCREMENT, total TEXT, created_at TEXT, currency TEXT)');

    await db.execute('CREATE TABLE item_order (order_id INTEGER REFERENCES orders(id),item_id INTEGER REFERENCES items(id))');

  }
  deleteTable(String nameTable) async {
    Database? mydb = await db;
    int response = await mydb!.delete('Note');
    return response;
  }
////////////
  ////////////////
  readData(String sql) async {
    Database? mydb = await db;

    List<Map<String, Object?>> response = await mydb!.rawQuery(sql);

    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;

    print('the sql string is ${sql}');
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;

    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;

    int response = await mydb!.rawDelete(sql);
    return response;
  }

  /////////////////





  
}
