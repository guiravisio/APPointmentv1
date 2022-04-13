// ignore_for_file: prefer_const_constructors

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
            color: Colors.blueGrey.shade800,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.class__outlined,
                    color: Color.fromARGB(255, 255, 95, 2),
                    size: 220.0,
                  ),
                  Text(
                    'Logo da Escola',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Color.fromARGB(255, 255, 95, 2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.5,
                    color: Colors.white,
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
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
