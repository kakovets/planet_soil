import 'package:flutter/material.dart';
import '../models/continent.dart';

class ContinentsProvider with ChangeNotifier {

  List<Continent> _continentList = [];
  List<Continent> get continentList => _continentList;

  set continentList(List<Continent> value) {
    _continentList = value;
    notifyListeners();
  }

  void add(Continent continent) {
    _continentList.add(continent);
    notifyListeners();
  }

  void remove(Continent continent) {
    _continentList.remove(continent);
    notifyListeners();
  }

  void clearContinents() {
    _continentList.clear();
    notifyListeners();
  }

  void populateReal() {
    continentList = [
      Continent(
        name: 'Eurasia',
        pathToImage: 'assets/continents/eurasia.png',
        area: 55000000,
        population: 5400000000,
      ),
      Continent(
        name: 'N America',
        pathToImage: 'assets/continents/burger.jpg',
        area: 24709000,
        population: 592296233,
      ),
      Continent(
        name: 'S America',
        pathToImage: 'assets/continents/capybara.jpg',
        area: 17840000,
        population: 434254119,
      ),
      Continent(
        name: 'Africa',
        pathToImage: 'assets/continents/africa.jpg',
        area: 30271000,
        population: 1200000000,
      ),
      Continent(
        name: 'Australia',
        pathToImage: 'assets/continents/australia.jpg',
        area: 7688287,
        population: 27124700,
      ),
    ];
    notifyListeners();
  }

  void populate1984() {
    continentList = [
      Continent(
        name: 'Oceania',
        pathToImage: 'assets/1984/black.png',
        area: 100500,
        population: 1547892,
      ),
      Continent(
        name: 'Eurasia',
        pathToImage: 'assets/1984/red.png',
        area: 2222222,
        population: 32443,
      ),
      Continent(
        name: 'Eastasia',
        pathToImage: 'assets/1984/yellow.png',
        area: 9876543,
        population: 234567,
      ),
    ];
    notifyListeners();
  }
}