import 'package:flutter/material.dart';
import './tela03.dart';

class Tela02 extends StatefulWidget {
  final String titulo;

  const Tela02(this.titulo, {super.key});

  @override
  _Tela02State createState() => _Tela02State();
}

class _Tela02State extends State<Tela02> {
  TextEditingController txtY = TextEditingController();

  void salvar() {
    String Y = txtY.text, titulo = widget.titulo;
    print('{$Y}');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Tela03(titulo, Y)),
    );
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
                if (txtY.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Por favor, preencha o campo antes de continuar.",
                      ),
                      duration: Duration(
                        seconds: 3,
                      ), // tempo que a mensagem fica visível
                    ),
                  );
                } else if (!RegExp(r'^[0-9.,]+$').hasMatch(txtY.text)) {
                  // Aceita apenas números, ponto e vírgula
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Digite apenas números, ponto ou vírgula."),
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  salvar();
                }
              },
              child: const Text("PRÓXIMO"),
            ),
          ],
        ),
      ),
    );
  }
}
