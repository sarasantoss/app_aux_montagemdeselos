import 'package:flutter/material.dart';

class Tela03 extends StatefulWidget {
  String Y;

  Tela03(this.Y);

  @override
  _Tela03State createState() => _Tela03State();
}

class _Tela03State extends State<Tela03> {
  TextEditingController txtX = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("3° Passo")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        // 💡 Usaremos um SingleChildScrollView para evitar que o conteúdo
        // seja cortado em telas menores quando o teclado aparecer.
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
              const SizedBox(height: 10), // Espaço antes do campo de texto
              Align(
                alignment: Alignment(-0.2, 0.0),
                child: SizedBox(
                  width: 100, // Definimos uma largura para o campo de texto
                  child: Row(
                    children: [
                      const Text("Z:", style: TextStyle(fontSize: 20)),
                      //const SizedBox(width: 2),
                      Expanded(
                        child: TextField(
                          keyboardType:
                              TextInputType.number, // Teclado numérico
                          decoration: const InputDecoration(
                            hintText: "Digite aqui",
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
              // FIM DA ALTERAÇÃO PRINCIPAL 👆
              const SizedBox(height: 14), // Espaço entre o campo e a imagem
              // A imagem agora é um elemento simples na Column.
              Image.asset(
                'assets/imagens/terceira.png',
                width: 110, // Ajuste a largura conforme necessário
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40), // Espaço antes do botão

              ElevatedButton(
                onPressed: () {
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PassoQuatro(), // sua próxima tela
                    ),
                  );*/
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
