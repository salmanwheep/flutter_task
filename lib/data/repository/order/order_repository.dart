import 'dart:convert';
import 'package:flutter_task/utils/result.dart';
import 'package:http/http.dart' as http;
import '../../models/order.dart';


abstract class OrderRepository {

  Future<Result<List<Order>>> fetchOrders(String status) ;

}
