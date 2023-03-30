import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:sizer/sizer.dart';
import '../../constant/SizeConfig.dart';
import '../../constant/color_app.dart';
import '../../data/local_data/Sqldb.dart';
import '../../data/models/orders_model.dart';
import '../../logic/orders_getx/orders_controller.dart';
import '../components/CustomComponents.dart';

SqlDB sqlDB = SqlDB();

class DetailsOrder extends StatelessWidget {
  OrdersController orderController = Get.find();

  Datum datum;


  DetailsOrder(this.datum);

  @override
  Widget build(BuildContext context) {
    double lat = double.parse(datum.address.lat);
    double lng = double.parse(datum.address.lng);

    SizeConfig().init(context);
    double w = SizeConfig.blockSizeHorizontal * 100;

    double h = SizeConfig.blockSizeVertical * 100;
    return Scaffold(
      backgroundColor: backgroundWaite,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 2.w, right: 2.w),
          height: 100.h,
          width: 100.w,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40.h,
                      child: OpenStreetMapSearchAndPick(
                          center: LatLong(double.parse(datum.address.lat), double.parse(datum.address.lng)),
                          onPicked: (pickedData) {
                          }),
                    ),
                    Row(
                      children: [
                        subtext('Total Price:', mainPurple),
                        SizedBox(
                          width: 2.w,
                        ),
                        subtext('${datum.total} ${datum.currency}', Colors.grey)
                      ],
                    ),
                    subtext('Order Items', mainPurple),
                    orderItemListView(context, datum),
                  ],
                ),
              ),
              GetBuilder<OrdersController>(
                  init: OrdersController(),
                  builder: (orederController){
                return  Container(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child:(orderController.favItemId.contains(int.parse(datum.id)))?
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainPurple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25), topRight: Radius.circular(25)))),
                        onPressed: () async {
                          //  push(context, ChoosePaymentMethod(idCourse));
                          // cubit.getAllGrades();

                          orderController.deleteOrderIdFromFavTable(datum.id);
                          AudioPlayer().play(AssetSource('audio/pop.mp3'));

                        },
                        child: Container(
                          width: w * 0.9,
                          height: h * 0.05,
                          margin: EdgeInsets.only(left: 2.w, right: 2.w, top: 0.5.h, bottom: 1.5.h),
                          child: Padding(
                            padding:
                            EdgeInsets.only(left: 2.w, right: 2.w, top: 0.5.h, bottom: 0.h),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: subtext("Remove From Favorites", mainWaite)),
                          ),
                        ),
                      ):
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainPurple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25), topRight: Radius.circular(25)))),
                        onPressed: () async {
                          //  push(context, ChoosePaymentMethod(idCourse));
                          // cubit.getAllGrades();
                       orderController.addOrderByIdToFavTable(datum.id);
                       snackBar('item has been added to Favorites', false, context);
                        },
                        child: Container(
                          width: w * 0.9,
                          height: h * 0.05,
                          margin: EdgeInsets.only(left: 2.w, right: 2.w, top: 0.5.h, bottom: 1.5.h),
                          child: Padding(
                            padding:
                            EdgeInsets.only(left: 2.w, right: 2.w, top: 0.5.h, bottom: 0.h),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: subtext('Add To Favorites', mainWaite)),
                          ),
                        ),
                      )



                  ),
                );
              })

            ],
          ),
        ),
      ),
    );
  }
}

Widget orderItemListView(BuildContext context, Datum datum) {
  return ListView.separated(
    shrinkWrap: true,
    physics: ScrollPhysics(),
    itemCount: datum.items.length,
    itemBuilder: (context, index) {
      return orderItem(context, datum, index);
    },
    separatorBuilder: (BuildContext context, int index) {
      return SizedBox(
        height: 1.h,
      );
    },
  );
}

