import 'package:flutter/material.dart';

import 'package:form_submit/pages/navigation.dart';
// import 'package:form_submit_again/objectbox/objectbox.dart';




void main() async {

 
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyNavbar(),
    );
  }
}
