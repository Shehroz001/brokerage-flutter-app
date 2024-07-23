import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(StockListApp());
}

class StockListApp extends StatefulWidget {
  @override
  _StockListAppState createState() => _StockListAppState();
}

class _StockListAppState extends State<StockListApp> {
  List<Map<String, String?>> stocks = [
    {'symbol': 'AAPL', 'price': null},
    {'symbol': 'MSFT', 'price': null},
    {'symbol': 'GOOGL', 'price': null},
    {'symbol': 'TSLA', 'price': null},
  ];

  // Replace with your Yahoo Finance API key
  static const String yahooApiKey =
      'https://api.login.yahoo.com/oauth2/request_auth?client_id=dj0yJmk9N3VmMFFLSXN2T2xEJmQ9WVdrOU5ESkdiM0ZyZVhjbWNHbzlNQT09JnM9Y29uc3VtZXJzZWNyZXQmc3Y9MCZ4PTc3--&redirect_uri=oob&response_type=code&language=en-us';

  Future<void> fetchStockPrices() async {
    for (int i = 0; i < stocks.length; i++) {
      final symbol = stocks[i]['symbol'];
      final url = Uri.parse(
          'https://apidojo-yahoo-finance-v1.p.rapidapi.com/stock/v2/get-summary?symbol=$symbol&region=US');

      final response = await http.get(url, headers: {
        'x-rapidapi-key': yahooApiKey,
        'x-rapidapi-host': 'apidojo-yahoo-finance-v1.p.rapidapi.com',
        'useQueryString': 'true'
      });

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          stocks[i]['price'] =
              jsonData['price']['regularMarketPrice']['fmt'].toString();
        });
      } else {
        throw Exception('Failed to load stock price for $symbol');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchStockPrices();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stock Prices'),
        ),
        body: ListView.builder(
          itemCount: stocks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(stocks[index]['symbol'] ?? ''),
              subtitle: Text(stocks[index]['price'] ?? ''),
            );
          },
        ),
      ),
    );
  }
}
