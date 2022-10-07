import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:labona_flutter/models/beerModel.dart';
import 'package:labona_flutter/providers/beers_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/badge_widget.dart';

class ShopDetailsScreen extends StatefulWidget {
  const ShopDetailsScreen({Key? key}) : super(key: key);

  static const String routeName = '/shop_details';

  @override
  State<ShopDetailsScreen> createState() => _ShopDetailsScreenState();
}

class _ShopDetailsScreenState extends State<ShopDetailsScreen> {
  int totalAmount = 0;
  int totalAmountInCart = 0;

  int totalInCart(int amount) {
    setState(() {
      totalAmountInCart = totalAmountInCart + amount;
    });
    return totalAmountInCart;
  }

  @override
  Widget build(BuildContext context) {
    final beerId = ModalRoute.of(context)?.settings.arguments as String;
    final singleBeer = Provider.of<BeersProvider>(context).getBeerById(beerId);
    final beerProvider = Provider.of<BeersProvider>(context);
    final deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(122, 122, 122, 1),
          elevation: 0,
          actions: [
            BadgeWidget(totalShopAmount: beerProvider.totalShopAmount())
          ],
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body:buildCenter(context, deviceWidth, singleBeer, beerProvider, beerId),
      ),
    );
  }

  Center buildCenter(BuildContext context, double deviceWidth, BeerModel singleBeer, BeersProvider beerProvider, String beerId) {
    return Center(
        child: SizedBox(
          //width: MediaQuery.of(context).size.width ,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
           // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .4,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .3,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 30, top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50)),
                        color: Color.fromRGBO(122, 122, 122, 1),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .8,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width:deviceWidth *0.5,
                                //height: 70,
                                child: Text(
                                  singleBeer.beerTitle.toUpperCase(),

                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 30),
                                ),
                              ),
                     /*         SizedBox(
                                height: 30,
                              ),*/
                              Text(
                                '${singleBeer.beerAbv}% | ${singleBeer.beerVolume} L',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ]),
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.09,
                      left: 0,
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20))),
                        child: Center(
                            child: Text(
                          '${singleBeer.beerPrice.toStringAsFixed(2)} kn',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      child: Image.network(singleBeer.imageUrl,
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.37),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child: Text(
                        'Opis:',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),

/*                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),

                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5 - 40,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (totalAmount <= 0) {
                                      totalAmount = 0;
                                    } else {
                                      totalAmount--;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                )),
                            Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    color: Colors.black26,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child: Center(
                                  child: Text(
                                    totalAmount.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                )),
                            IconButton(
                                onPressed: () => setState(() {
                                      totalAmount++;
                                    }),
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Cijena: ${singleBeer.beerPrice} kn',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Ukupno: ${singleBeer.beerPrice * totalAmount} kn',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Consumer<BeersProvider>(
                        builder:
                            (BuildContext context, value, Widget? child) {
                          return ElevatedButton(

                              onPressed: totalAmount == 0 ? null : () {
                                setState(() {
                                  value.addShopAmount(
                                      beerId, totalAmount);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          backgroundColor: Colors.blueGrey,
                                          duration: Duration(milliseconds: 700),
                                          content: Text(
                                            'Dodano u košaricu',
                                            textAlign: TextAlign.center,
                                          )));
                                  totalAmount = 0;
                                });
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.black))),
                                  backgroundColor:
                                      MaterialStateProperty.all(
                                          Colors.white)),
                              child: const Text(
                                'Dodaj u košaricu',
                                style: TextStyle(color: Colors.black),
                              ));
                        },
                      ),
                    ],
                  )
                ],
              ),*/

              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5 - 11                   ,
                  width: deviceWidth,
                  child: Stack(
                    children : [
                    Container(
                      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                      height: MediaQuery.of(context).size.height * 0.33 ,
                   foregroundDecoration: const BoxDecoration(
                    gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black45],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.6,1]
                  ),
                      ),
                      decoration: BoxDecoration(
                        color:Theme.of(context).backgroundColor ,
                            boxShadow: [BoxShadow(    color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius:2,
                              offset: Offset(0, 3),)]
                      ),
                      child: SingleChildScrollView(
                        child: Text(
                            singleBeer.beerDescription,
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                      ),
                    ),
                      Center(
                        child: Container(
                          width: deviceWidth * 0.9,
                          //height: 200,
                          child: Stack(children: [
                            const Positioned(bottom:50, left: 25,child: Text('UKUPNO:',style: TextStyle(color: Colors.white,fontSize: 20),)),
                            Positioned(
                              bottom: 25, left: 25,
                              child: Text(
                                '${(singleBeer.beerPrice * totalAmount).toStringAsFixed(2)} KN',
                                style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Positioned(
                              right: 25, bottom: 20,
                              child: ElevatedButton(
                                  onPressed: totalAmount == 0
                                      ? null
                                      : () {
                                    setState(() {
                                      beerProvider.addShopAmount(
                                          beerId, totalAmount);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                              backgroundColor: Colors.blueGrey,
                                              duration:
                                              Duration(milliseconds: 700),
                                              content: Text(
                                                'Dodano u košaricu',
                                                textAlign: TextAlign.center,
                                              )));
                                      totalAmount = 0;
                                    });
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                              side: const BorderSide(
                                                  color: Colors.black))),
                                      backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                                  child: Row(
                                    children: const [
                                      Text(
                                        'Dodaj u ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      FaIcon(FontAwesomeIcons.cartShopping, color: Colors.black,)
                                    ],
                                  )),
                            ),
                            Positioned(
                              right: 10,
                              bottom:82,
                              child: SizedBox(

                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (totalAmount <= 0) {
                                                totalAmount = 0;
                                              } else {
                                                totalAmount--;
                                              }
                                            });
                                          },
                                          icon: Container(
                                            width: 30,height: 30,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey,

                                            ),
                                            child: Center(
                                              child: FaIcon(FontAwesomeIcons.circleMinus,
                                                color: Theme.of(context).backgroundColor,
                                              ),
                                            ),
                                          )),
                                      Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(shape: BoxShape.circle,
                                            border:
                                            Border.all(color: Colors.grey,width: 3),
                                            color: Theme.of(context).backgroundColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              totalAmount.toString(),maxLines: 1,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                          )),
                                      IconButton(
                                          onPressed: () => setState(() {
                                            if(totalAmount < 99){
                                            totalAmount++;
                                            }
                                            else{
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(
                                                      backgroundColor: Color.fromRGBO(150, 50, 50,1),
                                                      duration:
                                                      Duration(milliseconds: 900),
                                                      content: Text(
                                                        'Limit je 99 piva!',
                                                        textAlign: TextAlign.center,
                                                      )));
                                            }
                                          }),
                                          icon:  Container(
                                            width: 30,height: 30,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey,

                                            ),
                                            child: Center(
                                              child: FaIcon(
                                                FontAwesomeIcons.circlePlus,
                                                color: Theme.of(context).backgroundColor,
                                              ),
                                            ),
                                          )),
                                    ],
                                  )),
                            )
                          ]),
                        ),
                      )
                    ]
                  ),
                  ),
                ),

            ],
          ),
        ),
      );
  }

  Center buildCenterSmall(BuildContext context, double deviceWidth, BeerModel singleBeer, BeersProvider beerProvider, String beerId) {
    return Center(
      child: SizedBox(
        //width: MediaQuery.of(context).size.width ,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .39,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .3,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 30, top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50)),
                      color: Color.fromRGBO(122, 122, 122, 1),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:deviceWidth *0.5,
                              //height: 70,
                              child: Text(
                                singleBeer.beerTitle.toUpperCase(),

                                style: const TextStyle(
                                    color: Colors.black, fontSize: 24),
                              ),
                            ),
                            /*         SizedBox(
                                height: 30,
                              ),*/
                            Text(
                              '${singleBeer.beerAbv}% | ${singleBeer.beerVolume} L',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ]),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.09,
                    left: 0,
                    child: Container(
                      width: 50,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20))),
                      child: Center(
                          child: Text(
                            '${singleBeer.beerPrice.toStringAsFixed(2)} kn',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    child: Image.network(singleBeer.imageUrl,
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.37),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 15,
                    child: Text(
                      'Opis:',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),

/*                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),

                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5 - 40,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (totalAmount <= 0) {
                                      totalAmount = 0;
                                    } else {
                                      totalAmount--;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                )),
                            Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    color: Colors.black26,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child: Center(
                                  child: Text(
                                    totalAmount.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                )),
                            IconButton(
                                onPressed: () => setState(() {
                                      totalAmount++;
                                    }),
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Cijena: ${singleBeer.beerPrice} kn',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Ukupno: ${singleBeer.beerPrice * totalAmount} kn',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Consumer<BeersProvider>(
                        builder:
                            (BuildContext context, value, Widget? child) {
                          return ElevatedButton(

                              onPressed: totalAmount == 0 ? null : () {
                                setState(() {
                                  value.addShopAmount(
                                      beerId, totalAmount);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          backgroundColor: Colors.blueGrey,
                                          duration: Duration(milliseconds: 700),
                                          content: Text(
                                            'Dodano u košaricu',
                                            textAlign: TextAlign.center,
                                          )));
                                  totalAmount = 0;
                                });
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.black))),
                                  backgroundColor:
                                      MaterialStateProperty.all(
                                          Colors.white)),
                              child: const Text(
                                'Dodaj u košaricu',
                                style: TextStyle(color: Colors.black),
                              ));
                        },
                      ),
                    ],
                  )
                ],
              ),*/

            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5 - 11                   ,
                width: deviceWidth,
                child: Stack(
                    children : [
                      Container(
                        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                        height: MediaQuery.of(context).size.height * 0.33 ,
                        foregroundDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black45],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.6,1]
                          ),
                        ),
                        decoration: BoxDecoration(
                            color:Theme.of(context).backgroundColor ,
                            boxShadow: [BoxShadow(    color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius:2,
                              offset: Offset(0, 3),)]
                        ),
                        child: SingleChildScrollView(
                          child: Text(
                            singleBeer.beerDescription,
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: deviceWidth * 0.9,
                          //height: 200,
                          child: Stack(children: [
                            const Positioned(bottom:50, left: 25,child: Text('UKUPNO:',style: TextStyle(color: Colors.white,fontSize: 20),)),
                            Positioned(
                              bottom: 25, left: 25,
                              child: Text(
                                '${(singleBeer.beerPrice * totalAmount).toStringAsFixed(2)} KN',
                                style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Positioned(
                              right: 25, bottom: 20,
                              child: ElevatedButton(
                                  onPressed: totalAmount == 0
                                      ? null
                                      : () {
                                    setState(() {
                                      beerProvider.addShopAmount(
                                          beerId, totalAmount);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                              backgroundColor: Colors.blueGrey,
                                              duration:
                                              Duration(milliseconds: 700),
                                              content: Text(
                                                'Dodano u košaricu',
                                                textAlign: TextAlign.center,
                                              )));
                                      totalAmount = 0;
                                    });
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                              side: const BorderSide(
                                                  color: Colors.black))),
                                      backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                                  child: Row(
                                    children: const [
                                      Text(
                                        'Dodaj u ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      FaIcon(FontAwesomeIcons.cartShopping, color: Colors.black,)
                                    ],
                                  )),
                            ),
                            Positioned(
                              right: 10,
                              bottom:82,
                              child: SizedBox(

                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (totalAmount <= 0) {
                                                totalAmount = 0;
                                              } else {
                                                totalAmount--;
                                              }
                                            });
                                          },
                                          icon: Container(
                                            width: 30,height: 30,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey,

                                            ),
                                            child: Center(
                                              child: FaIcon(FontAwesomeIcons.circleMinus,
                                                color: Theme.of(context).backgroundColor,
                                              ),
                                            ),
                                          )),
                                      Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(shape: BoxShape.circle,
                                            border:
                                            Border.all(color: Colors.grey,width: 3),
                                            color: Theme.of(context).backgroundColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              totalAmount.toString(),maxLines: 1,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                          )),
                                      IconButton(
                                          onPressed: () => setState(() {
                                            if(totalAmount < 99){
                                              totalAmount++;
                                            }
                                            else{
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(
                                                      backgroundColor: Color.fromRGBO(150, 50, 50,1),
                                                      duration:
                                                      Duration(milliseconds: 900),
                                                      content: Text(
                                                        'Limit je 99 piva!',
                                                        textAlign: TextAlign.center,
                                                      )));
                                            }
                                          }),
                                          icon:  Container(
                                            width: 30,height: 30,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey,

                                            ),
                                            child: Center(
                                              child: FaIcon(
                                                FontAwesomeIcons.circlePlus,
                                                color: Theme.of(context).backgroundColor,
                                              ),
                                            ),
                                          )),
                                    ],
                                  )),
                            )
                          ]),
                        ),
                      )
                    ]
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}
