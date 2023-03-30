import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:refalco_test/data/models/orders_model.dart';
import 'package:refalco_test/logic/orders_getx/offOrders_controller.dart';
import 'package:refalco_test/logic/orders_getx/orders_controller.dart';
import 'package:sizer/sizer.dart';

import '../../constant/ConstantString.dart';
import '../../constant/SizeConfig.dart';
import '../../constant/color_app.dart';

import '../components/CustomComponents.dart';
import 'orders_offLine_view.dart';

class OrdersOffLineScreen extends StatelessWidget {
  OrdersController orderController = Get.find();
  OffOrderController offOrderController = Get.find();

  OrdersOffLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: customAppBar(mainPurple, 'OffLine Order'),
      backgroundColor: backgroundWaite,
      body: (orderController.ordersOffLine.isEmpty)
        ?Center(child: subtext('There Is No Item Yet !', Colors.grey),):GetBuilder<OffOrderController>(
        init: OffOrderController(),
        builder: (contoller){
          contoller.getAllOrdersFromOrdersTable();
          return    Container(
            child:ordersListView(
                context, orderController.ordersOffLine, orderController),
          );
        },)

    );
  }
}
