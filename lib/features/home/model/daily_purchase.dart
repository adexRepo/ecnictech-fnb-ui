class DailyPurchase {
  final String date;
  final double sales;

  DailyPurchase({required this.date, required this.sales});

  factory DailyPurchase.fromJson(Map<String, dynamic> json) {
    return DailyPurchase(
      date: json['date'],
      sales: json['sales'],
    );
  }
}
