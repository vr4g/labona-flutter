import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:labona_flutter/screens/home/about_us_screen.dart';
import 'package:labona_flutter/screens/home/contact_screen.dart';
import 'package:labona_flutter/widgets/home_widgets/news_list.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri fbProtocolUrl = Uri.parse('fb://page/?id=107622175137886');
    final Uri fbFallbackUrl =
        Uri.parse('https://www.facebook.com/labonacraftbrewery');
    final Uri instaProtocolUrl =
        Uri.parse('instagram://user?username=labonacraftbrewery');
    final Uri instaFallbackUrl =
        Uri.parse('https://www.instagram.com/labonacraftbrewery');
    var deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: SizedBox(
            width: deviceWidth * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        //width: deviceWidth * 0.3,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                pushNewScreenWithRouteSettings(
                                  context,
                                  settings: const RouteSettings(
                                      name: AboutUsScreen.routeName),
                                  screen: const AboutUsScreen(),
                                  withNavBar: true,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: const SizedBox(
                                height: 50,
                                child: Center(
                                  child: Text("O NAMA",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontFamily: 'Gabriela')),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                pushNewScreenWithRouteSettings(
                                  context,
                                  settings: const RouteSettings(
                                      name: ContactScreen.routeName),
                                  screen: ContactScreen(),
                                  withNavBar: true,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              child: const SizedBox(
                                height: 50,
                                child: Center(
                                  child: Text("KONTAKTI",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontFamily: 'Gabriela')),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 5),
                          child: Image(
                            image: AssetImage('images/logo.png'),
                            //width: deviceWidth * 0.4,
                            height: 100,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        //width: deviceWidth * 0.3,
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  try {
                                    bool launched =
                                        await launchUrl(instaProtocolUrl);

                                    if (!launched) {
                                      bool launched =
                                          await launchUrl(instaFallbackUrl);
                                    }
                                  } catch (e) {
                                    await launchUrl(instaFallbackUrl);
                                  }
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.white,
                                  size: 35,
                                )),
                            IconButton(
                                onPressed: () async {
                                  try {
                                    bool launched =
                                        await launchUrl(fbProtocolUrl);

                                    if (!launched) {
                                      bool launched =
                                          await launchUrl(fbFallbackUrl);
                                    }
                                  } catch (e) {
                                    await launchUrl(fbFallbackUrl);
                                  }
                                },
                                icon: const Icon(
                                  Icons.facebook_outlined,
                                  color: Colors.white,
                                  size: 35,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                  SizedBox(
                    width: 15,
                  ),
                ]),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  color: const Color.fromRGBO(74, 74, 74, 1),
                  child: const Text(
                    "CRAFT JE OPET IN!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'Gabriela',
                    ),
                  ),
                ),
                // const Divider(height: 10, thickness: 1, color: Colors.grey),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                    width: double.infinity,
                    child: Text("NOVOSTI",
                        style: TextStyle(
                            color: Color.fromRGBO(138, 126, 75, 1),
                            fontFamily: 'Gabriela',
                            fontSize: 22))),
                const SizedBox(
                  height: 5,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('news')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  snapshot.data!.docs[index];
                              return Column(
                                children: [
                                  NewsList(
                                      description:
                                          documentSnapshot['description']),
                                  const Divider(
                                    height: 10,
                                    thickness: 1,
                                    color: Colors.grey,
                                  )
                                ],
                              );
                            },
                            itemCount: snapshot.data?.docs.length,
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
