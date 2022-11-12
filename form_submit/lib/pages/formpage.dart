import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_submit/localStorage/localstorage.dart';
import 'package:form_submit/localStorage/userdb.dart';
import 'package:form_submit/models/formmodeldb.dart';
import 'package:form_submit/models/postdatatointernet.dart';
import 'package:form_submit/pages/navigation.dart';
import 'package:form_submit/pages/pdflist.dart';
import 'package:form_submit/webservices/webservices.dart';

import 'package:intl/intl.dart';
import 'package:sqflite/sqlite_api.dart';
import 'dart:io';
import '../models/models.dart';
import '../models/postdatamodel.dart';

int signarturnumber = 0;
int signarturnumbertwo = 0;
int signarturnumberthree = 0;
int signarturnumberfour = 0;
int signarturnumberfive = 0;

class FormSubmitPage extends StatefulWidget {
  const FormSubmitPage({super.key});

  @override
  State<FormSubmitPage> createState() => _FormSubmitPageState();
}

class _FormSubmitPageState extends State<FormSubmitPage> {
  // late ObjectBox objectBox;
  // late Stream<List<LocalUserdatajson>> useStreamlist;

  Database? _databaseone;
  final _formKey = GlobalKey<FormState>();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController one = TextEditingController();
  TextEditingController two = TextEditingController();
  TextEditingController three = TextEditingController();
  TextEditingController four = TextEditingController();
  TextEditingController five = TextEditingController();
  TextEditingController six = TextEditingController();
  TextEditingController seven = TextEditingController();
  TextEditingController eight = TextEditingController();
  TextEditingController nine = TextEditingController();
  TextEditingController ten = TextEditingController();
  TextEditingController five_A = TextEditingController();

  String radioValueone = 'Not Applicable';
  String radiovaluetwo = 'Not Applicable';
  String radiovaluethree = 'Not Applicable';
  String radioValuefrou = 'Not Applicable';
  String radioValuefive = 'Not Applicable';
  String radioValuesix = 'Not Applicable';
  String radioValueseven = 'Not Applicable';
  String radioValueeight = 'Not Applicable';
  String radioValuenine = 'Not Applicable';
  String radioValueten = 'Not Applicable';
  String radioValueeleven = 'Not Applicable';
  String radioValuetwelwe = 'Not Applicable';
  bool isloading = true;
  String errorMessage = '';
  bool? forward;
  var getresult;
  var getpdff;
  var responseyorno = 'n';
  bool isloadinpage = false;
  // DbHelper? dbHelper;
  Future<List<LocalUserdatajson>>? userLocalData;

  postformdata() async {
    var res = await postData(
      one.text,
      two.text,
      three.text,
      dateInput.text,
      four.text,
      five_A.text,
      radioValueone,
      radiovaluetwo,
      radiovaluethree,
      radioValuefrou,
      radioValuefive,
      radioValuesix,
      radioValueseven,
      radioValueeight,
      radioValuenine,
      radioValueten,
      radioValueeleven,
      radioValuetwelwe,
      five.text,
      six.text,
      seven.text,
      eight.text,
      bottomDate.text,
      signarturnumber != 0 ? signatures[signarturnumber] : '',
      signarturnumbertwo != 0 ? signatures[signarturnumbertwo] : '',
      signarturnumberthree != 0 ? signatures[signarturnumberthree] : '',
      signarturnumberfour != 0 ? signatures[signarturnumberfour] : '',
      signarturnumberfive != 0 ? signatures[signarturnumberfive] : '',
    );
    setState(() {
      getresult = Postmodeldata.fromJson(res);
      errorMessage = getresult.message.toString();
      forward = getresult.error;
    });
    return getresult;
  }

  homepage() async {
    var res = await getpdf();
    setState(() {
      getpdff = Categorymodels.fromJson(res);
      isloading = false;
      clearText();
    });
    return getpdf;
  }

  var mypostdata;
  mydata() async {
    setState(() {
      if (data != null) {
        mypostdata = Postmodeldata.fromJson(data);
        isloading = false;
      }
    });

    return mypostdata;
  }

  @override
  TextEditingController dateInput = TextEditingController();
  TextEditingController bottomDate = TextEditingController();
  TextEditingController techsign = TextEditingController();
  @override
  void clearText() {
    // TODO: implement dispose
    one.clear();
    two.clear();
    three.clear();
    four.clear();
    five.clear();
    six.clear();
    seven.clear();
    eight.clear();
    nine.clear();
    five_A.clear();
    dateInput.clear();
    bottomDate.clear();
  }