Widget orderItem(BuildContext context, Datum datum, int index) {
  double w = SizeConfig.safeBlockHorizontal * 100;
//
  double h = SizeConfig.safeBlockVertical * 100;
  return Container(
    margin: EdgeInsets.only(top: 0.5.h, bottom: 2.h, left: 1.5.w, right: 1.5.w),
    decoration: BoxDecoration(
        color: mainWaite, borderRadius: BorderRadius.circular(25)),
    // height:h*0.35 ,
    // width: w*0.9,
    child: Padding(
      padding: EdgeInsets.only(left: 1.5.w, right: 1.5.w, top: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              subtextNonConst(
                "${datum.items[index].name}",
                mainPurple,
                w * 0.4,
                isCenter: false,
              ),
              iconWithText(context, '${datum.items[index].price}', Icons.paid),
              SizedBox(
                height: h * 0.01,
              ),

              // subFromSubtextNonConst("${orders.data[index].total }", Colors.grey, w * 0.4),
            ],
          ),
          // Column(
          //   children: [
          //     browseButton(orders,index),
          //     Container(
          //         padding: EdgeInsets.only(top: 4.h),
          //         child: Icon(Icons.favorite_border,color: mainPurple,)),
          //   ],
          // ),
        ],
      ),
    ),
  );
}

Widget iconWithText(BuildContext context, String textContent, IconData icon) {
  return Container(
      child: Row(
    children: [
      Icon(
        icon,
        color: mainPurple,
      ),
      Container(
          padding: EdgeInsets.only(left: 2.w),
          child: subFromSubtextNonConst("$textContent", Colors.grey, 35.w))
    ],
  ));
}

Widget favButton(Datum datum, int index) {
  return Container(
      height: 4.5.h,
      width: 20.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: mainPurple),
      margin: EdgeInsets.only(left: 0, bottom: 0.h),
      child: Obx(() {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: EdgeInsets.only(left: 1.h, right: 1.h),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {
            // print("the course id is ${course.courses[index].id}");
            //  push(context, CourseContentPage(course.courses[index].id));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              subFromSubtext('Browse', mainWaite),
              Icon(Icons.arrow_forward_ios, size: 18),
            ],
          ),
        );
      }));
}

// addToFavoriteButton(BuildContext context, String titleButton, String idOrder,
//     OrdersController ordersController) {
//   double w = SizeConfig.blockSizeHorizontal * 100;
//
//   double h = SizeConfig.blockSizeVertical * 100;
//   return ElevatedButton(
//     style: ElevatedButton.styleFrom(
//         backgroundColor: mainPurple,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(25), topRight: Radius.circular(25)))),
//     onPressed: () async {
//       //  push(context, ChoosePaymentMethod(idCourse));
//       // cubit.getAllGrades();
//       ordersController.getAllOrdersIdFromTable();
//       await sqlDB.insertData(
//           "INSERT " "INTO 'favItems'('idOrder') VALUES ('$idOrder')");
//     },
//     child: Container(
//       width: w * 0.9,
//       height: h * 0.05,
//       margin: EdgeInsets.only(left: 2.w, right: 2.w, top: 0.5.h, bottom: 1.5.h),
//       child: Padding(
//         padding:
//             EdgeInsets.only(left: 2.w, right: 2.w, top: 0.5.h, bottom: 0.h),
//         child: Align(
//             alignment: Alignment.bottomCenter,
//             child: subtext(titleButton, mainWaite)),
//       ),
//     ),
//   );
// }
//
// Widget removeFromFavoriteButton(BuildContext context, String titleButton,
//     String idOrder, OrdersController ordersController) {
//   double w = SizeConfig.blockSizeHorizontal * 100;
//
//   double h = SizeConfig.blockSizeVertical * 100;
//   return ElevatedButton(
//     style: ElevatedButton.styleFrom(
//         backgroundColor: mainPurple,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(25), topRight: Radius.circular(25)))),
//     onPressed: () async {
//       //  push(context, ChoosePaymentMethod(idCourse));
//       // cubit.getAllGrades();
//       await sqlDB.deleteData(
//           "DELETE FROM 'favItems' WHERE idOrder= ${idOrder.toString()}");
//
//       ordersController.getAllOrdersIdFromTable();
//     },
//     child: Container(
//       width: w * 0.9,
//       height: h * 0.05,
//       margin: EdgeInsets.only(left: 2.w, right: 2.w, top: 0.5.h, bottom: 1.5.h),
//       child: Padding(
//         padding:
//             EdgeInsets.only(left: 2.w, right: 2.w, top: 0.5.h, bottom: 0.h),
//         child: Align(
//             alignment: Alignment.bottomCenter,
//             child: subtext(titleButton, mainWaite)),
//       ),
//     ),
//   );
// }
