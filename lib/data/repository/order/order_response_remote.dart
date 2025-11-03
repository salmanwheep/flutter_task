import 'package:flutter_task/data/services/data_local/local_data_service.dart';

import '../../../utils/result.dart';
import '../../models/order.dart';
import '../../services/api/order_api.dart';
import 'order_repository.dart';

class OrderRepositoryRemote implements OrderRepository{
  OrderRepositoryRemote({required  OrderApi orderApi}):_orderApi=orderApi;
  final OrderApi _orderApi;

  @override
  Future<Result<List<Order>>> fetchNewOrders() async{
    try {
      final orders = await _orderApi.getOrders();
  
      return Result.ok(orders.where((o)=>o.status=='New').toList());

    } catch (e) {
      return Result.error(Exception(e));
    }
  }
  @override
  Future<Result<List<Order>>> fetchOtherOrders() async{
    try {
      final orders = await _orderApi.getOrders();

      return Result.ok(orders.where((o)=>o.status!='New').toList());
    } catch (e) {
      return Result.error(Exception(e));
    }
  }
  @override
  Future<void> insertOrdersLocal(List<Order> order) async{
  }

}