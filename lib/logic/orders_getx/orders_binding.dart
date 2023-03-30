

import 'package:get/get.dart';
import 'package:refalco_test/data/repositories/orders_repo.dart';
import 'package:refalco_test/logic/orders_getx/offOrders_controller.dart';
import 'package:refalco_test/logic/orders_getx/orders_controller.dart';

class OrdersBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    OrdersRepositories ordersRepositories=OrdersRepositories();
    Get.put<OrdersController>(OrdersController(),permanent: false);
    Get.lazyPut(() => OrdersController());
    Get.put<OffOrderController>(OffOrderController(),permanent: false);
    Get.lazyPut(() => OffOrderController());
  }
  
}