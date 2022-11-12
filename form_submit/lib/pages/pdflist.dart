import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_submit/models/models.dart';
import 'package:form_submit/pages/navigation.dart';
import 'package:form_submit/pages/pdfview.dart';
import 'package:form_submit/webservices/webservices.dart';

class PdfList extends StatefulWidget {
  const PdfList({super.key});

  @override
  State<PdfList> createState() => _PdfListState();
}

class _PdfListState extends State<PdfList> {
  String assetpath = '';

  // PdfViewerController mypdfcontroller = PdfViewerController();
  bool isloading = true;
  var getpdff;
  homepage() async {
    var res = await getpdf();
    setState(() {
      getpdff = Categorymodels.fromJson(res);
      isloading = false;
    });
    return getpdff;
  }

  @override
  @override
  void initState() {
    getpdf();
    homepage();
    super.initState();
    Chkcon();
  }
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

  @override
  Widget build(BuildContext context) {
    getpdf();
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[50],
        elevation: 0,
        title: Text(
          'View Pdf',
          style: TextStyle(color: Colors.purple[300]),
        ),
        leading: IconButton(
          onPressed: (() {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil<void>(
                context,
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MyNavbar()),
                (route) => false);
          }),
          icon: const Icon(Icons.arrow_back),
          color: Colors.purple[300],
        ),
      ),
      body: activeConnection == true
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              getpdff != null ? getpdff.resultArray.length : 1,
                          itemBuilder: (context, index) {
                            return getpdff != null
                                ? InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Mypdfview(
                                          url: getpdff
                                              .resultArray[index].reportPath
                                              .toString(),
                                          name: getpdff
                                              .resultArray[index].reportName
                                              .toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      height: 60,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () async {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return Mypdfview(
                                                  url: getpdff
                                                      .resultArray[index]
                                                      .reportPath
                                                      .toString(),
                                                  name: getpdff
                                                      .resultArray[index]
                                                      .reportName
                                                      .toString(),
                                                );
                                              }));
                                              // getpdf();
                                              final url = getpdff
                                                  .resultArray[index].reportPath
                                                  .toString();
                                            },
                                            icon: Icon(Icons.picture_as_pdf,
                                                color:
                                                    Colors.purpleAccent[300]),
                                          ),
                                          Text(getpdff
                                              .resultArray[index].reportName
                                              .toString()),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: MediaQuery.of(context).size.height -
                                        100,
                                    child: const Center(
                                        child: CircularProgressIndicator()));
                          })
                      // SizedBox(
                      //   height: 1000,
                      // )
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                          spreadRadius: 0.8,
                          offset: Offset(0, 2)),
                    ],
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Please turn on the internet!',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyNavbar()));
                        },
                        child: Text('Ok'))
                  ],
                ),
              ),
            ),
    );
  }
}
