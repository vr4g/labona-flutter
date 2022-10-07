import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:labona_flutter/providers/beers_provider.dart';
import 'package:labona_flutter/screens/shop/shop_details_screen.dart';
import 'package:labona_flutter/widgets/badge_widget.dart';
import 'package:labona_flutter/widgets/shop_widgets/card_shop.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../../models/beerModel.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final beerProvider = Provider.of<BeersProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          centerTitle: true,
          title: const Text("Kupi pivo"),
          titleTextStyle: const TextStyle(fontSize: 26),
          actions: [
            BadgeWidget(totalShopAmount: beerProvider.totalShopAmount())
          ],
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('beers').get(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      mainAxisExtent: 200,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 15),
                              itemCount: snapshot.data?.docs.length,
                              itemBuilder: (context, index) {
                                final DocumentSnapshot documentSnapshot =
                                    snapshot.data!.docs[index];

                                beerProvider.addBeer(
                                    BeerModel(
                                      documentSnapshot.id,
                                      documentSnapshot['beerName'],
                                      documentSnapshot['beerTitleShort'],
                                      double.parse(
                                          documentSnapshot['beerPrice']),
                                      double.parse(
                                          documentSnapshot['beerVolume']),
                                      documentSnapshot['beerDescription'],
                                      documentSnapshot['beerPicture'],
                                      documentSnapshot['beerAbv'].toDouble(),
                                      documentSnapshot['beerShopAmount'],
                                    ),
                                    snapshot.data?.docs.length);
                                return InkWell(
                                  onTap: () {
                                    SchedulerBinding.instance
                                        .addPostFrameCallback((_) {
                                      pushNewScreenWithRouteSettings(
                                        context,
                                        settings: RouteSettings(
                                            name: ShopDetailsScreen.routeName,
                                            arguments: documentSnapshot.id),
                                        screen: const ShopDetailsScreen(),
                                        withNavBar: false,
                                        pageTransitionAnimation:
                                            PageTransitionAnimation.cupertino,
                                      );
                                    });
                                  },
                                  child: CardShop(
                                    beerTitleShort:
                                        documentSnapshot['beerTitleShort'],
                                    beerImage: documentSnapshot['beerPicture'],

                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
