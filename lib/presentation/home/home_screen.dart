import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/color_app.dart';
import '../Orders/orders_screen.dart';
import '../favorite/favorite_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  List<Widget> _widgetOptions = <Widget> [

    FavoriteScreen(),
    OrdersScreen()

  ];


  final List<GButton> _tabs = [
    GButton(
      icon: Icons.favorite,
      text: 'favorites',
      iconSize: 24.sp,
    ),
    GButton(
      icon: Icons.category,
      text: 'Orders',
      iconSize: 24.sp,
    ),

  ];

  static  TextStyle optionStyle =
  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {


    double w = MediaQuery.of(context).size.width;

    double h=  MediaQuery.of(context).size.height;
    return Scaffold(

      bottomNavigationBar:SizedBox(
        height:8.5.h,
        child: GNav(
          selectedIndex: 1,
          style: GnavStyle.google,
          backgroundColor: Theme.of(context).primaryColor,
          activeColor: Theme.of(context).cardColor,
          color: Theme.of(context).secondaryHeaderColor,
          tabs: _tabs,
          onTabChange: (newIndex) {
            setState(() {
              _selectedIndex = newIndex;
            });
          },
        ),
      ) ,
      body: Center( child: _widgetOptions.elementAt(_selectedIndex),),
    );
  }

  GButton gButton(IconData icon) => GButton(icon: icon,  iconSize: 24.sp,);

  TextStyle titleStyle() =>  TextStyle(fontSize: 20.sp);
}


