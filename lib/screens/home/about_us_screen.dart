import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  static const routeName = '/about_us';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: const AssetImage(
                      'images/logo.png',
                    ),
                    width: MediaQuery.of(context).size.width * 0.50,
                    height:  MediaQuery.of(context).size.height * 0.15,
                  )),
              SizedBox(height: 15,),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.65 - 15,
                child: SingleChildScrollView(
                  child: Column(children: const [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Craft je opet IN!',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'LABONA Premium Craft pivo za prave pivoljupce',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Labona je nova pivovara iz Labina koja je osnovana 2021.g.od strane mladih entuzijasta koji su godinama stvarali pivo kod'
                    'ku??e samo za vlastite potrebe. Svoje iskustvo i ono ??to su jednom bili ku??ni uradci odlu??ili smo podijeliti sa ??irom publikom,'
                    'te prenijeti svoje promi??ljanje i filozofiju stvaranja piva i gu??tanja u pivu. \n\n'
                    'Svi na??i proizvodi su potpuno prirodni bez ikakvih dodataka, surogata, aroma, bojila ili konzervansa,'
                    'nefiltrirani su i nepasterizirani ??to jam??i kvalitetu i pivo punog i specifi??nog okusa koje zove na jo?? jednu ??a??u. \n\n'
                    'Va??no je naglasiti da pivo koje stvaramo, radimo i dalje kao da je za nas osobno i ??elimo da zajedno sa '
                    'nama u??ivate u novom pivskom do??ivljaju koji pru??aju na??a piva.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ), ],),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
