import 'package:get/get.dart';
import 'package:refalco_test/data/models/datum_offLine_model.dart';
import 'package:refalco_test/data/models/orders_model.dart';
import 'package:refalco_test/data/repositories/orders_repo.dart';

import '../../data/local_data/Sqldb.dart';

class OrdersController extends GetxController {
  OrdersRepositories ordersRepositories = new OrdersRepositories();

  SqlDB sqlDB = SqlDB();


   List<Datum> orders=[];

  var isLoading = false.obs;
  List<int> favItemId = [];
  List<Datum>favItem=[];
  List<DatumOff>ordersOffLine=[];



  @override
  void onReady() async {

    // TODO: implement onReady
    super.onReady();
    await getAllOrders();
    await getAllOrdersIdFromTable();
    await getAllFavItems();
    await addAllOrdersToLocalDataBase();
    await getAllOrdersFromOrdersTable();

  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit

    super.onInit();

    await getAllOrdersFromOrdersTable();
    await getAllOrders();
    await getAllOrdersIdFromTable();
    await getAllFavItems();
    await addAllOrdersToLocalDataBase();
    await getAllOrdersFromOrdersTable();

  }


  ///call Rest Api //

  getAllOrders() async {
    try {
      isLoading(true);
      await ordersRepositories.getAllOrders().then((orders) {
        this.orders = orders.data;
      });
    } catch (error) {
      print("the error${error}");
    } finally {
      isLoading(false);
    }
  }

  ///
  ///
  ///


  getAllFavItems()async
  {
    favItem.clear();
    for(int i=0;i<orders.length;i++)
    {
      if(favItemId.contains(int.parse(orders[i].id)))
      {
        favItem.add(orders[i]);
      }
    }
    update();
  }


  ///  DataBase///
  ///  all methode about manage Local DataBase
  ///


  getAllOrdersIdFromTable() async {
    favItemId.clear();
    List<Map<String, Object?>> response =
    await sqlDB.readData("SELECT * FROM 'favItems'");

    for (int i = 0; i < response.toList().length; i++) {
      int idOrder = int.parse(response[i]['idOrder'].toString());
      favItemId.add(idOrder);
      print("the id is ${idOrder}");
    }
  }



  ///manage Data When App OffILine
  ///
  getAllOrdersFromOrdersTable() async {
    ordersOffLine.clear();
    List<Map<String, Object?>> response =
    await sqlDB.readData("SELECT * FROM 'orders'");

    for (int i = 0; i < response.toList().length; i++) {
      String idOrder = response[i]['id'].toString();
      String total = response[i]['total'].toString();
      String created_at =response[i]['created_at'].toString();
      String currency = response[i]['currency'].toString();
      ordersOffLine.add(DatumOff(idOrder, total, created_at, currency));
    }
    update();
  }
  addAllOrdersToLocalDataBase()async {
    await sqlDB.deleteData("delete from orders") ;
    for(int i=0;i<orders.length;i++)
    {
      insertIntoOrdersTable(orders[i]);

    }
    update();
  }
///


  ///manage Fave in Local DataBase
  void addOrderByIdToFavTable(String id) async {
    await insertIntoTable(id);
    await getAllOrdersIdFromTable();
    await getAllFavItems();
    update();
  }

  void deleteOrderIdFromFavTable(String id) async {
    await deleteFromTable(id);
    await getAllOrdersIdFromTable();
    await getAllFavItems();

    update();
  }


  ///General manage Local DataBase
  insertIntoTable(String orderId) async {
    await sqlDB
        .insertData("INSERT INTO 'favItems'('idOrder') VALUES ('${orderId}')");
  }

  deleteFromTable(String id) async {
    await sqlDB.deleteData("DELETE FROM 'favItems' WHERE idOrder= ${id}");
    //getAllOrdersIdFromTable();
  }

  insertIntoOrdersTable(Datum order) async {

    await sqlDB.insertData("INSERT INTO 'orders'('id','total','currency','created_at') VALUES ('${order.id}','${order.total}','${order.currency}','${order.createdAt}')");

  }









}
