import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'historico_model.dart';

class DatabaseHelper {
  static const _databaseName = "CalculoHistorico.db";

  static const _databaseVersion = 1;

  static const table = 'historico';

  // Nomes das colunas
  static const columnId = 'id';
  static const columnZ = 'z';
  static const columnY = 'y';
  static const columnX = 'x';
  static const columnL1 = 'l1';
  static const columnL = 'l';
  static const columnMedidaMontagem = 'medidaMontagem';
  static const columnDataCalculo = 'dataCalculo';
  static const columnTitulo = 'titulo';

  // Torna esta uma classe singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Abre o banco de dados (e o cria se ele não existir)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // Comando SQL para criar o banco de dados
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnZ TEXT NOT NULL,
            $columnY TEXT NOT NULL,
            $columnX TEXT NOT NULL,
            $columnL1 TEXT NOT NULL,
            $columnL TEXT NOT NULL,
            $columnMedidaMontagem REAL NOT NULL,
            $columnDataCalculo TEXT NOT NULL,
            $columnTitulo TEXT NOT NULL
          )
          ''');
  }

  // Insere um registro no banco de dados
  Future<int> inserir(Historico historico) async {
    Database db = await instance.database;
    return await db.insert(table, historico.toMap());
  }

  // Retorna todos os registros da tabela
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    // Ordena pelo ID em ordem decrescente (mais novo primeiro)
    return await db.query(table, orderBy: '$columnId DESC');
  }
}
