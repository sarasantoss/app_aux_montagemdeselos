import 'package:flutter/material.dart';
import './tela01.dart';
import './tela_historico.dart';

void main() {
  runApp(MaterialApp(home: Inicio()));
}

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "MÉTODO DE MONTAGEM DE SELOS PASSO A PASSO",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 24),
            Image.asset('assets/imagens/primeira.png', width: 300, height: 300),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tela01()),
                );
              },
              child: const Text("INICIO"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaHistorico()),
                );
              },

              child: const Text('HISTÓRICO'),
            ),
          ],
        ),
      ),
    );
  }
}
