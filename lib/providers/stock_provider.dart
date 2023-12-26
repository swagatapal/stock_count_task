import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:stock_market_prediction/models/stock_model.dart';

class StockProvider extends ChangeNotifier {
  List<Stock> _stocks = [
    Stock(id:'1', symbol: 'APPLE',logoPath: 'assets/apple_logo.png', price: 0.0),
    Stock(id: '2', symbol: 'GOOGLE',logoPath: 'assets/google_logo.png', price: 0.0),

  ];

  Timer? _priceUpdateTimer;

  StockProvider() {
    _priceUpdateTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateStockPrices();
      _checkBuyCondition();
    });
  }

  List<Stock> get stocks => _stocks;

  void _updateStockPrices() {
    _stocks.forEach((stock) {
      stock.price = Random().nextDouble() * 100.0;
    });

    notifyListeners();
  }

  void _checkBuyCondition() {
    _stocks.forEach((stock) {
      if (stock.price < 20.0) {
        stock.quantity += 1;
        stock.total += stock.price;
      }
    });

    notifyListeners();
  }


  @override
  void dispose() {
    _priceUpdateTimer?.cancel();
    super.dispose();
  }
}
