import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  String name = 'name';
  String imgAvatar = 'assets';
  String birthDate = 'date';

  void changeData() {
    name = 'Felipe Sales';
    imgAvatar = 'assets/i.png';
    birthDate = '26/12/2003';
    notifyListeners();
  }

    void changeName() {
    name = 'felipecastrosales';
    notifyListeners();
  }
}
