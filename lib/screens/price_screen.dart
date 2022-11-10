import 'package:bitcoin_ticket/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticket/services/coin_data.dart';
import 'package:bitcoin_ticket/services/bitcoin_api.dart';
import 'package:bitcoin_ticket/utilities/crypto_card.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreen createState() => _PriceScreen();
}

class _PriceScreen extends State<PriceScreen> {
  String? selectedCurrency = currenciesList.first;
  BitcoinModel bitcoinModel = BitcoinModel();
  Map<String, String> coinValues = {};

  CupertinoPicker iOSPicker() {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          fillData();
        });
      },
      children: currenciesList.map<Widget>((String value) {
        return Text(
          value,
          style: kCardText,
        );
      }).toList(),
    );
  }

  DropdownButton<String> androidPicker() {
    return DropdownButton(
        value: selectedCurrency,
        items: currenciesList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            child: Text(value),
            value: value,
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            selectedCurrency = newValue;
            fillData();
          });
        });
  }

  Column createCrads() {
    List<CryptoCard> cryptoCardList = [];
    for (String crypto in cryptoList) {
      cryptoCardList.add(CryptoCard(
        cryptoCurrency: crypto,
        selectedCurrency: selectedCurrency,
        rate: coinValues[crypto],
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCardList,
    );
  }

  void fillData() async {
    try {
      var data = await bitcoinModel.getBitcoinConversion(selectedCurrency);
      setState(() {
        coinValues = data;
      });
    } catch (exeption) {
      print(exeption);
    }
  }

  @override
  void initState() {
    super.initState();
    fillData();
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
          createCrads(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidPicker(),
          )
        ],
      ),
    );
  }
}
