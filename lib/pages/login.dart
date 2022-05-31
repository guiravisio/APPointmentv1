// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:appointment/pages/home.dart';
import 'package:appointment/pages/register.dart';
import 'package:appointment/pages/widgets/mensagem.dart';

class FirstPageLogin extends StatefulWidget {
  const FirstPageLogin({Key? key}) : super(key: key);

  @override
  State<FirstPageLogin> createState() => _FirstPageLoginState();
}

class _FirstPageLoginState extends State<FirstPageLogin> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(255, 17, 66, 88),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.class__outlined,
                    color: Color.fromARGB(255, 255, 95, 2),
                    size: 180.0,
                  ),
                  Text(
                    'Logo da Escola',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 255, 95, 2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          campoTexto('Email', txtEmail, Icons.email),
                          const SizedBox(height: 20),
                          campoTexto('Senha', txtSenha, Icons.lock,
                              senha: true),
                          //TextButton(onPressed: (){}, child: const Text('Esqueceu a senha?', textAlign: TextAlign.end,)),
                          const SizedBox(height: 20),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              minimumSize: const Size(200, 45),
                              backgroundColor: Color.fromARGB(255, 255, 95, 2),
                            ),
                            child: const Text('ENTRAR'),
                            onPressed: () {
                              login(txtEmail.text, txtSenha.text);
                            },
                          ),
                          const SizedBox(height: 30),
                          TextButton(
                            style: OutlinedButton.styleFrom(
                              primary: Color.fromARGB(255, 255, 95, 2),
                            ),
                            child: const Text('Criar conta'),
                            onPressed: () {
                              Navigator.pushNamed(context, 'criar_conta');
                            },
                          ),
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

//
// CAMPO DE TEXTO
//
  campoTexto(texto, controller, icone, {senha}) {
    return TextField(
      controller: controller,
      obscureText: senha != null ? true : false,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(icone, color: Color.fromARGB(255, 17, 66, 88)),
        prefixIconColor: Color.fromARGB(255, 17, 66, 88),
        labelText: texto,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 17, 66, 88)),
        border: const OutlineInputBorder(),
        focusColor: Color.fromARGB(255, 17, 66, 88),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 17, 66, 88),
            width: 0.0,
          ),
        ),
      ),
    );
  }

//
// LOGIN com Firebase Auth
//
  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      sucesso(context, 'Usuário autenticado com sucesso.');
      Navigator.pushReplacementNamed(context, 'principal');
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        case 'user-not-found':
          erro(context, 'Usuário não encontrado.');
          break;
        case 'wrong-password':
          erro(context, 'Senha incorreta.');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }
}
