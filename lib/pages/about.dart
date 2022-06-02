// ignore_for_file: prefer_const_constructors

import 'package:appointment/pages/tarefas.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';

class Sobre extends StatefulWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  State<Sobre> createState() => _SobreState();
}

enum MenuItem {
  inicio,
  sobre,
  tarefas,
  sair,
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(
            Icons.class__outlined,
            color: Color.fromARGB(255, 255, 95, 2),
            size: 30.0,
          ),
          title: Text('Sobre'),
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
                  } else if (value == MenuItem.tarefas) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tarefas()),
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
                      PopupMenuItem(
                          value: MenuItem.tarefas, child: Text("tarefas")),
                      PopupMenuItem(value: MenuItem.sair, child: Text("Sair")),
                    ])
          ]),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.blueGrey.shade800,
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sobre o aplicativo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "O APPointment foi desenvolvido para facilitar o agendamento e acompanhamento de aulas particulares e mentorias.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("assets/images/calendar.jpg"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ele pode ser utilizado por colaboradores de uma instituição, professores e alunos, em qualquer dispositivo que tenha acesso à internet. Utilizamos o Framework Flutter para facilitar o desenvolvimento multiplataforma:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("assets/images/flutter.jpg"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Projeto desenvolvido na Fatec de Ribeirão preto pelos alunos:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Guilherme Oliveira",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("assets/images/gui.jpg"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Luan Santos",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("assets/images/luan.jpg"),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
