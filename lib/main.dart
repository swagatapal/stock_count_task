import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_market_prediction/providers/stock_provider.dart';
import 'package:stock_market_prediction/screen/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StockProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stock Buying App',
        home: HomeScreen(),
      ),
    );
  }
}
