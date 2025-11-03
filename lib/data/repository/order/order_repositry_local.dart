import 'package:flutter_task/data/services/data_local/local_data_service.dart';

import '../../../utils/result.dart';
import '../../models/order.dart';
import 'order_repository.dart';

class OrderRepositoryLocal implements OrderRepository{
  OrderRepositoryLocal({required  localService}):_localService=localService;
  final LocalDataService _localService;

  @override
  Future<Result<List<Order>>> fetchOrders(String status) async{
    try {
      final orders = await LocalDataService.getOrders(status);
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