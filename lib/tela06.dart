import 'package:flutter/material.dart';
import './tela07.dart';

class Tela06 extends StatefulWidget {
  final String Z, Y, X, l1, titulo;

  const Tela06(this.titulo, this.Y, this.Z, this.X, this.l1, {super.key});

  @override
  _Tela06State createState() => _Tela06State();
}

class _Tela06State extends State<Tela06> {
  String? _dnSelecionado;

  final List<List<String>> dados = [
    ["6", "17.5"],
    ["8", "22.5"],
    ["10", "22.5"],
    ["12", "23"],
    ["14", "23"],
    ["15", "24"],
    ["16", "26.5"],
    ["18", "28.5"],
    ["20", "29.5"],
    ["22", "31"],
    ["24", "32.5"],
    ["25", "34"],
    ["26", "34.5"],
    ["28", "35.5"],
    ["30", "35.5"],
    ["32", "39"],
    ["35", "39"],
    ["38", "42.5"],
    ["40", "45.5"],
    ["48", "56.3"],
    ["50", "57.3"],
    ["55", "62.3"],
    ["58", "65.3"],
    ["60", "66.3"],
    ["65", "67.3"],
    ["68", "69"],
    ["70", "69.3"],
    ["75", "70.3"],
    ["80", "74.3"],
  ];

  void salvar() {
    if (_dnSelecionado != null) {
      // Encontra a linha correspondente ao 'Dn' selecionado.
      final linhaSelecionada = dados.firstWhere(
        (element) => element[0] == _dnSelecionado,
      );
      final valorL = linhaSelecionada[1];

      // Navega para a próxima tela, passando o valor L1.
      String Y = widget.Y;
      String Z = widget.Z;
      String X = widget.X;
      String l1 = widget.l1;

      print('{$Y} +  {$Z} + {$X} + {$l1} + {$valorL}');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Tela07(
            widget.titulo,
            Y,
            Z,
            X,
            l1,
            valorL,
          ), // Substitua ProximaTela pelo nome da sua classe.
        ),
      );
    } else {
      // Opcional: Mostre uma mensagem de erro ou um SnackBar se nada for selecionado.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione um valor de Dn.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Próxima Tela")),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            // ✅ Adicionando um Column para o botão de salvar
            children: [
              Text(
                "7° PASSO:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.blueGrey,
                ),
              ),
              Text(
                "Obter a medida L na tabela de montagem (Selecione o valor correspondente)",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: Color.fromARGB(255, 56, 54, 54),
                ),
              ),
              Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  const TableRow(
                    decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Text(
                          "Dn",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Text(
                          "L",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  ...dados.map((linha) {
                    final dn = linha[0];
                    // ✅ Alteração 3: Destacando a linha selecionada
                    final isSelected = dn == _dnSelecionado;
                    return TableRow(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue.withOpacity(0.3) : null,
                      ),
                      children: [
                        // Célula 'Dn'
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _dnSelecionado = dn;
                              });
                            },
                            child: Text(
                              dn,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: isSelected ? Colors.black : null,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(linha[1], textAlign: TextAlign.center),
                        ),
                      ],
                    );
                  }),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  salvar();
                },

                child: const Text('Próximo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProximaTela extends StatelessWidget {
  final String valorL1;

  const ProximaTela(this.valorL1, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultado')),
      body: Center(
        child: Text(
          'O valor de L1 selecionado é: $valorL1',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
