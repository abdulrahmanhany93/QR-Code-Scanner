import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

bool show = false;

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            height: 80,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25)),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Scan QR Code',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo.shade900),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            top: show
                ? MediaQuery.of(context).size.height * 0.25
                : MediaQuery.of(context).size.height * 0.22,
            left: show ? MediaQuery.of(context).size.width * .15 : 20,
            height: 40,
            child: Image.asset(
              'assets/1.png',
              color: Colors.indigo.shade700,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            top: show
                ? MediaQuery.of(context).size.height * 0.25
                : MediaQuery.of(context).size.height * 0.22,
            right: show ? MediaQuery.of(context).size.width * .15 : 20,
            height: 40,
            child: RotatedBox(
                quarterTurns: 1,
                child: Image.asset(
                  'assets/1.png',
                  color: Colors.indigo.shade700,
                )),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            top: show
                ? MediaQuery.of(context).size.height * 0.55
                : MediaQuery.of(context).size.height * 0.6,
            right: show ? MediaQuery.of(context).size.width * .15 : 20,
            height: 40,
            child: RotatedBox(
                quarterTurns: 2,
                child: Image.asset(
                  'assets/1.png',
                  color: Colors.indigo.shade700,
                )),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            top: show
                ? MediaQuery.of(context).size.height * 0.55
                : MediaQuery.of(context).size.height * 0.6,
            left: show ? MediaQuery.of(context).size.width * .15 : 20,
            height: 40,
            child: RotatedBox(
                quarterTurns: 3,
                child: Image.asset(
                  'assets/1.png',
                  color: Colors.indigo.shade700,
                )),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: Center(
              child: RotatedBox(
                  quarterTurns: 3,
                  child: Image.asset(
                    'assets/2.png',
                    color: Colors.black87,
                    height: 300,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => openUrl(),
              child: Container(
                margin: EdgeInsets.only(bottom: 40),
                width: 200,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.indigo.shade900,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Text(
                    'SCAN',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 25),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    var duration = Duration(milliseconds: 200);
    Timer time = Timer(duration, showQR);
  }

  showQR() {
    setState(() {
      show = true;
    });
  }

  openUrl() async {
    String bar = await BarcodeScanner.scan();
    if (await canLaunch(bar)) {
      launch(bar);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Invalid QR Try Again',
        ),
        duration: Duration(milliseconds: 900),
        backgroundColor: Colors.indigo,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      ));
    }
  }
}
