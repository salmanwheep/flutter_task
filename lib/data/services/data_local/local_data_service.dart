import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/order.dart';

class LocalDataService {

  static const int _version = 1;
  static const String _table = "orders";

  Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), "delivery.db"),
        onCreate: (db, version) async =>
        await db.execute('''
      CREATE TABLE IF NOT EXISTS orders (
        id INTEGER PRIMARY KEY,
        status TEXT,
        price TEXT,
        date TEXT
      );
    '''), version: _version);
  }

  Future<void> insertOrders(List<Order> orders) async {
    final db = await _getDB();

    db.delete(_table);

    for (var order in orders) {
      await db.insert(
          _table,
          order.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Order>> getOrders() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query(_table);
    return List.generate(maps.length, (i) {
      return Order(
        id: maps[i]['id'],
        status: maps[i]['status'],
        price: maps[i]['price'],
        date: maps[i]['date'],
      );
    });
  }
}