import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/datum_offLine_model.dart';
import '../../presentation/Orders/details_order.dart';

class OffOrderController extends GetxController {

  List<DatumOff>ordersOffLine=[];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllOrdersFromOrdersTable();
  }


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
}
