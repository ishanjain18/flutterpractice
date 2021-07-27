import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '655B3D84-B69B-4D83-920F-108C11678553';

class CoinData {
  //TODO 3: Update getCoinData to take the selectedCurrency as an input.

  Future getCoinData(String currency) async {
    //TODO 4: Update the URL to use the selectedCurrency input.

    String requestURL = '$coinAPIURL/BTC/$currency?apikey=$apiKey';
    var url = Uri.parse(requestURL);
    print(url);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var lastPrice = jsonData['rate'];

      return lastPrice;
    } else {
      print('Request failed with Status: ${response.statusCode}');
      throw 'Problem with the GET Request';
    }
  }
}
