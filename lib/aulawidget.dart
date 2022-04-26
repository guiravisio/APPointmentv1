// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class AulaWidget extends StatelessWidget {
  //Atributos
  final String nomeAula;
  final String subtitulo;
  final String data;
  final String hora;

  const AulaWidget(this.nomeAula, this.subtitulo, this.data, this.hora,
      {Key? key})
      : super(key: key);

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
            Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                width: 100,
                height: 110,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 2, 255, 78),
                ),
                child: Column(
                  children: [
                    Text(data, style: const TextStyle(fontSize: 16)),
                    Text(hora, style: const TextStyle(fontSize: 26)),
                  ],
                )),
            SizedBox(
              width: 3,
            ),
            Container(
              height: 110,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 255, 95, 2),
              ),
              child: Icon(
                Icons.expand_more,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 35,
              ),
            ),
          ])
        ],
      ),
    );
  }
}
