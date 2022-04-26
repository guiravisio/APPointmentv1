import 'package:flutter/material.dart';
import 'aulawidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(
            Icons.class__outlined,
            color: Color.fromARGB(255, 255, 95, 2),
            size: 20.0,
          ),
          title: Text('Início'),
          backgroundColor: Color.fromARGB(255, 0, 6, 97),
          actions: []),
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
                "Aula 6", " Descrição aula 6", "05/03/2022", "19:00")
          ]),
        ),
      ),
    );
  }
}
