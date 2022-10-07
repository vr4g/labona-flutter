import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:labona_flutter/providers/beers_provider.dart';
import 'package:labona_flutter/screens/home/about_us_screen.dart';
import 'package:labona_flutter/screens/shop/cart_form_screen.dart';
import 'package:labona_flutter/screens/shop/cart_screen.dart';
import 'package:labona_flutter/screens/home/contact_screen.dart';
import 'package:labona_flutter/screens/shop/shop_details_screen.dart';
import 'package:labona_flutter/widgets/persistent_bottom_nav.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BeersProvider>(create: (ctx) => BeersProvider()),
      ],
      child: MaterialApp(
debugShowCheckedModeBanner: false,
        title: 'Labona craft brewery',
        theme: ThemeData(
          fontFamily: 'Inter',
          primaryColor: Colors.greenAccent,
          backgroundColor: Color.fromRGBO(55, 55, 55, 1.0),
          primarySwatch: Colors.blue,
        ),
        home: const PersistentBottomNavBar(),
        routes: {
          ShopDetailsScreen.routeName : (context) => ShopDetailsScreen(),
          AboutUsScreen.routeName : (context) => AboutUsScreen(),
          ContactScreen.routeName: (context) => ContactScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          CartFormScreen.routeName: (context) => CartFormScreen(),
        },
      ),
    );
  }
}

