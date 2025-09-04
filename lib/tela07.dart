import 'package:flutter/material.dart';
import 'package:montagem/main.dart';
import './database_helper.dart';
import './historico_model.dart';
import 'package:intl/intl.dart';
import './tela_historico.dart';
import './main.dart';

class Tela07 extends StatefulWidget {
  final String Z, Y, X, L1, L, titulo;

  const Tela07(this.titulo, this.Y, this.Z, this.X, this.L1, this.L);

  @override
  _Tela07State createState() => _Tela07State();
}

class _Tela07State extends State<Tela07> {
  double medidaMontagem = 0;

  @override
  void initState() {
    super.initState();
    // É uma boa prática fazer o cálculo apenas uma vez quando a tela é iniciada
    try {
      _calcularESalvar();
    } catch (erro, stacktrace) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Erro ao realizar o cálculo, tente novamente.\nDetalhes: ${erro.toString()}",
          ),
          duration: Duration(seconds: 3),
        ),
      );

      print(stacktrace);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Inicio()),
      );
    }
  }

  void _calcularESalvar() {
    // 1. Conversão dos valores
    final medZ = double.parse((widget.Z).replaceAll(',', '.'));
    final medY = double.parse((widget.Y).replaceAll(',', '.'));
    final medX = double.parse((widget.X).replaceAll(',', '.'));
    final medL1 = double.parse((widget.L1).replaceAll(',', '.'));
    final medL = double.parse(widget.L);

    // 2. Cálculo
    final n = medL - medZ - medX;
    final resultadoFinal = medY - n - medL1;

    // Atualiza o estado da tela para exibir o resultado
    setState(() {
      medidaMontagem = resultadoFinal;
    });

    // 3. Salvar no banco de dados
    _salvarNoHistorico();
  }

  void _salvarNoHistorico() async {
    // Pega a data e hora atual e formata
    String dataFormatada = DateFormat(
      'dd/MM/yyyy HH:mm',
    ).format(DateTime.now());

    // Cria o objeto Historico com todos os
    // dados
    Historico novoRegistro = Historico(
      titulo: widget.titulo,
      z: widget.Z,
      y: widget.Y,
      x: widget.X,
      l1: widget.L1,
      l: widget.L,
      medidaMontagem: medidaMontagem,
      dataCalculo: dataFormatada,
    );

    // Instancia o nosso helper e insere os dados
    final dbHelper = DatabaseHelper.instance;
    final id = await dbHelper.inserir(novoRegistro);

    // Mostra uma mensagem de confirmação (opcional)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cálculo salvo no histórico com ID: $id')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resultado do Cálculo")),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Valores de Entrada:\n'
              'Z = ${widget.Z}mm\n'
              'Y = ${widget.Y}mm\n'
              'X = ${widget.X}mm\n'
              'L1 = ${widget.L1}mm\n'
              'L = ${widget.L}mm\n\n'
              'Resultado:\n'
              'Medida de montagem = ${medidaMontagem.toStringAsFixed(2)} mm',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaHistorico()),
                );
              },
              child: const Text('Histórico'),
            ),
          ],
        ),
      ),
    );
  }
}