  static const List<String> mydropdownlist = <String>[
    'Select',
    'Person one',
    'Person two',
    'Person three',
    'Person four',
    'Person five',
  ];

  List signlist = [
    'Person one sign',
    'Person two sign ',
    'Person three sign',
    'Person four sign ',
    'Person five sign ',
  ];

  String dropdownValueone = mydropdownlist.first;
  String dropdownValuetwo = mydropdownlist.first;
  String dropdownValuethree = mydropdownlist.first;
  String dropdownValuefour = mydropdownlist.first;
  String dropdownValuefive = mydropdownlist.first;

  //check internect connection

  bool activeConnection = false;
  String T = "";
  Chkcon() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      setState(() {
        activeConnection = true;
      });

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {});
      }
    } on SocketException catch (_) {
      setState(() {
        activeConnection = false;
      });
    }
  }

//database

  Future<Database?> openDb() async {
    _databaseone = await DatabaseHandler().openDb();
    return _databaseone;
  }

//delete
  Future<void> deleteuserdata(int id) async {
    _databaseone = await openDb();
    final db = await _databaseone;
    // var tblname = 'Localuserdatabase';

    await db?.delete('Localuserdatabase', where: 'id=?', whereArgs: [id]);
  }
  //

// INSERT
  Future<void> insertDB() async {
    _databaseone = await openDb();
    UserDatabase userDatabase = new UserDatabase();
    userDatabase.createTable(_databaseone);
    LocalStorageModel localStorageModel = LocalStorageModel(
      one: one.text,
      two: two.text,
      three_a: three.text,
      three_b: dateInput.text,
      four: four.text,
      five_A: five_A.text,
      five_a_a: radioValueone,
      five_a_b: radiovaluetwo,
      five_a_c: radiovaluethree,
      five_a_d: radioValuefrou,
      five_a_e: radioValuefive,
      five_a_f: radioValuesix,
      five_a_g: radioValueseven,
      five_a_h: radioValueeight,
      five_a_i: radioValuenine,
      five_a_j: radioValueten,
      five_a_k: radioValueeleven,
      five_a_l: radioValuetwelwe,
      five_b: five.text,
      five_c_a: six.text,
      five_c_b: seven.text,
      five_c_c: eight.text,
      certify_date: bottomDate.text,
      sign_path_1: signarturnumber != 0 ? signatures[signarturnumber] : '',
      sign_path_2:
          signarturnumbertwo != 0 ? signatures[signarturnumbertwo] : '',
      sign_path_3:
          signarturnumberthree != 0 ? signatures[signarturnumberthree] : '',
      sign_path_4:
          signarturnumberfour != 0 ? signatures[signarturnumberfour] : '',
      sign_path_5:
          signarturnumberfive != 0 ? signatures[signarturnumberfive] : '',
    );
    await _databaseone?.insert('Localuserdatabase', localStorageModel.toMap());
    await _databaseone?.close();
  }

// read data
  List<Map<String, dynamic>>? userdatalist;
  Future<void> getUserData() async {
    _databaseone = await openDb();
    UserDatabase userDatabase = UserDatabase();
    await userDatabase.readTable(_databaseone);
    userdatalist = await userDatabase.readTable(_databaseone);
    // return userdatalist;
    await _databaseone?.close();
  }

  void initState() {
    openDb();
    Chkcon();
    getUserData();
    postdataoffline();
    mydata();
    myresponse;
    // getpdf();
    data != null ? data : null;
    responseyorno = 'n';
    mypostdata != null ? mypostdata : null;
    signarturnumber = 0;
    signarturnumbertwo = 0;
    signarturnumberthree = 0;
    signarturnumberfour = 0;
    signarturnumberfive = 0;
    super.initState();
    postdataoffline();
    userLocalData;
    // useStreamlist = objectBox.getusers();
    // print(useStreamlist);
  }

  // loadDAta() async {
  //   userLocalData = dbHelper?.getLocalData();
  // }

  postdataoffline() async {
    await getUserData();
    userdatalist;
    activeConnection;

    if (userdatalist != null && activeConnection == true) {
      userdatalist?.forEach((element) async {
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
      });
    }
    if (userdatalist!.isEmpty) {}
    if (activeConnection == false) {}
    if (userdatalist != null && activeConnection == false) {}
    if (activeConnection == true) {}
  }

  @override
  Widget build(BuildContext context) {
    // print(useStreamlist);
    myresponse;
    mydata();

    data;

    BoxDecoration mybodedxdecoration = const BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colors.grey,
          blurRadius: 5.0,
          spreadRadius: 0.8,
          offset: Offset(0, 2)),
    ], color: Colors.white);
    TextStyle mytextstyle = TextStyle(color: Colors.purple[300], fontSize: 18);
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[50],
        // elevation: 0,
        title: Text(
          ' Form 11',
          style: TextStyle(color: Colors.purple[300]),
        ),
        leading: IconButton(
          onPressed: (() {
            Navigator.pop(context);
          }),
          icon: const Icon(Icons.arrow_back),
          color: Colors.purple[300],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please fill the form',
                  style: TextStyle(fontSize: 20, color: Colors.purple[300]),
                ),

                const SizedBox(
                  height: 40,
                ),
                myformtextfield(mytextstyle, mybodedxdecoration,
                    '1. Name of the Occupier', one),
                myformtextfield(mytextstyle, mybodedxdecoration,
                    '2. Name & address of the Factory', two),
                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    '3.(a) Type Identification number and description of hoist, lift'
                    'lifting machine, chains, ropes and lifting tackles.',
                    three),
