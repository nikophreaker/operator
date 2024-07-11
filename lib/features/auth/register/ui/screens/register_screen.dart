import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:operator_test/features/auth/register/ui/screens/scan_screen.dart';
import 'package:operator_test/generated/assets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.camera});

  final CameraDescription camera;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final String _title = "Pilih Kartu Identitas";
  final List<String> _identity = ["e-KTP", "SIM", "Paspor", "Lainnya"];
  final _other = TextEditingController();

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
          _title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        itemCount: _identity.length,
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              if (_identity[i] != "Lainnya") {
                String card = _identity[i];
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ScanScreen(card: card, camera: widget.camera)));
              } else {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(32))),
                    context: context,
                    builder: (BuildContext context) => Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.center,
                                      "Masukkan Kartu Identitas Lainnya.",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: TextField(
                                        controller: _other,
                                        style: TextStyle(
                                            fontSize: 12.0, height: 1),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff02AFE6)),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff02AFE6)),
                                          ),
                                          hintText:
                                              "Masukkan Kartu Identitas Lainnya",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          errorBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xff7CFFFF))),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          height: 35,
                                          child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  color: Color(0xff02AFE6)),
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
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              if (_other.text.isNotEmpty) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ScanScreen(
                                                            card: _other.text,
                                                            camera:
                                                                widget.camera),
                                                  ),
                                                );
                                              }
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              height: 35,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: _other.text.isEmpty
                                                    ? Colors.grey
                                                    : Color(0xff02AFE6),
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                              ),
                                              child: Text(
                                                'Selanjutnya',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
              }
            },
            child: Card(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      Assets.imageIconIdCard,
                      width: 20,
                    ),
                    Text(
                      _identity[i],
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
