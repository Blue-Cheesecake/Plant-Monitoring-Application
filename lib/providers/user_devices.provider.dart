import 'dart:developer';

import 'package:flutter/material.dart';

class UserDevicesProvider with ChangeNotifier {
  bool _sw = false;

  bool get sw => _sw;

  void reFetchDevices() {
    log("Provider: Notifying");
    _sw = !_sw;
    notifyListeners();
  }
}
