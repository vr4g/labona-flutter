import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/beers_provider.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class CartList extends StatefulWidget {
  CartList(
      {Key? key,
      required this.beerId,
      required this.beerImage,
      required this.beerTitle,
      required this.beerPrice,
      required this.beerVolume,
      required this.beerAmount})
      : super(key: key);

  final String beerId;
  final String beerImage;
  final String beerTitle;
  int beerAmount;
  final double beerPrice;
  final double beerVolume;

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    final beerProvider = Provider.of<BeersProvider>(context);
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            height: 82,
            child: SlidableAction(
              flex: 5,
              onPressed: (_) => beerProvider.updateShopAmount(widget.beerId, 0),
              backgroundColor: Colors.grey,
              foregroundColor: Colors.black,
              icon: Icons.delete,
              label: 'Obriši',
            ),
          )
        ],
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 90,
        child: Card(
          color: const Color.fromRGBO(50, 50, 50, 0.9),
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                height: 80,
                child: Image.network(widget.beerImage),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.beerTitle.toUpperCase(),
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(right: 10),
                            height: 30,
                            child: Center(
                              child: Text(
                                '${widget.beerPrice} kn',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 90,
                width: 40,
                color: Theme.of(context).backgroundColor,
                child: Column(
                  children: [
                    SizedBox(
                      width: 35,
                      height: 29,
                      child: Center(
                        child: IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              setState(() {
                                if (widget.beerAmount <= 0) {
                                  beerProvider.addShopAmount(widget.beerId, 0);
                                } else {
                                  widget.beerAmount = widget.beerAmount - 1;
                                  beerProvider.updateShopAmount(
                                      widget.beerId, widget.beerAmount);
                                }
                              });
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.minus,
                              //size: 5,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Container(
                        height: 24,
                        width: 32,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            color: Colors.grey),
                        child: Center(
                          child: Text(
                            beerProvider
                                .getShopAmount(widget.beerId)
                                .toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        )),
                    SizedBox(
                      height: 29,
                      width: 35,
                      child: IconButton(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0),
                          onPressed: () => setState(() {
                                widget.beerAmount++;
                                beerProvider.updateShopAmount(
                                    widget.beerId, widget.beerAmount);
                              }),
                          icon: const FaIcon(
                            FontAwesomeIcons.plus,
                            size: 15,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
