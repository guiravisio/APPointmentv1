// ignore_for_file: sized_box_for_whitespace

import 'package:appointment/pages/home.dart';
import 'package:flutter/material.dart';

class AulaDispo extends StatelessWidget {
  //Atributos
  final String nomeAula;
  final String subtitulo;

  const AulaDispo(this.nomeAula, this.subtitulo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.12,
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Text(nomeAula,
                style: const TextStyle(fontSize: 28, color: Colors.grey)),
            Text(subtitulo,
                style: const TextStyle(fontSize: 18, color: Colors.grey)),
          ]),
          Row(children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: const Text('AGENDAR'),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 95, 2),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  textStyle: TextStyle(
                    fontSize: 20,
                  )),
            ),
            SizedBox(
              width: 3,
            ),
          ])
        ],
      ),
    );
  }
}
