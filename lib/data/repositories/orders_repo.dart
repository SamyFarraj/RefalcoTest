import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:refalco_test/data/api/orders_api.dart';
import 'package:refalco_test/data/models/orders_model.dart';

import '../exceptions/custom_error.dart';

class OrdersRepositories {

   OrdersApi ordersApi=OrdersApi();
  Future<Orders>getAllOrders()async
  {
    try{

      final orders= await ordersApi.getAllOrders();
      print("the response is ${ordersFromJson(orders.toString())}");

      return ordersFromJson(orders.toString());
    }catch(error)
    {

      throw Exception( CustomError(errorMessage: "${error.toString()}"));
    }
  }

}