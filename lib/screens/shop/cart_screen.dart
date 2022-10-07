import 'package:flutter/material.dart';
import 'package:labona_flutter/screens/shop/cart_form_screen.dart';
import 'package:labona_flutter/widgets/shop_widgets/cart_list.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../providers/beers_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routeName = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartFontSize = 16.0;
  var cartPrice = 0.0;
  var cartPriceTotal = 0.0;
  final shippingPrice = 50;


  @override
  Widget build(BuildContext context) {
    final beerProvider = Provider.of<BeersProvider>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          title: const Text('KOŠARICA'),
          titleTextStyle: const TextStyle(fontSize: 26, fontFamily: 'Gabriela'),
          centerTitle: true,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(children: [
                      Expanded(
                        child: beerProvider.totalShopAmount() == 0 ? Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.remove_shopping_cart,size: MediaQuery.of(context).size.width *.7,color: Colors.grey,),
                            const Text('Košarica je prazna', style: TextStyle(color: Colors.white,fontSize: 26),),
                          ],
                        ))  : ListView.builder(
                            itemCount: beerProvider.getBeers().length,
                            itemBuilder: (context, index) {
                               cartPrice = cartPrice +
                                    beerProvider.getBeers()[index].beerPrice *
                                        beerProvider.getBeers()[index].beerShopAmount;
                                cartPriceTotal = cartPrice + shippingPrice;
                               return Column(
                                  children: [
                                    beerProvider.getBeers()[index].beerShopAmount == 0? const SizedBox() :CartList(
                                      beerId: beerProvider.getBeers()[index].beerId,
                                      beerImage:
                                  beerProvider.getBeers()[index].imageUrl,
                                      beerTitle:beerProvider.getBeers()[index].beerTitle,
                                      beerPrice: beerProvider.getBeers()[index].beerPrice,
                                      beerVolume: beerProvider.getBeers()[index].beerVolume,
                                      beerAmount:
                                      beerProvider.getBeers()[index].beerShopAmount,
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    )
                                  ],
                                );
                            }),
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ukupno: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: cartFontSize),
                              ),
                              Text(
                                '${beerProvider.totalPrice().toStringAsFixed(2)} kn',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: cartFontSize),
                              ),
                            ],
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Poštarina: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: cartFontSize),
                              ),
                              Text(
                                beerProvider.totalShopAmount() == 0 ? '0.00 kn' :
                                "${shippingPrice.toStringAsFixed(2)} kn",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: cartFontSize),
                              ),
                            ],
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: const Divider(
                            height: 3,
                            thickness: 1,
                            color: Colors.white,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ukupno sa poštarinom: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: cartFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                beerProvider.totalShopAmount() == 0 ? "0.00 kn" :
                               "${(beerProvider.totalPrice() + shippingPrice).toStringAsFixed(2)} kn",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: cartFontSize),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                            onPressed: beerProvider.totalShopAmount() == 0 ? null : (){
                              pushNewScreenWithRouteSettings(context,
                                  settings: const RouteSettings(
                                    name: CartScreen.routeName,
                                  ),
                                  screen: const CartFormScreen(),
                                  withNavBar: true,
                                  pageTransitionAnimation: PageTransitionAnimation.cupertino);
                            },
                            child: const Text("Završi narudžbu"),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.grey),),
                          ))
                    ])
          )
        ));
  }
}
