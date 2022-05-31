// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appointment/pages/home.dart';
import 'package:appointment/pages/login.dart';
import 'package:appointment/pages/widgets/mensagem.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('APPointment'),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 255, 95, 2)),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(255, 17, 66, 88),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.55,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          campoTexto('Nome', txtNome, Icons.people),
                          const SizedBox(height: 20),
                          campoTexto('Email', txtEmail, Icons.email),
                          const SizedBox(height: 20),
                          campoTexto('Senha', txtSenha, Icons.lock,
                              senha: true),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 150,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    primary: Colors.white,
                                    minimumSize: const Size(200, 45),
                                    backgroundColor: Colors.brown,
                                  ),
                                  child: const Text('criar'),
                                  onPressed: () {
                                    criarConta(txtNome.text, txtEmail.text,
                                        txtSenha.text);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    primary: Colors.white,
                                    minimumSize: const Size(200, 45),
                                    backgroundColor: Colors.brown,
                                  ),
                                  child: const Text('cancelar'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
            )));
  }

  campoTexto(texto, controller, icone, {senha}) {
    return TextField(
      controller: controller,
      obscureText: senha != null ? true : false,
      style: const TextStyle(
        color: Colors.brown,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(icone, color: Colors.brown),
        prefixIconColor: Colors.brown,
        labelText: texto,
        labelStyle: const TextStyle(color: Colors.brown),
        border: const OutlineInputBorder(),
        focusColor: Colors.brown,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.brown,
            width: 0.0,
          ),
        ),
      ),
    );
  }

  //
  // CRIAR CONTA no Firebase Auth
  //
  void criarConta(nome, email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      //Armazenar o nome no Firestore
      FirebaseFirestore.instance.collection('usuarios').add({
        "uid": res.user!.uid.toString(),
        "nome": nome,
      });

      sucesso(context, 'Usuário criado com sucesso.');
      Navigator.pop(context);
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          erro(context, 'O email já foi cadastrado.');
          break;
        case 'invalid-email':
          erro(context, 'O email é inválido.');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }
}
