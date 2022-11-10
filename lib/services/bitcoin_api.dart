import 'package:bitcoin_ticket/services/bitcoin_helper.dart';
import 'package:bitcoin_ticket/services/coin_data.dart';

const apiKey = '8229A3EC-D672-4FD9-A50E-222650C05128';

class BitcoinModel {
  late BitcoinHelper bitcoinHelper;

  Future<dynamic> getBitcoinConversion(currency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      var url = Uri.https('rest.coinapi.io',
          '/v1/exchangerate/$crypto/$currency', {'apikey': apiKey});
      bitcoinHelper = BitcoinHelper(url);
      var bitcoinData = await bitcoinHelper.getData();
      cryptoPrices[crypto] = bitcoinData['rate'].toStringAsFixed(2);
    }
    return cryptoPrices;
  }
}
