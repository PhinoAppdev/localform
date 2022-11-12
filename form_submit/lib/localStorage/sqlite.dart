// import 'dart:ffi';
// import 'dart:io';

// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DbHelpers {
//   static Database? _database;
//   static final 
//   Future<Database?> get database async {
//     if (_database != null) {
//       return _database;
//     }
//     _database = await _initDb();
//     return _database;
//   }

//   _initDb() async {
//     Directory documentdir = await getApplicationDocumentsDirectory();
//     String path = join(documentdir.path, 'UserDAtabasedp');
//     return await openDatabase(path, version: 1, onCreate: _oncreate);
//   }

//   DbHelpers.privateCons();
//   static final DbHelpers instance = DbHelpers.privateCons();

//   Future _oncreate(Database db, int version) async {
//     await db.execute('''

// CREATE TABLE IF NOT EXISTS Mylocaldbdp(id INTEGER PRIMARY KEY AUTOINCREMENT, one TEXT,two TEXT , three_a TEXT, three_b TEXT , four TEXT , five_A TEXT , five_a_a TEXT , five_a_b TEXT,  five_a_c TEXT , five_a_d TEXT , five_a_e TEXT, five_a_f TEXT , five_a_g TEXT,  five_a_h TEXT , five_a_i TEXT , five_a_j TEXT ,five_a_k TEXT, five_a_l TEXT, five_b TEXT, five_c_a TEXT, five_c_b TEXT , five_c_c TEXT ,certify_date TEXT ,sign_path_1 TEXT ,sign_path_2 TEXT ,sign_path_3 TEXT, sign_path_4 TEXT ,sign_path_5 TEXT )'
// ''');
//   }

//   Future<int> insert(Map<String, dynamic> row) async {
//     Database? db = await instance.database;
//     return await db.insert(table, row);
//   }
// }
