import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class BitcoinHelper {
  final Uri url;

  BitcoinHelper(this.url);

  Future getData() async {
    var bitcoinData = await http.get(url);

    if (bitcoinData.statusCode == 200) {
      return jsonDecode(bitcoinData.body);
    } else {
      print(bitcoinData.statusCode);
      return {
        "time": "?",
        "asset_id_base": "?",
        "asset_id_quote": "?",
        "rate": Random().nextInt(10)
      };
    }
  }
}
