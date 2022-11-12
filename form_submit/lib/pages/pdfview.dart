

import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Mypdfview extends StatefulWidget {
  var url;
  var name;

  Mypdfview({super.key, this.url, this.name});

  @override
  State<Mypdfview> createState() => _MypdfviewState();
}

class _MypdfviewState extends State<Mypdfview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[50],
      
        title: Text(
         widget.name,
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
      body: SfPdfViewer.network(widget.url.toString()),
    );
  }
}
