import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child:Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.hourglass, size: 100, color: Colors.grey,),
              Text('Dolazi uskoro', style: TextStyle(fontSize: 40, color: Colors.grey, fontFamily: 'Gabriela', fontWeight: FontWeight.bold),),
            ],
          ),
        )
    ));
  }
}
