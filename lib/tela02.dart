import 'package:flutter/material.dart';
import './tela03.dart';

class Tela02 extends StatefulWidget {
  @override
  _Tela02State createState() => _Tela02State();
}

class _Tela02State extends State<Tela02> {
  TextEditingController txtY = TextEditingController();

  void Salvar() {
    String Y = txtY.text;

    Navigator.push(context, MaterialPageRoute(builder: (context) => Tela03(Y)));
  }

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
              "2° PASSO:",
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
              "Após executar a pré-montagem e marcar a luva, conferir a medida obtida com o paquimetro e adicioná-la ao eixo Y",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                color: Color.fromARGB(255, 56, 54, 54),
              ),
            ),

            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'assets/imagens/segunda.png',
                  width: 400,
                  height: 400,
                ),
                Positioned(
                  top: 70,
                  left: 50,
                  child: SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        const Text(
                          "Y:",
                          style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                        ),
                        Expanded(
                          child: TextField(
                            controller: txtY,
                            decoration: const InputDecoration(
                              hintText: "Digite aqui",
                              border: UnderlineInputBorder(),
                              filled: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                Salvar();
              },
              child: const Text("PRÓXIMO"),
            ),
          ],
        ),
      ),
    );
  }
}
