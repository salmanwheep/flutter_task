import 'package:flutter/material.dart';
import 'package:flutter_task/data/repository/order/order_repositry_local.dart';
import 'package:flutter_task/data/repository/order/order_response_remote.dart';

import '../../../data/models/order.dart';
import '../../../data/repository/order/order_repository.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';

class OrderViewModel extends ChangeNotifier {
  final OrderRepositoryRemote remoteRepository;
  final OrderRepositoryLocal localRepository;

  List<Order> _ordersNew = [];
  List<Order> _ordersOther= [];

  List<Order> get ordersNew => _ordersNew;
  List<Order> get ordersOther => _ordersOther;

  late final Command0<List<Order>> loadOrdersNew;
  late final Command0<List<Order>> loadOrdersOther;

  OrderViewModel({
    required this.remoteRepository,
    required this.localRepository,
  }) {
    loadOrdersOther = Command0<List<Order>>(_loadOrdersOther)..execute();
    loadOrdersNew = Command0<List<Order>>(_loadOrdersNew)..execute();
  }

  Future<Result<List<Order>>> _loadOrdersNew() async {
    try {
      final remoteOrders = await remoteRepository.fetchNewOrders();
      switch (remoteOrders) {
        case Ok<List<Order>>():
          await localRepository.insertOrdersLocal(remoteOrders.value);
          _ordersNew = remoteOrders.value;
        case Error<List<Order>>():
          return _localOrdersNew();
      }
      return remoteOrders;
    } catch (e) {
            return _localOrdersNew();
      } finally {
        notifyListeners();

      }
    }

    Future<Result<List<Order>>> _localOrdersNew() async {
      final localOrders = await localRepository.fetchNewOrders();
      switch (localOrders) {
        case Ok<List<Order>>():
          _ordersNew = localOrders.value;
        case Error<List<Order>>():
          print(localOrders.error);
      }
      return localOrders;
    }



    Future<Result<List<Order>>> _loadOrdersOther() async {
      try {
        final remoteOrders = await remoteRepository.fetchOtherOrders();
        switch (remoteOrders) {
          case Ok<List<Order>>():
            await localRepository.insertOrdersLocal(remoteOrders.value);
            _ordersOther = remoteOrders.value;

          case Error<List<Order>>():
            return _localOrdersOther();
        }
        return remoteOrders;
      } catch (e) {

          return _localOrdersOther();

        } finally {
          notifyListeners();
        }
      }
  Future<Result<List<Order>>> _localOrdersOther() async {
    final localOrders = await localRepository.fetchOtherOrders();
    switch (localOrders) {
      case Ok<List<Order>>():
        _ordersOther = localOrders.value;
      case Error<List<Order>>():
        print(localOrders.error);
    }
    return localOrders;
  }
  }

