import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refalco_test/logic/orders_getx/orders_binding.dart';
import 'package:refalco_test/presentation/Orders/orders_screen.dart';
import 'package:refalco_test/presentation/components/CustomComponents.dart';
import 'package:refalco_test/presentation/favorite/favorite_screen.dart';
import 'package:refalco_test/presentation/home/home_screen.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:refalco_test/presentation/offline_screen/orders_offLine_screen.dart';

import 'package:sizer/sizer.dart';

import 'constant/color_app.dart';
import 'constant/global_paramter.dart';




void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize the database
  await dbHelper.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return GetMaterialApp(
          getPages: [
            GetPage(name: '/Orders', page: ()=>OrdersScreen(),binding: OrdersBinding()),
            GetPage(name: '/FavoriteScreen', page: ()=>FavoriteScreen(),binding: OrdersBinding()),
            GetPage(name: '/OffOrderScreen', page: ()=>OrdersOffLineScreen(),binding: OrdersBinding()),
            GetPage(name: '/HomePage', page: ()=>HomePage()),

          ],
          smartManagement: SmartManagement.full,
          defaultTransition: Transition.zoom,
          home:OfflineBuilder(
            connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,) {
              final bool connected = connectivity != ConnectivityResult.none;
              return connected ? (const HomePage()):OrdersOffLineScreen();
            },
            child:Center(
              child: Container(
                margin: EdgeInsets.all(15),
                height: double.infinity,
                color: Colors.white
                ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    mainText('تحقق من اتصالك بالانترنت !', mainPurple),
                    SizedBox(height:2.h,),
                    Image.asset('assets/images/nointernet.png')
                  ],
                ),
              ),
            ),
          ) ,
          theme: ThemeData(brightness: Brightness.light, fontFamily: 'Cairo')
              .copyWith(
            // textTheme:GoogleFonts.cairoTextTheme(
            //   Theme.of(context).textTheme
            // ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xFF7557F7),
                foregroundColor: Color(0xFFF8F7FF),
                shadowColor: Colors.deepPurpleAccent,
              ),
              primaryColor: const Color(0xFF7557F7),
              secondaryHeaderColor: const Color(0xFF9C85F9),
              scaffoldBackgroundColor: const Color(0xFFF8F7FF),
              canvasColor: const Color(0xFF7557F7),
              primaryColorLight: const Color(0xFF7557F7)),
          //متل مابدك انو تشغل شغلات اول مايشتغل التطبيق متل الشيرد بريفرنس وهالقصص
          initialBinding: OrdersBinding(),
          //  Get.offAll(page)
        );
      },

    );
  }
}

