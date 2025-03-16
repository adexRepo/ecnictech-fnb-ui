class DailySales {
  final String date;
  final double sales;

  DailySales({required this.date, required this.sales});

  factory DailySales.fromJson(Map<String, dynamic> json) {
    return DailySales(
      date: json['date'],
      sales: json['sales'],
    );
  }
}
