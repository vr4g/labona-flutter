import 'package:flutter/material.dart';

class CartFormScreen extends StatefulWidget {
  const CartFormScreen({Key? key}) : super(key: key);

  static const routeName = '/cart_form';

  @override
  State<CartFormScreen> createState() => _CartFormScreenState();
}

class _CartFormScreenState extends State<CartFormScreen> {
  var nameController = TextEditingController();

  var addressController = TextEditingController();

  var contactController = TextEditingController();

  var cityController = TextEditingController();

  var postController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          title: const Text("Podaci za dostavu"),
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: deviceWidth * 0.8,
              child: Form(
                key: _formKey  ,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        label: Text(
                          'Ime i prezime',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Unesite ime i prezime';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      controller: nameController,
                      onChanged: (value) {
                        nameController = value as TextEditingController;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        label: Text(
                          'Adresa',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Adresa je obavezna';
                        }
                        return null;
                      },
                      controller: addressController,
                      onChanged: (value) {
                        addressController = value as TextEditingController;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        label: Text(
                          'Grad',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value){

                        if(value == null || value.isEmpty){
                          return 'Grad je obavezan';
                        }
                        return null;
                      },
                      controller: cityController,
                      onChanged: (value) {
                        cityController = value as TextEditingController;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        label: Text(
                          'Poštanski broj',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Poštanski broj je obavezan';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      controller: postController,
                      onChanged: (value) {
                        postController = value as TextEditingController;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        label: Text(
                          'Kontakt broj',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Kontakt broj je obavezan';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      controller: contactController,
                      onChanged: (value) {
                        contactController = value as TextEditingController;
                      },
                    ),
                    SizedBox(
                        width: deviceWidth * .8,
                        child: ElevatedButton(
                          onPressed: () {
                            if(_formKey.currentState!.validate()){

                            }
                          },
                          child: const Text('Nastavi na plaćanje'),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey)),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
