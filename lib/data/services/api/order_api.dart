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
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> list = data['Data']['DeliveryBills'];
        return  list.map((e) => Order.fromJson(e)).toList();
      }else{

        // List<Order> orders = [ Order(id: 1, status: "New", price: "220", date: "11/6/2021")
        //   ,Order(id: 2, status: "New", price: "6318", date: "12/1/2024")
        //   ,Order(id: 9, status: "New", price: "6378", date: "11/6/2020"),
        //   Order(id: 8, status: "New", price: "6478", date: "11/6/2020"),
        //   Order(id: 7, status: "Delivering", price: "6578", date: "11/6/2021"),
        //   Order(id: 6, status: "Delivering", price: "6678", date: "11/6/2022"),
        //   Order(id: 5, status: "Delivered", price: "6778", date: "11/6/2022"),
        //   Order(id: 4, status: "Delivered", price: "6878", date: "11/6/2025"),
        //   Order(id: 3, status: "Delivered", price: "6978", date: "11/5/2020" ),
        //
        //   Order(id: 10, status: "Return", price: "6578", date: "11/6/2021"),
        //   Order(id: 16, status: "Return", price: "6678", date: "11/6/2022"),
        //   Order(id: 15, status: "Return", price: "6778", date: "11/6/2022"),
        //   Order(id: 14, status: "Return", price: "6878", date: "11/6/2025"),
        //   Order(id: 13, status: "Delivered", price: "6978", date: "11/5/2020" ),
        // ];
        // return   orders;

        throw Exception ("error : ${response.statusCode}");
      }
    }on Exception catch( e){
      rethrow;
    }
  }
}