//
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    '3.(b) Date of Constuction or Reconstruction and the date when  hoist, lift, lifting machine, chains, ropes, and lifting tackles',
                    style: mytextstyle,
                  ),
                ),

                Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: mybodedxdecoration,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding:
                        const EdgeInsets.only(bottom: 2, left: 20, right: 30),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('yyyy/MM/dd').format(pickedDate);

                                setState(() {
                                  dateInput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                            icon: Icon(
                              Icons.calendar_month,
                              color: Colors.deepPurple[500],
                            )),
                        Container(
                          height: 50,
                          width: 150,
                          // color: Colors.amber,
                          child: TextFormField(
                              enabled: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter text';
                                }
                                return null;
                              },
                              controller: dateInput,
                              decoration: InputDecoration(
                                  errorStyle: const TextStyle(
                                      color: Colors.redAccent, fontSize: 15),
                                  hintStyle: TextStyle(
                                      fontSize: 17,
                                      color: Colors.deepPurple[300]),
                                  hintText: DateTime.now().toString(),
                                  border: InputBorder.none)),
                        )
                      ],
                    )),
                const Divider(),
                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    '4. Date of last examinations made under section 28 (1)(a)(ii)'
                    'and 29 (1) (a) (iii) and by whom it was carried out.',
                    four),
                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    '5.(A) Maintenance: (List of parts, if any, which were inaccessible)'
                    'Are the following parts of the hoist of lift properly maintained'
                    'and in good working order? If not, state what defects havebeen found:-',
                    five),

                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(a) Enclosure of hoistway or lift.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                // height: 30,
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValueone,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueone = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 120,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValueone,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueone = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(b) Landing gates and cage gate(s).',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radiovaluetwo,
                                  onChanged: (value) {
                                    setState(() {
                                      radiovaluetwo = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 120,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radiovaluetwo,
                                  onChanged: (value) {
                                    setState(() {
                                      radiovaluetwo = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(c) Interlocks on the landing gates and cage gate(s).(d) Other gates fastenings.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radiovaluethree,
                                  onChanged: (value) {
                                    setState(() {
                                      radiovaluethree = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                width: 120,
                                // height: 30,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radiovaluethree,
                                  onChanged: (value) {
                                    setState(() {
                                      radiovaluethree = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(d) Other gates fastenings.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValuefrou,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuefrou = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 120,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValuefrou,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuefrou = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(e) Cage and platform and fittings, cage guides, buffers,interior of the hoistway or liftway.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValuefive,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuefive = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 120,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValuefive,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuefive = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(f) Overrunning devices.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValuesix,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuesix = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 120,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValuesix,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuesix = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(g) Suspension ropes or chains and their attachments.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValueseven,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueseven = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 120,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValueseven,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueseven = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(h) Safety gear, i.e. arrangements for preventing fall of'
                            'platform or cage brakes Safety gear, i.e. arrangementsfor preventing fall of platform or cage brakes.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                // height: 30,
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValueeight,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueeight = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 120,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValueeight,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueeight = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(i) Brakes.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValuenine,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuenine = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 120,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValuenine,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuenine = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(j) Work of spur gearing.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                // height: 30,
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValueten,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueten = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                width: 120,
                                // height: 30,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValueten,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueten = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(k) Other electrical equipment.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValueeleven,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueeleven = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 120,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValueeleven,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueeleven = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(l) Other parts.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                width: 200,
                                child: RadioListTile(
                                  title: const Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValuetwelwe,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuetwelwe = value.toString();
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                // height: 30,
                                child: RadioListTile(
                                  title: const Text("ok"),
                                  value: "ok",
                                  groupValue: radioValuetwelwe,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuetwelwe = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    '5(B). Date and number of certificate relating to any test and'
                    'examination made under sub-rule (1) of rule 64 together with'
                    'the name of the person who issued the certificate.',
                    five_A),
                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    '5(C) Date and number of certificate relating to any test and'
                    'examination made under sub-rule (1) of rule 64 together with'
                    'the name of the person who issued the certificate.',
                    six),

                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    ' (i) Date of annealing or the heat treatment of the chain &'
                    'lifting tackle carried out under sub-rule (5) of rule 64 and by whom it was carried out.',
                    seven),
                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    '(ii) Perticulars of any defect found at any such examination'
                    'or after annealing and affecting the safe working load'
                    'and of steps taken to remedy such defect.',
                    eight),

                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    '(iii)Repairs,renewals or alterations (if any) required and'
                    'the period within which they should be executed and'
                    ' maximum safe working load subject to repairs, renewals'
                    ' or alternations (if any).',
                    nine),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'I/we certify that on ',
                      style: TextStyle(fontSize: 17),
                    ),
                    IconButton(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy/MM/dd').format(pickedDate);

                            setState(() {
                              bottomDate.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {}
                        },
                        icon: Icon(
                          Icons.calendar_month,
                          color: Colors.deepPurple[500],
                        )),
                    Container(
                      height: 50,
                      width: 90,
                      // color: Colors.amber,
                      child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter text';
                            }
                            return null;
                          },
                          controller: bottomDate,
                          decoration: InputDecoration(
                              enabled: false,
                              errorStyle: const TextStyle(
                                  color: Colors.redAccent, fontSize: 15),
                              hintStyle: TextStyle(
                                  fontSize: 17, color: Colors.deepPurple[300]),
                              hintText: DateTime.now().toString(),
                              border: InputBorder.none)),
                    )
                  ],
                ),
                const Text(
                  'I/we throughly examine the boist, lifting machine, ropes, lifting trackes and details examination test carried out ',
                  style: TextStyle(fontSize: 17),
                ),
                Row(
                  children: [
                    const Text('Signature one*:',
                        style: TextStyle(fontSize: 22)),
                    const Spacer(),
                    DropdownButton<String>(
                      value: dropdownValueone,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple[500]),
                      underline: Container(),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValueone = value!;

                          signarturnumber = mydropdownlist.indexOf(value);
                        });
                      },
                      items: mydropdownlist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: mytextstyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Image.asset(
                  signatures[signarturnumber].toString(),
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const Divider(),
                Row(
                  children: [
                    const Text('Signature two :',
                        style: TextStyle(fontSize: 22)),
                    const Spacer(),
                    DropdownButton<String>(
                      value: dropdownValuetwo,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple[500]),
                      underline: Container(),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValuetwo = value!;
                          signarturnumbertwo = mydropdownlist.indexOf(value);
                        });
                      },
                      items: mydropdownlist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: mytextstyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Image.asset(
                  signatures[signarturnumbertwo].toString(),
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const Divider(),
                Row(
                  children: [
                    const Text('Signature three :',
                        style: TextStyle(fontSize: 22)),
                    const Spacer(),
                    DropdownButton<String>(
                      value: dropdownValuethree,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple[500]),
                      underline: Container(),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValuethree = value!;

                          signarturnumberthree = mydropdownlist.indexOf(value);
                        });
                      },
                      items: mydropdownlist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: mytextstyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Image.asset(
                  signatures[signarturnumberthree].toString(),
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const Divider(),
                Row(
                  children: [
                    const Text('Signature four  :',
                        style: TextStyle(fontSize: 22)),
                    const Spacer(),
                    DropdownButton<String>(
                      value: dropdownValuefour,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple[500]),
                      underline: Container(),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValuefour = value!;

                          signarturnumberfour = mydropdownlist.indexOf(value);
                        });
                      },
                      items: mydropdownlist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: mytextstyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Image.asset(
                  signfour[signarturnumberfour].toString(),
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const Divider(),
                Row(
                  children: [
                    const Text('Signature five:',
                        style: TextStyle(fontSize: 22)),
                    const Spacer(),
                    DropdownButton<String>(
                      value: dropdownValuefive,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple[500]),
                      underline: Container(),
                      onChanged: (String? value) {
                        setState(() {
                          mydata();
                          dropdownValuefive = value!;

                          signarturnumberfive = mydropdownlist.indexOf(value);
                        });
                      },
                      items: mydropdownlist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: mytextstyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Image.asset(
                  signfive[signarturnumberfive].toString(),
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const Divider(),
                SizedBox(
                    height: 50,
                    child: Column(
                      children: [
                        Center(
                            child: responseyorno == 'y'
                                ? const CircularProgressIndicator()
                                : null)
                      ],
                    )),

                ElevatedButton(
                    onPressed: () async {
                      await Chkcon();
                      if (_formKey.currentState!.validate()) {
                        if (activeConnection == false) {
                          // final user = LocalUserdatajson(
                          //   one: one.text,
                          //   two: two.text,
                          //   threeA: three.text,
                          //   threeB: dateInput.text,
                          //   four: four.text,
                          //   fiveA: five_A.text,
                          //   fiveAA: radioValueone,
                          //   fiveAB: radiovaluetwo,
                          //   fiveAC: radiovaluethree,
                          //   fiveAD: radioValuefrou,
                          //   fiveAE: radioValuefive,
                          //   fiveAF: radioValuesix,
                          //   fiveAG: radioValueseven,
                          //   fiveAH: radioValueeight,
                          //   fiveAI: radioValuenine,
                          //   fiveAJ: radioValueten,
                          //   fiveAK: radioValueeleven,
                          //   fiveAL: radioValuetwelwe,
                          //   fiveB: five.text,
                          //   fiveCA: six.text,
                          //   fiveCB: seven.text,
                          //   fiveCC: eight.text,
                          //   certifyDate: bottomDate.text,
                          //   signPath1: signarturnumber != 0
                          //       ? signatures[signarturnumber]
                          //       : '',
                          //   signPath2: signarturnumbertwo != 0
                          //       ? signatures[signarturnumbertwo]
                          //       : '',
                          //   signPath3: signarturnumberthree != 0
                          //       ? signatures[signarturnumberthree]
                          //       : '',
                          //   signPath4: signarturnumberfour != 0
                          //       ? signatures[signarturnumberfour]
                          //       : '',
                          //   signPath5: signarturnumberfive != 0
                          //       ? signatures[signarturnumberfive]
                          //       : '',
                          // );
                          // objectBox.insertuser(user);
                          await insertDB();
                          await getUserData();
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                      'Result has been saved please turn on intenet to view PDF'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil<void>(
                                            context,
                                            MaterialPageRoute<void>(
                                                builder:
                                                    (BuildContext context) =>
                                                        const MyNavbar()),
                                            (route) => false,
                                          );
                                        },
                                        child: const Text('ok'))
                                  ],
                                );
                              });
                          clearText();
                        } else if (activeConnection == true) {
                          setState(() {
                            responseyorno = 'y';
                          });
                          await postformdata();

                          // sleep(Duration(seconds: 1));
                          clearText();
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(errorMessage),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          forward!
                                              ? Navigator.pushAndRemoveUntil<
                                                  void>(
                                                  context,
                                                  MaterialPageRoute<void>(
                                                      builder: (BuildContext
                                                              context) =>
                                                          const FormSubmitPage()),
                                                  (route) => false,
                                                )
                                              : Navigator.pushAndRemoveUntil<
                                                  void>(
                                                  context,
                                                  MaterialPageRoute<void>(
                                                      builder: (BuildContext
                                                              context) =>
                                                          const PdfList()),
                                                  (route) => false,
                                                );
                                        },
                                        child: const Text('ok'))
                                  ],
                                );
                              });
                        }
                      } else {
                        Fluttertoast.showToast(
                          msg: "All fields are required.", // message
                          toastLength: Toast.LENGTH_SHORT, // length
                          gravity: ToastGravity.CENTER, // location

                          // duration
                        );
                      }

                      mydata();
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: const Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column myformtextfield(TextStyle mytextstyle,
      BoxDecoration mybodedxdecoration, String text, textcontroller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: mytextstyle,
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          decoration: mybodedxdecoration,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter text';
              }
              return null;
            },
            controller: textcontroller,
            autofocus: false,
            maxLines: 20,
            minLines: 1,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 11),
                border: InputBorder.none),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
      ],
    );
  }
}

List signone = List.from(signatures);
List signtwo = List.from(signatures);
List signthree = List.from(signatures);
List signfour = List.from(signatures);
List signfive = List.from(signatures);

List signatures = [
  'assets/sign/nullsign.png',
  'assets/sign/sign1.jpg',
  'assets/sign/sign2.png',
  'assets/sign/sign3.jpg',
  'assets/sign/sign4.png',
  'assets/sign/sign5.png'
];
