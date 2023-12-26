import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/stock_model.dart';
import '../providers/stock_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Center(child: Text('Stock Buying App',style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),)),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Consumer<StockProvider>(
              builder: (context, stockProvider, child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: stockProvider.stocks.length,
                    itemBuilder: (context, index) {
                      Stock stock = stockProvider.stocks[index];
                      return Card(
                        color: Colors.lightGreen,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(stock.logoPath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Text(
                                    stock.symbol,
                                    style: const TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '\$${stock.price.toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 30.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 10.0),
            Consumer<StockProvider>(
              builder: (context, stockProvider, child) {
                int totalQuantity = stockProvider.stocks
                    .map((stock) => stock.quantity)
                    .reduce((value, element) => value + element);
                double totalValue = stockProvider.stocks
                    .map((stock) => stock.total)
                    .reduce((value, element) => value + element);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Total Quantity: $totalQuantity',style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                    const SizedBox(height: 10,),
                    Text('Total Value: \$${totalValue.toStringAsFixed(2)}',style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
