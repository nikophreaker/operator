import 'dart:io';

import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.cardNumber, required this.cardAccess, required this.name, required this.email,required this.cardPhoto,required this.facePhoto});

  final String? cardNumber;
  final String? cardAccess;
  final String name;
  final String email;
  final String cardPhoto;
  final String facePhoto;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          "Konfirmasi Data",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            ExpansionTile(
              title: Text('ExpansionTile 1'),
              subtitle: Text('Trailing expansion arrow icon'),
              children: <Widget>[
                Container(
                  width: 250.0,
                  height: 250.0,
                  alignment: Alignment.center,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/Launcher_Icon.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                )
              ],
            ),
            ExpansionTile(
              title: Text('ExpansionTile 1'),
              subtitle: Text('Trailing expansion arrow icon'),
              children: <Widget>[
                ListTile(title: Text('This is tile number 1')),
              ],
            ),
            Image.file(File(widget.facePhoto)),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: GestureDetector(
                onTap: () {

                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xff02AFE6),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    'Check In',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff02AFE6),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Text(
                  'Batal',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
