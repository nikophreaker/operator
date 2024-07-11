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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
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
              String card = _identity[i];
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScanScreen(card: card,camera: widget.camera)));
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
