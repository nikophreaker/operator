import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:operator_test/features/auth/register/ui/screens/face_screen.dart';
import 'package:operator_test/features/auth/register/ui/screens/result_screen.dart';
import 'package:operator_test/generated/assets.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.imagePath, required this.camera});

  final String imagePath;
  final CameraDescription camera;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final cardNumber = TextEditingController();
  final cardAccess = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          "Formulir Registrasi",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Text(
                  "Data Pribadi",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      children: [
                        Text("Nomor Kartu Identitas"),
                        Text(
                          "(tidak wajib diisi)",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: TextField(
                      controller: cardNumber,
                      style: TextStyle(fontSize: 12.0, height: 1),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        hintText: "Masukkan Nomor Kartu Identitas",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: UnconstrainedBox(
                          child: SvgPicture.asset(
                            Assets.imageIconIdCard,
                            colorFilter:
                                ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.grey)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Color(0xff7CFFFF))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      children: [
                        Text("Nomor Kartu Akses"),
                        Text(
                          "(tidak wajib diisi)",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: TextField(
                      controller: cardAccess,
                      style: TextStyle(fontSize: 12.0, height: 1),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        hintText: "Masukkan Nomor Kartu Akses",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: UnconstrainedBox(
                          child: SvgPicture.asset(
                            Assets.imageIconIdCard,
                            colorFilter:
                                ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.grey)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Color(0xff7CFFFF))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      children: [
                        Text("Nama"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: TextField(
                      controller: name,
                      style: TextStyle(fontSize: 12.0, height: 1),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        hintText: "Nama",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: UnconstrainedBox(
                          child: SvgPicture.asset(
                            Assets.imageIconIdCard,
                            colorFilter:
                                ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.grey)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Color(0xff7CFFFF))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      children: [
                        Text("Email"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: TextField(
                      controller: email,
                      style: TextStyle(fontSize: 12.0, height: 1),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: UnconstrainedBox(
                          child: SvgPicture.asset(
                            Assets.imageEmail,
                            colorFilter:
                                ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.grey)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Color(0xff7CFFFF))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: GestureDetector(
                      onTap: () {
                        if (!name.text.isEmpty && !email.text.isEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FaceScreen(
                                      card: widget.imagePath,
                                      camera: widget.camera,
                                      cardNumber: cardNumber.text,
                                      cardAccess: cardAccess.text,
                                      name: name.text,
                                      email: email.text,
                                    )),
                          );
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: name.text.isEmpty && email.text.isEmpty
                              ? Colors.grey
                              : Color(0xff02AFE6),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Text(
                          'Selanjutnya',
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
          ],
        ),
      ),
    );
  }
}
