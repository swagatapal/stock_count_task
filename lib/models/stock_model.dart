class Stock {
  final String id;
  final String symbol;
  final String logoPath;
  double price;
  int quantity;
  double total;

  Stock({
    required this.id,
    required this.symbol,
    required this.logoPath,
    required this.price,
    this.quantity = 0,
    this.total = 0.0,
  });
}
