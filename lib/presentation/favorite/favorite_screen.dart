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
import 'favorite_view.dart';

class FavoriteScreen extends StatelessWidget {
  OrdersController orderController = Get.find();

  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: customAppBar(mainPurple, 'Favorites Order'),
      backgroundColor: backgroundWaite,
      body: GetBuilder<OrdersController>(
        init: OrdersController(),
        builder: (contoller){

        return    Container(
          child:favoriteOrdersListView(
              context, orderController.favItem, orderController),
        );
      },)

    );
  }
}
