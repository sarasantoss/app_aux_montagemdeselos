import 'package:flutter/material.dart';
import './tela02.dart';

class Tela01 extends StatefulWidget {
  @override
  _Tela01State createState() => _Tela01State();
}

class _Tela01State extends State<Tela01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Próxima Tela")),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "1° PASSO:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Fazer a pré-montagem da bomba sem o selo mecânico, com a luva ajustada ao eixo em seguida, dar o aperto necessário usando o rotor ",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                color: Color.fromARGB(255, 56, 54, 54),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Fazer uma marcação de referência na luva ou eixo da bomba paralela a caixa de selagem, conforme desenho abaixo ",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                color: Color.fromARGB(255, 56, 54, 54),
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
              child: const Text("PRÓXIMO"),
            ),
          ],
        ),
      ),
    );
  }
}
