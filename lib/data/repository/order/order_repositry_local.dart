import 'package:flutter_task/data/services/data_local/local_data_service.dart';

import '../../../utils/result.dart';
import '../../models/order.dart';
import 'order_repository.dart';

class OrderRepositoryLocal implements OrderRepository{
  OrderRepositoryLocal({required  localService}):_localService=localService;
  final LocalDataService _localService;


  @override
  Future<Result<List<Order>>> fetchNewOrders() async{
    try {
      final orders = await _localService.getOrders();
      return Result.ok(orders.where((order)=>order.status=="New").toList());
    } catch (e) {
      return Result.error(Exception(e));
    }
  }

  @override
  Future<Result<List<Order>>> fetchOtherOrders() async{
    try {
      final orders = await _localService.getOrders();

      return Result.ok(orders.where((o)=>o.status!='New').toList());
    } catch (e) {
      return Result.error(Exception(e));
    }
  }
  @override
  Future<Result<void>> insertOrdersLocal(List<Order> order) async{
    try {
       await _localService.insertOrders(order);
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(e));
    }
  }

}