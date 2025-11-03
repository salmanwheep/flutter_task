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
      status: json['DLVRY_STATUS_FLG']?.toString() ?? 'Unknown',
      price: json['TOTAL_PRICE']?.toString() ?? '0',
      date: json['BILL_DATE']?.toString() ?? '',
    );
  }
  Map<String, dynamic>toJson() {
    return {
      'id': id,
      'status': status,
      'price': price,
      'date': date,
  };
}
}
