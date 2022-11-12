import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_submit/pages/pdfview.dart';
import 'package:form_submit/pages/qroverlay.dart';

import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:path/path.dart';

class mobilscanner extends StatefulWidget {
  const mobilscanner({super.key});

  @override
  State<mobilscanner> createState() => _mobilscannerState();
}

bool screenopen = false;

class _mobilscannerState extends State<mobilscanner> {
  MobileScannerController _mobileScannerController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _mobileScannerController,
            allowDuplicates: true,
            onDetect: _foundBarcode,
          ),
          QRScannerOverlay()
        ],
      ),
    );
  }

  void _foundBarcode(Barcode barcode, MobileScannerArguments? args) {
    /// open screen
    if (!screenopen) {
      final String code = barcode.rawValue ?? "---";
      debugPrint('Barcode found! $code');
      var urlname = code;
      var filename = code;
      final File file = new File(filename);
      String base = basename(filename);
      screenopen = true;
      print(code);
      Navigator.push(
          this.context,
          MaterialPageRoute(
              builder: (context) =>
                  // FoundCodeScreen(screenClosed: _screenWasClosed, value: code),
                  Mypdfview(
                    url: code,
                    name: base,
                  )));

      void _screenWasClosed() {
        screenopen = false;
      }
      // setState(() {
      //   screenopen = false;
      // });
    }
    // setState(() {
    //   screenopen = false;
    // });
  }

  void _screenWasClosed() {
    screenopen = false;
  }
}
// class FoundCodeScreen extends StatefulWidget {
//   final String value;
//   final Function() screenClosed;
//   const FoundCodeScreen({
//     Key? key,
//     required this.value,
//     required this.screenClosed,
//   }) : super(key: key);

//   @override
//   State<FoundCodeScreen> createState() => _FoundCodeScreenState();
// }

// class _FoundCodeScreenState extends State<FoundCodeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Found Code"),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             widget.screenClosed();
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_outlined,),
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text("Scanned Code:", style: TextStyle(fontSize: 20,),),
//               SizedBox(height: 20,),
//               Text(widget.value, style: TextStyle(fontSize: 16,),),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }