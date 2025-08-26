import 'package:flutter/material.dart';

class Tela06 extends StatefulWidget {
  final String Z, Y, X, L1;

  const Tela06(this.Y, this.Z, this.X, this.L1, {super.key});

  @override
  _Tela06State createState() => _Tela06State();
}

class _Tela06State extends State<Tela06> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Tabela Dn')),
        body: const TabelaDn(),
      ),
    );
  }
}

class TabelaDn extends StatelessWidget {
  const TabelaDn({super.key});

  @override
  Widget build(BuildContext context) {
    final List<List<String>> dados = [
      ["10", "20"],
      ["15", "25"],
      ["22", "32"],
      ["50", "60"],
      ["80", "90"],
    ];

    return Center(
      child: SizedBox(
        width: 250, // define a largura máxima da tabela
        child: Table(
          border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(1), // proporcional
            1: FlexColumnWidth(2), // proporcional // proporcional
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            // Cabeçalho
            const TableRow(
              decoration: BoxDecoration(
                color: Color(0xFFE0E0E0),
              ), // fundo cinza
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
                    "L1",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            ...dados.map(
              (linha) => TableRow(
                children: linha
                    .map(
                      (celula) => Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(celula, textAlign: TextAlign.center),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
