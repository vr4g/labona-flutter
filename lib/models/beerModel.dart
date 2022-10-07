import 'package:flutter/material.dart';

class BeerModel {
  String beerId;
  String imageUrl;
  String beerTitle;
  String beerTitleShort;
  double beerPrice;
  double beerVolume;
  String beerDescription;
  double beerAbv;
  int beerShopAmount;

  BeerModel(
    this.beerId,
    this.beerTitle,
    this.beerTitleShort,
    this.beerPrice,
    this.beerVolume,
    this.beerDescription,
    this.imageUrl,
    this.beerAbv,
    this.beerShopAmount,
  );
}
