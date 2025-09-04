import 'package:flutter/material.dart';
import 'database_helper.dart';
import './main.dart';

class TelaHistorico extends StatefulWidget {
  const TelaHistorico({super.key});

  @override
  _TelaHistoricoState createState() => _TelaHistoricoState(); // ...
}

class _TelaHistoricoState extends State<TelaHistorico> {
  // ... _carregarHistorico e initState ...

  final dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> _historicoCompleto = [];

  @override
  void initState() {
    super.initState();
    _carregarHistorico();
  }

  void _carregarHistorico() async {
    final todosRegistros = await dbHelper.queryAllRows();
    setState(() {
      _historicoCompleto = todosRegistros;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Histórico de Cálculos')),

      body: Column(
        children: [
          // Botão sempre visível
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Inicio()),
                );
              },
              child: const Text('INICIO'),
            ),
          ),

          // Espaço para lista ou mensagem
          Expanded(
            child: _historicoCompleto.isEmpty
                ? const Center(
                    child: Text(
                      'Nenhum cálculo foi salvo ainda.',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: _historicoCompleto.length,
                    itemBuilder: (context, index) {
                      final item = _historicoCompleto[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item[DatabaseHelper.columnTitulo],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Em: ${item[DatabaseHelper.columnDataCalculo]}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              const Divider(height: 20),
                              Text(
                                'Resultado: ${item[DatabaseHelper.columnMedidaMontagem].toStringAsFixed(2)} mm',
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Valores: Z=${item['z']}, Y=${item['y']}, X=${item['x']}, L1=${item['l1']}, L=${item['l']}',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
