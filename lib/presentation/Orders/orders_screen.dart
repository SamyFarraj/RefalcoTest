import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:refalco_test/data/models/orders_model.dart';
import 'package:refalco_test/logic/orders_getx/orders_controller.dart';
import 'package:sizer/sizer.dart';

import '../../constant/ConstantString.dart';
import '../../constant/SizeConfig.dart';
import '../../constant/color_app.dart';
import '../components/CustomComponents.dart';
import 'details_order.dart';
import 'orders_view/orders_view.dart';

class OrdersScreen extends StatelessWidget {
  OrdersController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: customAppBar(mainPurple, 'All Order'),
      backgroundColor: backgroundWaite,
      body: Obx(() {
        return orderController.isLoading.value
            ? circular(mainPurple)
            : Container(
                child: ordersListView(
                    context, orderController.orders, orderController),
              );
      }),
    );
  }
}
