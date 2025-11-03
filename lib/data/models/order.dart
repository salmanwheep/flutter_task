class Order {
  Order({
    required this.id,
    required this.status,
    required this.price,
    required this.date,
  });

  final int id;
  final String status;
  final String price;
  final String date;



  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: int.tryParse(json['BILL_SRL'].toString()) ?? 0,
      status:_mapStatus( json['DLVRY_STATUS_FLG']?.toString() ?? 'Unknown'),
      price: json['TOTAL_PRICE']?.toString() ?? '0',
      date: json['BILL_DATE']?.toString() ?? '',
    );
  }
  Map<String, dynamic>toJson() {
    return {
      'id': id,
      'status': _reverseStatus(status),
      'price': price,
      'date': date,
  };
}
  static String _mapStatus(dynamic code) {
    switch (code.toString()) {
      case '0':
        return 'New';
      case '1':
        return 'Delivering';
      case '2':
        return 'Delivered';
      case '3':
        return 'Returned';
      default:
        return 'New';
    }
  }

  static int _reverseStatus(String status) {
    switch (status) {
      case 'New':
        return 0;
      case 'Delivering':
        return 1;
      case 'Delivered':
        return 2;
      case 'Returned':
        return 3;
      default:
        return 0;
    }
  }
}
