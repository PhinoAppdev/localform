import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHandler {
  static final DatabaseHandler _databaseHandler = DatabaseHandler._internal();
  static Database? _databaseone;
  factory DatabaseHandler() {
    return _databaseHandler;
  }
  DatabaseHandler._internal();
  Future<Database?> openDb() async {
    _databaseone = await openDatabase(
        join(await getDatabasesPath(), 'mylocaldatabase.db'));
    return _databaseone;
  }
  

  
}
