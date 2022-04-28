// ignore_for_file: prefer_const_constructors

import 'package:appointment/about.dart';
import 'package:appointment/aulafutura.dart';
import 'package:flutter/material.dart';
import 'aulawidget.dart';
import 'login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

enum MenuItem {
  inicio,
  sobre,
  sair,
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(
            Icons.class__outlined,
            color: Color.fromARGB(255, 255, 95, 2),
            size: 30.0,
          ),
          title: Text('Início'),
          backgroundColor: Color.fromARGB(255, 0, 6, 97),
          actions: [
            PopupMenuButton(
                onSelected: (value) {
                  if (value == MenuItem.inicio) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  } else if (value == MenuItem.sobre) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Sobre()),
                    );
                  } else if (value == MenuItem.sair) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstPageLogin()),
                    );
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                          value: MenuItem.inicio, child: Text("Início")),
                      PopupMenuItem(
                          value: MenuItem.sobre, child: Text("Sobre")),
                      PopupMenuItem(value: MenuItem.sair, child: Text("Sair")),
                    ])
          ]),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 900,
          color: Colors.blueGrey.shade800,
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Próximas aulas",
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const AulaWidget(
                "Aula 4", " Descrição aula 4", "19/02/2022", "19:00"),
            const AulaWidget(
                "Aula 5", " Descrição aula 5", "26/02/2022", "19:00"),
            const AulaWidget(
                "Aula 6", " Descrição aula 6", "05/03/2022", "19:00"),
            SizedBox(
              height: 20,
            ),
            Text(
              "Aulas disponíveis para agendar",
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const AulaDispo("Aula 7", "Descrição da aula 7"),
            const AulaDispo("Aula 8", "Descrição da aula 8"),
          ]),
        ),
      ),
    );
  }
}
