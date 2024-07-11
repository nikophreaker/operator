import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:operator_test/generated/assets.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key,
    required this.cardNumber,
    required this.cardAccess,
    required this.name,
    required this.email,
    required this.cardPhoto,
    required this.facePhoto,
    required this.cardType});

  final String? cardNumber;
  final String? cardAccess;
  final String name;
  final String email;
  final String cardPhoto;
  final String cardType;
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              widget.cardNumber == "" && widget.cardNumber == ""
                  ? SizedBox()
                  : ExpansionTile(
                initiallyExpanded: true,
                shape: Border(),
                textColor: Color(0xff02AFE6),
                collapsedIconColor: Color(0xff02AFE6),
                iconColor: Color(0xff02AFE6),
                title: Text('Kartu Identitas', style: TextStyle(
                    color: Color(0xff02AFE6)
                )),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kartu Identitas', style: TextStyle(
                            fontSize: 12
                        ),),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1.5, color: Color(0xff02AFE6)),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: SvgPicture.asset(Assets.imageIconIdCard),
                                ),
                                Text(widget.cardType, style: TextStyle(
                                    fontSize: 12
                                ),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  widget.cardNumber == "" ? SizedBox() : Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nomor Kartu Identitas', style: TextStyle(
                            fontSize: 12
                        ),),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1.5, color: Color(0xff02AFE6)),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: SvgPicture.asset(Assets.imageIconIdCard),
                                ),
                                Text(widget.cardNumber??"", style: TextStyle(
                                    fontSize: 12
                                ),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  widget.cardAccess == "" ? SizedBox() : Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nomor Kartu Akses', style: TextStyle(
                            fontSize: 12
                        ),),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1.5, color: Color(0xff02AFE6)),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: SvgPicture.asset(Assets.imageIconIdCard),
                                ),
                                Text(widget.cardAccess??"", style: TextStyle(
                                    fontSize: 12
                                ),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(0.0),
                    decoration: BoxDecoration(
                      border:
                      Border.all(color: Color(0xff7CFFFF), width: 5.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.file(File(widget.cardPhoto),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.8,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.2,
                        fit: BoxFit.fill),
                  ),
                ],
              ),
              ExpansionTile(
                initiallyExpanded: true,
                shape: Border(),
                textColor: Color(0xff02AFE6),
                collapsedIconColor: Color(0xff02AFE6),
                iconColor: Color(0xff02AFE6),
                title: Text('Foto Wajah', style: TextStyle(
                    color: Color(0xff02AFE6)
                )),
                children: <Widget>[Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    border:
                    Border.all(color: Color(0xff7CFFFF), width: 5.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image.file(File(widget.facePhoto),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.8,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.2,
                      fit: BoxFit.fill),
                ),
                ],
              ),
              ExpansionTile(
                initiallyExpanded: true,
                shape: Border(),
                textColor: Color(0xff02AFE6),
                collapsedIconColor: Color(0xff02AFE6),
                iconColor: Color(0xff02AFE6),
                title: Text('Data Pribadi', style: TextStyle(
                    color: Color(0xff02AFE6)
                )),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nama', style: TextStyle(
                            fontSize: 12
                        ),),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1.5, color: Color(0xff02AFE6)),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: SvgPicture.asset(Assets.imageIconIdCard),
                                ),
                                Text(widget.name, style: TextStyle(
                                    fontSize: 12
                                ),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email', style: TextStyle(
                            fontSize: 12
                        ),),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1.5, color: Color(0xff02AFE6)),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: SvgPicture.asset(Assets.imageEmail),
                                ),
                                Text(widget.email, style: TextStyle(
                                    fontSize: 12
                                ),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.9,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff02AFE6),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Text(
                      'Check In',
                      textAlign: TextAlign.center,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
