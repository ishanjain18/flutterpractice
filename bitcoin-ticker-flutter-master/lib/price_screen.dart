import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  //TODO 6: Update the default currency to AUD, the first item in the currencyList.
  String selectedCurrency = 'AUD';
  dynamic coinRate = '?';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropDownList = [];
    for (String currency in currenciesList) {
      dropDownList.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }
    return DropdownButton(
      value: selectedCurrency,
      items: dropDownList,
      onChanged: (value) {
        setState(() {
          //TODO 2: Call getData() when the picker/dropdown changes.
          selectedCurrency = value;
        });
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> curList = [];
    for (String currency in currenciesList) {
      curList.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (idx) {
        print(idx);
        selectedCurrency = currenciesList[idx];
        getData();
        //TODO 1: Save the selected currency to the property selectedCurrency
        //TODO 2: Call getData() when the picker/dropdown changes.
      },

      // curList is a list of text widgets, currenciesList is a list of strings
      children: curList,
    );
  }

  Future getData() async {
    try {
      var rate = await CoinData().getCoinData(selectedCurrency);
      setState(() {
        coinRate = rate.toStringAsFixed(3);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  //TODO 5: Update the currency name depending on the selectedCurrency.
                  '1 BTC = $coinRate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            //padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: iosPicker(),
            // child: Platform.isIOS ? iosPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
