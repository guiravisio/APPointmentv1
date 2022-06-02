import 'package:appointment/pages/about.dart';
import 'package:appointment/pages/home.dart';
import 'package:appointment/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets/mensagem.dart';

class NovaAulaPage extends StatefulWidget {
  const NovaAulaPage({Key? key}) : super(key: key);

  @override
  _NovaAulaPageState createState() => _NovaAulaPageState();
}

enum MenuItem {
  inicio,
  sobre,
  sair,
}
var nomeUsuario;

class _NovaAulaPageState extends State<NovaAulaPage> {
  var txtNomeAula = TextEditingController();
  var txtDesc = TextEditingController();
  var txtData = TextEditingController();
  var txtHora = TextEditingController();

  //Retonar um documento pelo ID
  retornarDocumentoById(id) async {
    await FirebaseFirestore.instance
        .collection('aulas')
        .doc(id)
        .get()
        .then((doc) {
      txtNomeAula.text = doc.get('nomeAula');
      txtDesc.text = doc.get('dsAula');
      txtData.text = doc.get('data');
      txtHora.text = doc.get('hora');
    });
  }

  @override
  Widget build(BuildContext context) {
    //Recuperar o id do Café
    var id = ModalRoute.of(context)!.settings.arguments;
    if (id != null) {
      if (txtNomeAula.text.isEmpty &&
          txtDesc.text.isEmpty &&
          txtData.text.isEmpty &&
          txtHora.text.isEmpty) {
        retornarDocumentoById(id);
      }
    }

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
      backgroundColor: Colors.white30,
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            campoTexto('Nome da aula', txtNomeAula),
            const SizedBox(height: 20),
            campoTexto('Descrição', txtDesc),
            const SizedBox(height: 40),
            campoTexto('Data', txtData),
            const SizedBox(height: 40),
            campoTexto('Hora', txtHora),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 0, 6, 97),
                    ),
                    child: const Text('Salvar'),
                    onPressed: () {
                      if (id == null) {
                        //Adicionar um novo documento
                        FirebaseFirestore.instance.collection('aulas').add({
                          "uid": FirebaseAuth.instance.currentUser!.uid,
                          "nomeAula": txtNomeAula.text,
                          "dsAula": txtDesc.text,
                          "data": txtData.text,
                          "hora": txtHora.text,
                        });
                        sucesso(context, 'Aula adicionado com sucesso.');
                      } else {
                        FirebaseFirestore.instance
                            .collection('aulas')
                            .doc(id.toString())
                            .set({
                          "uid": FirebaseAuth.instance.currentUser!.uid,
                          "nomeAula": txtNomeAula.text,
                          "dsAula": txtDesc.text,
                          "data": txtData.text,
                          "hora": txtHora.text,
                        });
                        sucesso(context, 'Aula atualizada com sucesso.');
                      }

                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(255, 255, 95, 2),
                  ),
                  width: 150,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: const Text('Cancelar'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  campoTexto(texto, controller, {senha}) {
    return TextField(
      controller: controller,
      obscureText: senha != null ? true : false,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        prefixIconColor: Colors.black,
        labelText: texto,
        labelStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(),
        fillColor: Colors.white,
        focusColor: Colors.black,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 0.0,
          ),
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
