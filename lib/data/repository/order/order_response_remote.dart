import 'package:flutter_task/data/services/data_local/local_data_service.dart';

import '../../../utils/result.dart';
import '../../models/order.dart';
import '../../services/api/order_api.dart';
import 'order_repository.dart';

class OrderRepositoryRemote implements OrderRepository{
  OrderRepositoryRemote({required  OrderApi orderApi}):_orderApi=orderApi;
  final OrderApi _orderApi;

  @override
  Future<Result<List<Order>>> fetchOrders(String status) async{
    try {
      final orders = await _orderApi.getOrders();

      return Result.ok(orders);
    } catch (e) {
      return Result.error(Exception(e));
    }
  }
  Future<Result<void>> insertOrdersLocal(List<Order> order) async{
    try {
      await LocalDataService.insertOrders(order);
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(e));
    }
  }

}