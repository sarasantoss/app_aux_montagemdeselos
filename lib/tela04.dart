import 'package:flutter/material.dart';
import './tela05.dart';

class Tela04 extends StatefulWidget {
  final String Z, Y, titulo;

  const Tela04(this.titulo, this.Y, this.Z, {super.key});

  @override
  _Tela04State createState() => _Tela04State();
}

class _Tela04State extends State<Tela04> {
  TextEditingController txtX = TextEditingController();

  void salvar() {
    String Y = widget.Y, Z = widget.Z, titulo = widget.titulo, X = txtX.text;

    print('{$Y} +  {$Z} + {$X}');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Tela05(titulo, Y, Z, X)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("4° Passo")),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "4° PASSO:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Montar a sede estacionária na sobreposta",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: Color.fromARGB(255, 56, 54, 54),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "5° PASSO:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Utilizar a sobreposta com a sede estacionária montada para encontrar a medida X. Essa deverá ser com a junta até na face, adicione o valor na imagem abaixo",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: Color.fromARGB(255, 56, 54, 54),
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: SizedBox(
                  width: 400,
                  height: 300,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/imagens/quarta.png',
                          fit: BoxFit.contain,
                        ),
                      ),

                      Align(
                        alignment: Alignment(0.2, -0.2),
                        child: SizedBox(
                          width: 110,
                          child: Row(
                            children: [
                              const Text("X:", style: TextStyle(fontSize: 24)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  controller: txtX,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: "Digite aqui",
                                    border: UnderlineInputBorder(),
                                  ),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  if (txtX.text.isEmpty) {
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
                  } else if (!RegExp(r'^[0-9.,]+$').hasMatch(txtX.text)) {
                    // Aceita apenas números, ponto e vírgula
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Digite apenas números, ponto ou vírgula.",
                        ),
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
      ),
    );
  }
}
