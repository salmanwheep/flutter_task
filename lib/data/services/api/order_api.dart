import 'dart:convert';



import 'package:http/http.dart' as http;
import '../../models/order.dart';

class OrderApi{
  const OrderApi();
  Future<List<Order>> getOrders() async{
    final body = {
      "Value": {
        "P_DLVRY_NO": 1010,
        "P_LANG_NO": 1,
        "P_BILL_SRL": "",
        "P_PRCSSD_FLG":""
      }
    };
    try {
      http.Response response = await http.post(Uri.parse(
          "http://mdev.yemensoft.net:8087/OnyxDeliveryService/Service.svc/GetDeliveryBillsItems"
      ),
        headers: {"Content-Type": "application/json"},

        body: jsonEncode(body),
      );
      print(response.body+ "\n " + response.statusCode.toString() + " \n" +
          response.request.toString());

      if (response.statusCode == 200) {

        final data = jsonDecode(response.body);
          final List<dynamic> list = data['Value'];
          return  list.map((e) => Order.fromJson(e)).toList();
      }else{
        throw Exception ("error with ${response.statusCode}");
      }
    }on Exception catch( e){
      throw Exception(e);
    }


  }
}