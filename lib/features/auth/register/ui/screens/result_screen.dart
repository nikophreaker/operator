import 'dart:io';

import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {super.key,
      required this.cardNumber,
      required this.cardAccess,
      required this.name,
      required this.email,
      required this.cardPhoto,
      required this.facePhoto});

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Konfirmasi Data",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            widget.cardNumber == "" && widget.cardNumber == ""
                ? SizedBox()
                : ExpansionTile(
                    textColor: Color(0xff02AFE6),
                    collapsedIconColor: Color(0xff02AFE6),
                    title: Text('Kartu Identitas'),
                    children: <Widget>[
                      Image.file(File(widget.facePhoto),
                          width: MediaQuery.of(context).size.width * 0.7,
                          fit: BoxFit.fill),
                    ],
                  ),
            ExpansionTile(
              textColor: Color(0xff02AFE6),
              collapsedIconColor: Color(0xff02AFE6),
              title: Text('Foto Wajah'),
              children: <Widget>[
                ListTile(title: Text('This is tile number 1')),
              ],
            ),
            ExpansionTile(
              textColor: Color(0xff02AFE6),
              collapsedIconColor: Color(0xff02AFE6),
              title: Text('Data Pribadi'),
              children: <Widget>[
                ListTile(title: Text('This is tile number 1')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: GestureDetector(
                onTap: () {},
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xff02AFE6)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Batal",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
