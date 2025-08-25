import 'package:flutter/material.dart';

class Tela05 extends StatefulWidget {
  final String Z, Y, X;

  const Tela05(this.Y, this.Z, this.X, {super.key});

  @override
  _Tela05State createState() => _Tela05State();
}

class _Tela05State extends State<Tela05> {
  TextEditingController txtL1 = TextEditingController();

  /*
  void Salvar() {
    String Y = widget.Y, Z = widget.Z, X = widget.X, L1 = txtL1.text;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Tela05(Y, Z, X, L1)),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("6° Passo")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "6° PASSO:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                "Utilizando o paquimetro medir o anel de encosto para encontrar a medida (L1). O anel de encosto deverá acompanhar o conjunto do selo mecânico. Preencha abaixo: ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: Color.fromARGB(255, 56, 54, 54),
                ),
              ),
              const SizedBox(height: 10), // Espaço antes do campo de texto
              Align(
                alignment: Alignment(-0.1, 0.2),
                child: SizedBox(
                  width: 110, // Definimos uma largura para o campo de texto
                  child: Row(
                    children: [
                      const Text("L1:", style: TextStyle(fontSize: 20)),
                      Expanded(
                        child: TextField(
                          controller: txtL1,
                          keyboardType:
                              TextInputType.number, // Teclado numérico
                          decoration: const InputDecoration(
                            hintText: " Digite aqui",
                            border: UnderlineInputBorder(),
                            filled: false,
                          ),
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Image.asset(
                'assets/imagens/quinta.png',
                width: 78,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PassoQuatro(),
                    ),
                  ); */
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
