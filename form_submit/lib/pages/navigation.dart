import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:form_submit/localStorage/userdb.dart';
import 'package:form_submit/pages/formpage.dart';
import 'package:form_submit/pages/mobilescanner.dart';
import 'package:form_submit/pages/pdflist.dart';
import 'package:form_submit/webservices/webservices.dart';




import 'package:sqflite/sqflite.dart';

import '../localStorage/localstorage.dart';

import '../webservices/webservice.dart';










class MyNavbar extends StatefulWidget {
  const MyNavbar({super.key});

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  Database? _databaseone;
  //database

  //opern
  Future<Database?> openDb() async {
    _databaseone = await DatabaseHandler().openDb();
    return _databaseone;
  }
  //insert

  //read
  List<Map<String, dynamic>>? userdatalist;
  Future<List<Map<String, dynamic>>?> getUserData() async {
    _databaseone = await openDb();
    UserDatabase userDatabase = UserDatabase();
    await userDatabase.readTable(_databaseone);
    userdatalist = await userDatabase.readTable(_databaseone);
    await _databaseone?.close();
    return userdatalist;
  }

  //delet
  Future<void> deleteuserdata(int id) async {
    _databaseone = await openDb();
    final db = _databaseone;

    // db!.execute('DELETE FROM $tblname WHERE ID= $id');
    await db?.delete('Localuserdatabase', where: 'id=?', whereArgs: [id]);
    await _databaseone?.close();
  }

  List<Map<String, dynamic>>? userlist;

  Timer? _timer;
  @override
  void initState() {
    super.initState();
    openDb();
    getUserData();

    userdatalist;

    if (userdatalist != null) {
      print(userdatalist);
      print('getuser data is not empty');
      print(userdatalist?.length);
    }

    print('this is set state');
    // MyNavbar();

    userdatalist;
    openDb();
    getUserData();
    getdata();
    Chkcon();

    _timer = Timer.periodic(Duration(seconds: 15), ((timer) {
      postdataoffline();
    }));
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
    super.dispose();
  }

  //chk conn
  bool activeConnection = false;

  String T = "";
  Chkcon() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      setState(() {
        activeConnection = true;
        print(activeConnection);
      });

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          // activeConnection = false;
          // print(activeConnection);
        });
      }
    } on SocketException catch (_) {
      setState(() {
        activeConnection = false;
        // print(activeConnection);
      });
    }
  }

  postdataoffline() async {
    // deleteuserdata(1);
    // await getUserData();
    // await userdatalist;
    Chkcon();
    userdatalist;
    activeConnection;
    print('helo post data ofline');
    // var userdata = await userdatalist;
    if (userdatalist != null && activeConnection == false) {
      userdatalist?.forEach((element) {
        print(element['one']);
        print(element['id']);
        deleteuserdata(element['id']);
      });
    }

    if (userdatalist?.length != 0 && activeConnection == true) {
      print('entering in loop');
      var count = userdatalist?.length;

      userdatalist?.forEach((element) async {
        print('this is running in my offline post ');

        // print('in loop ' + element['id']);
        print(element['id'].toString() + 'in loop');

        print(element['one'].toString());
        await postData(
          element['one'],
          element['two'],
          element['three_a'],
          element['three_b'],
          element['four'],
          element['five_A'],
          element['five_a_a'],
          element['five_a_b'],
          element['five_a_c'],
          element['five_a_d'],
          element['five_a_e'],
          element['five_a_f'],
          element['five_a_g'],
          element['five_a_h'],
          element['five_a_i'],
          element['five_a_j'],
          element['five_a_k'],
          element['five_a_l'],
          element['five_b'],
          element['five_c_a'],
          element['five_c_b'],
          element['five_c_c'],
          element['certify_date'],
          element['sign_path_1'],
          element['sign_path_2'],
          element['sign_path_3'],
          element['sign_path_4'],
          element['sign_path_5'],
        );

        deleteuserdata(element['id']);
        print(element['id'].toString() + 'in dlt');
        print('in local');
      });

      print('may be send');
    }

    if (userdatalist?.length == 0) {
      print('user datallist is null');
    }
    if (userdatalist?.length != 0) {
      print('post userdatlist is not null bro');
    }
    if (activeConnection == false) {
      print('post net  is off');
    }
    if (userdatalist?.length != 0 && activeConnection == false) {
      print('data is off but userlist is ' + userdatalist!.length.toString());
    }
    if (activeConnection == true) {
      print('post data online');
    }
  }

  List? myuserllist;
  getdata() async {
    userdatalist;
    print('im from getdata');
    if (userdatalist != null) {
      userdatalist!.forEach((element) {
        print(element['id'].toString() + 'helo times');
      });
    }
  }

  final GlobalKey qrkey = GlobalKey(debugLabel: 'QR');

  bool isqr = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        // backgroundColor: Color.fromARGB(218, 231, 224, 243),
        appBar: AppBar(
          title: const Text('Smartest Consultants'),
          centerTitle: true,
          backgroundColor: Colors.purple[400],
          actions: [
            IconButton(
                onPressed: () async {
                  // const ScanQrPage();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    // return ScanQrPage();
                    return mobilscanner();
                    // return const QRViewExample();
                    // return  QRScanPage();
                    // return  MyHomePage();
                  }));
                },
                icon: const Icon(Icons.qr_code_2))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  InkWell(
                    onTap: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const FormSubmitPage();
                      }));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.width / 3,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                          color: Colors.purple[100],
                          borderRadius: BorderRadius.circular(7)),
                      child: Center(
                        child: Container(
                          constraints:
                              const BoxConstraints(minHeight: 0, maxHeight: 60),
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: const Text(
                            'Form 11',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const PdfList();
                      }));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.width / 3,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                          color: Colors.purple[100],
                          borderRadius: BorderRadius.circular(7)),
                      child: Center(
                        child: Container(
                          constraints:
                              const BoxConstraints(minHeight: 0, maxHeight: 60),
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: const Text(
                            'View Reports',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
