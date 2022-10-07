import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key, required this.description})
      : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    const descriptionColor = Colors.white;
    return Center(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * .9,
              height: 100,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width * .35,
                    child: Image.network(
                        'https://images.unsplash.com/photo-1608270586620-248524c67de9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVlciUyMGdsYXNzfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                        fit: BoxFit.fill)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 10),
                        height: 83,
                        width: MediaQuery.of(context).size.width * .55,
                        child: Text(description,
                            style: const TextStyle(color: descriptionColor))),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        child: const Text(
                          "Pročitaj više...",
                          style:
                          TextStyle(color: descriptionColor, fontSize: 14),
                          textAlign: TextAlign.right,
                        ))
                  ],
                )
              ]),
            ),
          );
  }
}
