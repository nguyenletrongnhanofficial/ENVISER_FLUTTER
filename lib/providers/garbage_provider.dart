import 'package:flutter/material.dart';
import 'package:uit_hackathon/models/garbage.dart';

class GarbageProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void addGarbage(Garbage garbage) {
    _garbages.add(garbage);
    print("length: +  ${_garbages.length}");
    notifyListeners();
  }

  List<Garbage> _garbages = [];
  List<Garbage> get garbages => _garbages;
  void setGarbage(List<Garbage> garbages) {
    _garbages.clear();
    _garbages.addAll(garbages);
    // _garbages.sort((a, b) => b.time.compareTo(a.time));
    notifyListeners();
  }

  void setEmptyGarbage() {
    // _numsOfgarbage = 0;
    _garbages.clear();
    notifyListeners();
  }

  void createGarbage(Garbage garbage) {
    _garbages.add(garbage);
    // _garbage.sort((a, b) => b.time.compareTo(a.time));
    notifyListeners();
  }

  void editGarbage(Garbage garbage) {
    _garbages.removeWhere((element) => element.id == garbage.id);
    _garbages.add(garbage);
    // _garbage.sort((a, b) => b.time.compareTo(a.time));
    notifyListeners();
  }
}
