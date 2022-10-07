import 'package:flutter/material.dart';

import '../models/beerModel.dart';

class BeersProvider with ChangeNotifier {

  final List<BeerModel> _beers = [];


  void addBeer(BeerModel beer, int? numberOfElements) {
    if(_beers.length < numberOfElements!){
    _beers.add(beer);
    }
  }

 double totalPrice(){
    double totalPrice = 0;
    for (var element in _beers) {totalPrice = totalPrice + (element.beerShopAmount * element.beerPrice); }
    notifyListeners();
    return totalPrice;
  }

  List<BeerModel> getBeers(){
    return [..._beers];
  }
  BeerModel getBeerById(String id){
    var selectedBeer = _beers.firstWhere((element) => element.beerId == id);
    return selectedBeer;
    }

  void addShopAmount(String id, int amount){
    var currentBeer = _beers.firstWhere((element) => element.beerId == id);
    currentBeer.beerShopAmount = currentBeer.beerShopAmount + amount;
    notifyListeners();
  }
  void updateShopAmount(String id, int amount){
    var currentBeer = _beers.firstWhere((element) => element.beerId == id);
    currentBeer.beerShopAmount = amount;
    notifyListeners();
  }

  int totalShopAmount(){
    var totalAmountInCart=0;
     for (var element in _beers) {totalAmountInCart += element.beerShopAmount; }
    return totalAmountInCart;
  }

  int getShopAmount(String id){
    var beerAmount = _beers.firstWhere((element) => element.beerId == id);
    return  beerAmount.beerShopAmount;
  }
}
