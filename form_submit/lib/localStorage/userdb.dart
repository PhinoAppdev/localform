// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:sqflite/sqflite.dart';

import '../models/postdatatointernet.dart';

//  maps;
// final List<Map<String, dynamic>> maps;
// Future List<Map<String, dynamic>?> mylist;
List? userdata;

class UserDatabase {
  void createTable(Database? db) {
    db?.execute(
        'CREATE TABLE IF NOT EXISTS Localuserdatabase(id INTEGER PRIMARY KEY, one TEXT,two TEXT , three_a TEXT, three_b TEXT , four TEXT , five_A TEXT , five_a_a TEXT , five_a_b TEXT,  five_a_c TEXT , five_a_d TEXT , five_a_e TEXT, five_a_f TEXT , five_a_g TEXT,  five_a_h TEXT , five_a_i TEXT , five_a_j TEXT ,five_a_k TEXT, five_a_l TEXT, five_b TEXT, five_c_a TEXT, five_c_b TEXT , five_c_c TEXT ,certify_date TEXT ,sign_path_1 TEXT ,sign_path_2 TEXT ,sign_path_3 TEXT, sign_path_4 TEXT ,sign_path_5 TEXT )');
  }

  Future<int> deleteCustomer(int id, Database db) async {
    return await db.delete("Customer", where: 'id = ?', whereArgs: [id]);
  }

  // Future <List<UserDatabase>

  Future readTable(Database? db) async {
    
    final List<Map<String, dynamic>> maps =
        await db!.query('Localuserdatabase');

    // maps.forEach((elment) {});
    // print(jsonEncode(maps) + 'helo');

    return maps;
  }
// Future <List<LocalUserdatajson>> geLocalData()async{
//   var dbclient= await
// }

  // Future <void> Deleteuers(Database? db,int id)async{

  // }

  // Future<int> DeleteUserdat(int id,Database db) async {

  // }
  // Future<void> deleteUserData(Database? db, String tablename, String id) async {
  //   db!.execuTE te("DELEFROM" + tablename + "WHERE id" + id);
  // }
  Future<List<LocalUserdatajson>?> getUserDatas(Database? db) async {
    final List<Map<String, dynamic>> queryResult =
        await db!.query('Localuserdatabase');
    return queryResult.map((e) => LocalUserdatajson.fromJson(e)).toList();
    // print(queryResult.toString() + 'this is qurey result');
    // return queryResult.
  }
}
