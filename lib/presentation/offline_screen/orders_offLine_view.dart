import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';

import '../../constant/SizeConfig.dart';
import '../../constant/color_app.dart';
import '../../data/models/datum_offLine_model.dart';
import '../../data/models/orders_model.dart';
import '../../logic/orders_getx/orders_controller.dart';
import '../Orders/details_order.dart';
import '../components/CustomComponents.dart';

Widget ordersListView(
    BuildContext context, List<DatumOff> orders, OrdersController orderController) {
  return ListView.separated(
    itemCount: orders.length,
    itemBuilder: (context, index) {
      return ordersItem(context, orders, index, orderController);
    },
    separatorBuilder: (BuildContext context, int index) {
      return SizedBox(
        height: 1.h,
      );
    },
  );
}

Widget ordersItem(BuildContext context, List<DatumOff> orders, int index, OrdersController orderController) {
  double w = SizeConfig.safeBlockHorizontal * 100;
//
  double h = SizeConfig.safeBlockVertical * 100;
  // print("the id order is${(orderController.idOrderFav.contains(int.parse(orders.data[index].id)))}");

  return Container(
    margin: EdgeInsets.only(top: 0.5.h, bottom: 2.h, left: 1.5.w, right: 1.5.w),
    decoration: BoxDecoration(
        color: mainWaite, borderRadius: BorderRadius.circular(25)),
    // height:h*0.35 ,
    // width: w*0.9,
    child: Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 30.w,
            margin: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h, left: 4.w),
            child: Column(
              children: [
                Container(
                    height: h * 0.15,
                    width: w * 0.9,
                    margin: EdgeInsets.only(right: 2.w, bottom: 1.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Image.asset(
                      'assets/images/nointernet.png',
                      fit: BoxFit.contain,
                    )),
                // Container(
                //     margin: EdgeInsets.only(right: w*0.02,bottom: 0.2.h),
                //     child: titleTeacherCourse(context, course, index)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              subtextNonConst(
                "order ID :${orders[index].idOrder}",
                mainPurple,
                w * 0.4,
                isCenter: false,
              ),
              iconWithText(
                  context,
                  '${orders[index].total} ${orders[index].currency}',
                  Icons.paid),
              SizedBox(
                height: h * 0.01,
              ),
              iconWithText(
                  context, orders[index].created_at, Icons.event),
              // subFromSubtextNonConst("${orders.data[index].total }", Colors.grey, w * 0.4),
            ],
          ),

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
              padding: EdgeInsets.only(right: 0.w),
              child: subFromSubtextNonConst("$textContent", Colors.grey, 35.w))
        ],
      ));
}

