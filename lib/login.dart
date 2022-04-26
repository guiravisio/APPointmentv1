// ignore_for_file: prefer_const_constructors

import 'package:appointment/home.dart';
import 'package:appointment/register.dart';
import 'package:flutter/material.dart';

class FirstPageLogin extends StatefulWidget {
  const FirstPageLogin({Key? key}) : super(key: key);

  @override
  State<FirstPageLogin> createState() => _FirstPageLoginState();
}

class _FirstPageLoginState extends State<FirstPageLogin> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
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
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Entre com sua conta',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blueGrey.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                  );
                                },
                                child: const Text('Entrar'),
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 255, 95, 2),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 20),
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                    )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()),
                                  );
                                },
                                child: const Text('Cadastre-se'),
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 23, 238, 253),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirstPageLogin()),
                        );
                      },
                      child: Text('Esqueceu sua senha?'),
                    ),
                  )
                ],
              ),
            )));
  }
}
