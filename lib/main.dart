import 'package:flutter/material.dart';
import './tela02.dart';

void main() {
  runApp(MaterialApp(home: Tela01()));
}

class Tela01 extends StatefulWidget {
  @override
  _Tela01State createState() => _Tela01State();
}

class _Tela01State extends State<Tela01> {
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
                  MaterialPageRoute(builder: (context) => Tela02()),
                );
              },
              child: const Text("INICIO"),
            ),
          ],
        ),
      ),
    );
  }
}
