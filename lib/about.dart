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
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Home(),
                    ));
                  } else if (value == MenuItem.sobre) {
                    Navigator.of(context).pop(MaterialPageRoute(
                      builder: (context) => const Sobre(),
                    ));
                  } else if (value == MenuItem.sair) {
                    Navigator.of(context).pop(MaterialPageRoute(
                      builder: (context) => const FirstPageLogin(),
                    ));
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
          ]),
        ),
      ),
    );
  }
}
