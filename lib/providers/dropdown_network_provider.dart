import 'package:flutter/cupertino.dart';

import '../core/utils/enums/network.dart';

class DropdownNetworkProvider with ChangeNotifier {
  final networks = [
    Network.Vodacom,
    Network.Airtel,
    Network.Africell,
    Network.Orange
  ];

  Network _selectedNetwork = Network.Vodacom;

  Network get selectedNetwork => _selectedNetwork;

  void onChangeNetwork(value) {
    _selectedNetwork = value;
    notifyListeners();
  }
}
