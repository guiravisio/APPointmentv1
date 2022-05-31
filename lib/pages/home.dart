// ignore_for_file: prefer_const_constructors
import 'package:appointment/pages/novaaula.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appointment/pages/about.dart';
import 'package:appointment/pages/widgets/aulafutura.dart';
import 'package:flutter/material.dart';
import 'package:appointment/pages/widgets/aulawidget.dart';
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
  var aulas;
  var nomeUsuario;

  @override
  void initState() {
    super.initState();
    aulas = FirebaseFirestore.instance
        .collection('aulas')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid);
  }

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
            Column(
              children: [
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
                        FirebaseAuth.instance.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirstPageLogin()),
                        );
                      }
                    },
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              value: MenuItem.inicio, child: Text("Início")),
                          PopupMenuItem(
                              value: MenuItem.sobre, child: Text("Sobre")),
                          PopupMenuItem(
                              value: MenuItem.sair, child: Text("Sair")),
                        ]),
                FutureBuilder(
                  future: retornarUsuarioLogado(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //return const Text('');
                      return const CircularProgressIndicator();
                    } else {
                      return Text(
                        nomeUsuario ?? '',
                        style: const TextStyle(fontSize: 12),
                      );
                    }
                  },
                ),
              ],
            )
          ]),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 900,
          color: Colors.blueGrey.shade800,
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: const Size(200, 45),
                  backgroundColor: Colors.brown,
                ),
                child: const Text('Adicionar nova aula'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NovaAulaPage()),
                  );
                },
              ),
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

  retornarUsuarioLogado() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: uid)
        .get()
        .then((q) {
      if (q.docs.isNotEmpty) {
        nomeUsuario = q.docs[0].data()['nome'];
      } else {
        nomeUsuario = "NENHUM";
      }
    });
  }
}
