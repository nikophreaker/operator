import 'dart:async';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:operator_test/features/auth/login/ui/widgets/page_item.dart';
import 'package:operator_test/features/home/ui/screens/home_screen.dart';
import 'package:operator_test/generated/assets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.camera});

  final CameraDescription camera;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  int _currentPosition = 0;
  final PageController controller = PageController(initialPage: 0);
  final List<PageItem> _pages = [
    const PageItem(
        imageUrl: Assets.imageBanner1,
        desc: "Streamline your security, streamline your visitor management"),
    const PageItem(
        imageUrl: Assets.imageBanner2,
        desc: "Streamline your security, streamline your visitor management"),
    const PageItem(
        imageUrl: Assets.imageBanner3,
        desc: "Streamline your security, streamline your visitor management"),
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      _currentPosition++;
      controller.animateToPage(
        _currentPosition,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _updatePosition(int position) {
    setState(() => _currentPosition = position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5F9FC),
      body: SafeArea(
        child: Stack(children: [
          PageView.builder(
            itemBuilder: (context, index) {
              return _pages[index % _pages.length];
            },
            controller: controller,
            onPageChanged: (value) {
              _updatePosition(value.round());
            },
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text("Email"),
                          ),
                          TextField(
                            style: TextStyle(fontSize: 12.0, height: 1),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Color(0xff7CFFFF)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Color(0xff7CFFFF)),
                              ),
                              hintText: "example@caliana.id",
                              hintStyle: TextStyle(
                                  color: Colors.grey
                              ),
                              prefixIcon: UnconstrainedBox(
                                child: SvgPicture.asset(
                                  Assets.imageEmail,
                                  colorFilter: ColorFilter.mode(Color(0xff02AFE6), BlendMode.srcIn),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Color(0xff7CFFFF))),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Color(0xff7CFFFF))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text("Kata Sandi"),
                          ),
                          TextField(
                            style: TextStyle(fontSize: 12.0, height: 1),
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Color(0xff7CFFFF)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Color(0xff7CFFFF)),
                              ),
                              hintText: "Masukkan kata sandi anda",
                              hintStyle: TextStyle(
                                color: Colors.grey
                              ),
                              prefixIcon: UnconstrainedBox(
                                child: SvgPicture.asset(
                                  Assets.imagePassword,
                                  colorFilter: ColorFilter.mode(Color(0xff02AFE6), BlendMode.srcIn),
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: _toggle,
                                child: UnconstrainedBox(
                                  child: SvgPicture.asset(
                                    Assets.imageEyes,
                                    colorFilter: ColorFilter.mode(Color(0xff02AFE6), BlendMode.srcIn),
                                  ),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Color(0xff7CFFFF))),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Color(0xff7CFFFF))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        'Lupa kata sandi?',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xff02AFE6),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xff02AFE6),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen(camera: widget.camera,)),
                            );
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
                              'Masuk',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
