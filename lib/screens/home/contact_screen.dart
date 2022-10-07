import 'package:flutter/material.dart';


class ContactScreen extends StatefulWidget {
  ContactScreen({Key? key}) : super(key: key);

  static const routeName = '/contact';

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  final _formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var contactController = TextEditingController();

  var emailController = TextEditingController();

  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('images/logo.png'),
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'LABONA CRAFT BREWERY \n'
                'A: Štrmac 1, 52220 Labin - HR \n'
                'E: info@labona.hr \n'
                'T: +385 99 4965 785',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'PROIZVODI I PUNI: \n'
                'Meles Factory d.o.o. ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("KONTAKTIRAJTE NAS",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: deviceWidth * 0.8,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: deviceWidth * 0.8,
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 5.0, right: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "IME I PREZIME",
                                  style: const TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                    //height: 28,
                                    child: TextFormField(
                                        controller: nameController,
                                        onChanged: (value) {
                                          nameController =
                                              value as TextEditingController;
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {}
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            isDense: true),
                                        maxLines: 1,
                                        style: const TextStyle(fontSize: 14))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: deviceWidth * 0.4,
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, left: 5.0, right: 5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "TELEFON",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                        //height: 28,
                                        child: TextFormField(
                                            controller: contactController,
                                            onChanged: (value) {
                                              contactController = value
                                                  as TextEditingController;
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {}
                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                isDense: true),
                                            maxLines: 1,
                                            style:
                                                const TextStyle(fontSize: 14))),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: deviceWidth * 0.4,
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, left: 5.0, right: 5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "EMAIL",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                        //height: 28,
                                        child: TextFormField(
                                            controller: emailController,
                                            onChanged: (value) {
                                              emailController = value
                                                  as TextEditingController;
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {}
                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                isDense: true),
                                            maxLines: 1,
                                            style:
                                                const TextStyle(fontSize: 14))),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: deviceWidth * 0.8,
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 5.0, right: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "PORUKA",
                                  style: const TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                    width: deviceWidth * 0.7,
                                    child: TextFormField(
                                        controller: messageController,
                                        onChanged: (value) {
                                          messageController =
                                              value as TextEditingController;
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {}
                                          return null;
                                        },
                                        maxLines: null,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true,
                                        ),
                                        style: const TextStyle(fontSize: 14))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4.0, right: 4),
                            child: SizedBox(
                                width: deviceWidth,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                backgroundColor:
                                                    Colors.blueGrey,
                                                duration: Duration(
                                                    milliseconds: 2500),
                                                content: Text(
                                                  'Unesite sve podatke',
                                                  textAlign: TextAlign.center,
                                                )));
                                      }

                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.grey)),
                                    child: Text("Pošalji"))),
                          ))
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    ));
  }
}
