import 'package:flutter/material.dart';
import './tela04.dart';

class Tela03 extends StatefulWidget {
  final String Y, titulo;

  const Tela03(this.titulo, this.Y, {super.key});

  @override
  _Tela03State createState() => _Tela03State();
}

class _Tela03State extends State<Tela03> {
  final TextEditingController txtZ = TextEditingController();

  @override
  void dispose() {
    txtZ.dispose(); // libera memória
    super.dispose();
  }

  void salvar() {
    String Y = widget.Y, titulo = widget.titulo, Z = txtZ.text;

    print('$Y + $Z');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Tela04(titulo, Y, Z)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("3° Passo")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "3° PASSO:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Encontrar a medida Z que será a medida da face da sede estacionária até atrás do anel Dring, insira o valor de 'Z' no desenho abaixo",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: Color.fromARGB(255, 56, 54, 54),
                ),
              ),
              const SizedBox(height: 20),

              // Campo de entrada Z
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // centraliza o conteúdo
                children: [
                  const Text("Z:", style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 8), // espaço entre o texto e o campo
                  SizedBox(
                    width: 120, // define a largura do campo
                    child: TextField(
                      controller: txtZ,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Digite aqui",
                        border: UnderlineInputBorder(),
                      ),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Imagem ilustrativa
              Image.asset(
                'assets/imagens/terceira.png',
                width: 100,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40),

              // Botão próximo
              ElevatedButton(
                onPressed: () {
                  if (txtZ.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Por favor, preencha o campo antes de continuar.",
                        ),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  } else if (!RegExp(r'^[0-9.,]+$').hasMatch(txtZ.text)) {
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text("PRÓXIMO", style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
