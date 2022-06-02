// ignore_for_file: prefer_const_constructors
import 'package:appointment/pages/novaaula.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appointment/pages/about.dart';
import 'package:appointment/pages/widgets/aulafutura.dart';
import 'package:flutter/material.dart';
import 'package:appointment/pages/widgets/aulawidget.dart';
import 'login.dart';
import 'widgets/mensagem.dart';

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

      //BODY
      ////
      /////
      body: Container(
        padding: const EdgeInsets.all(5),
        color: Colors.blueGrey.shade800,
        // ignore: prefer_const_literals_to_create_immutables
        child: StreamBuilder<QuerySnapshot>(
          //fonte de dados
          stream: aulas.snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: Text('Não foi possível conectar.'));
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context, index) {
                    return exibirDocumento(dados.docs[index]);
                  },
                );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 255, 95, 2),
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NovaAulaPage()),
          );
        },
      ),
    );
  }

  exibirDocumento(item) {
    String nomeAula = item.data()['nomeAula'];
    String dsAula = item.data()['dsAula'];
    String data = item.data()['data'];
    String hora = item.data()['hora'];
    return Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.10,
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(nomeAula,
                style: TextStyle(fontSize: 18, color: Colors.grey.shade800)),
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Text(dsAula,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  overflow: TextOverflow.ellipsis),
            ),
          ]),
          Row(children: [
            Container(
                padding: const EdgeInsets.all(3),
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 125, 241, 160),
                ),
                child: Column(
                  children: [
                    Text(data, style: const TextStyle(fontSize: 12)),
                    Text(hora, style: const TextStyle(fontSize: 20)),
                  ],
                )),
            SizedBox(
              width: 3,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.2,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 6, 97),
                  ),
                  child: Icon(
                    Icons.edit_note,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      'inserir',
                      arguments: item.id,
                    );
                  }),
            ),
          ])
        ],
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
