import 'dart:convert';
import 'package:flutter_task/utils/result.dart';
import 'package:http/http.dart' as http;
import '../../models/order.dart';


abstract class OrderRepository {

  // Future<Result<List<Order>>> fetchAllOrders() ;
  Future<Result<List<Order>>> fetchNewOrders() ;
  Future<Result<List<Order>>> fetchOtherOrders() ;
  Future<void> insertOrdersLocal(List<Order> order);
}
