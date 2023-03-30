import 'package:http/http.dart'as http;

import '../../constant/ConstantString.dart';
import '../exceptions/custom_error.dart';


class OrdersApi{

  Future<Object>getAllOrders()async
  {
    try{
      var respose=await http.get(Uri.parse("$baseUrl/api/v1/orders"),headers: <String,String>
      {
        "Accept": "application/json",

      }

      );
    print("the response is ${respose.body}");
    print("the response is ${respose.statusCode}");
      if(respose.statusCode==200)
      {
        return respose.body;
      }
      else
      {
        throw Exception(const CustomError(errorMessage: 'هناك خطأ ما أعد المحاولة لاحقا'));
      }
    }catch(error)
    {
      rethrow;
    }


  }

}