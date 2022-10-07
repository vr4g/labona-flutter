import 'package:flutter/material.dart';

class CardShop extends StatelessWidget {
  const CardShop(
      {Key? key,
      required this.beerImage,

      required this.beerTitleShort})
      : super(key: key);

  final String beerImage;
  final String beerTitleShort;


  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(150, 150, 150, 0.5),
      elevation: 5,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.22,
                child: Image.network(
                  beerImage
                )),
            Text(
              beerTitleShort,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ]),
    );
  }
}
