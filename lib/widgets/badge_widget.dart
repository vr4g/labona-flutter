import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../screens/shop/cart_screen.dart';

class BadgeWidget extends StatelessWidget {
  BadgeWidget({Key? key, required this.totalShopAmount}) : super(key: key);

  int totalShopAmount;

  @override
  Widget build(BuildContext context) {
    return Badge(
        badgeColor: totalShopAmount == 0 ?  Colors.grey : Colors.redAccent,
        position: const BadgePosition(top: 5, end: 5),
        badgeContent: SizedBox(
            width: 10,
            height: 10,
            child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  '$totalShopAmount',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ))),
        animationType: BadgeAnimationType.slide,
        child: IconButton(
          icon: const Icon(Icons.shopping_cart),
          color: Colors.white,
          onPressed: () {
            pushNewScreenWithRouteSettings(context,
                settings: const RouteSettings(
                  name: CartScreen.routeName,
                ),
                screen: const CartScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino);
          },
        ));
  }
}
