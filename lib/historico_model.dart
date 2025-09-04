class Historico {
  int? id; // O ID será gerado automaticamente pelo banco de dados
  final String z;
  final String y;
  final String x;
  final String l1;
  final String l;
  final double medidaMontagem;
  final String dataCalculo;
  final String titulo;

  Historico({
    this.id,
    required this.z,
    required this.y,
    required this.x,
    required this.l1,
    required this.l,
    required this.medidaMontagem,
    required this.dataCalculo,
    required this.titulo,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'z': z,
      'y': y,
      'x': x,
      'l1': l1,
      'l': l,
      'medidaMontagem': medidaMontagem,
      'dataCalculo': dataCalculo,
      'titulo': titulo,
    };
  }

  @override
  String toString() {
    return 'Historico{id: $id, z: $z, y: $y, medidaMontagem: $medidaMontagem, data: $dataCalculo}';
  }
}
