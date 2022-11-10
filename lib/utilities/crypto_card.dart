import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bitcoin_ticket/utilities/constants.dart';

class CryptoCard extends StatelessWidget {
  String? rate;
  String? selectedCurrency;
  String? cryptoCurrency;

  CryptoCard({this.rate, this.selectedCurrency, this.cryptoCurrency});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: Text(
            '1 $cryptoCurrency = $rate $selectedCurrency',
            textAlign: TextAlign.center,
            style: kCardText,
          ),
        ),
      ),
    );
  }
}
