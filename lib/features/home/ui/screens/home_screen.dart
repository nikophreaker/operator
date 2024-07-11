import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:operator_test/features/auth/register/ui/screens/register_screen.dart';
import 'package:operator_test/features/home/ui/widgets/clock.dart';
import 'package:operator_test/generated/assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.camera});

  final CameraDescription camera;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final _key = GlobalKey<ExpandableFabState>();
  int _fitur = 0;
  int _pages = 0;

  void _setFitur(int value) {
    setState(() {
      _fitur = value;
    });
  }

  void _setPage(int value) {
    setState(() {
      _pages = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        backgroundColor: Color(0xffF8F8F8),
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Image.asset(
            Assets.imageCalianaLogo,
            scale: 2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 5.0,
                  ),
                  borderRadius: BorderRadius.circular(50.0), // Uniform radius
                ),
                child: Text(
                  "Recruitment",
                  style: TextStyle(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(50.0), // Uniform radius
                ),
                child: CircleAvatar(
                  radius: 20,
                  child: Image.asset(
                    Assets.imageProfileDefault,
                  ),
                  backgroundColor: Colors.blue.shade100,
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SizedBox(
              width: 45,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.grey,
                      elevation: 0),
                  child: SvgPicture.asset(Assets.imageNotif)),
            ),
          ),
        ],
      ),
      extendBody: true,
      // floatingActionButton: ExpandableFab(
      //   key: _key,
      //   type: ExpandableFabType.up,
      //   childrenAnimation: ExpandableFabAnimation.none,
      //   distance: 70,
      //   overlayStyle: ExpandableFabOverlayStyle(
      //     color: Colors.white.withOpacity(0.9),
      //   ),
      //   openButtonBuilder: DefaultFloatingActionButtonBuilder(
      //     heroTag: null,
      //     child: SvgPicture.asset(Assets.imageAdd),
      //     shape: CircleBorder(),
      //     backgroundColor: Colors.white,
      //   ),
      //   closeButtonBuilder: DefaultFloatingActionButtonBuilder(
      //     heroTag: null,
      //     child: SvgPicture.asset(Assets.imageAdd),
      //     shape: CircleBorder(),
      //     backgroundColor: Colors.white,
      //   ),
      //   children: [
      //     Row(
      //       children: [
      //         Text('Pra Regitrasi'),
      //         SizedBox(width: 20),
      //         FloatingActionButton.small(
      //           heroTag: null,
      //           onPressed: null,
      //           shape: CircleBorder(),
      //           backgroundColor: Colors.lightBlue.shade50,
      //           child: SvgPicture.asset(Assets.imageMenuPreRegis),
      //         ),
      //       ],
      //     ),
      //     Row(
      //       children: [
      //         Text(
      //           'Registrasi',
      //           style: TextStyle(backgroundColor: Colors.white),
      //         ),
      //         SizedBox(width: 20),
      //         FloatingActionButton.small(
      //           heroTag: null,
      //           onPressed: null,
      //           shape: CircleBorder(),
      //           backgroundColor: Colors.lightBlue.shade50,
      //           child: SvgPicture.asset(Assets.imageMenuRegis),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterScreen(camera: widget.camera,)),
          );
        },
        child: SvgPicture.asset(Assets.imageAdd),
        shape: CircleBorder(),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButtonLocation: ExpandableFab.location,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: _pages == 0
                            ? Colors.lightBlue
                            : Colors.transparent)),
              ),
              child: IconButton(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.imageBeranda,
                        width: 20,
                        colorFilter: ColorFilter.mode(
                            _pages == 0 ? Colors.lightBlue : Colors.grey,
                            BlendMode.srcIn)),
                    Text(
                      'Beranda',
                      style: TextStyle(
                        color: _pages == 0 ? Colors.lightBlue : Colors.grey,
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: _pages == 1
                            ? Colors.lightBlue
                            : Colors.transparent)),
              ),
              child: IconButton(
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      Assets.imageOpenTicket,
                      width: 20,
                      colorFilter: ColorFilter.mode(
                          _pages == 1 ? Colors.lightBlue : Colors.grey,
                          BlendMode.srcIn),
                    ),
                    Text(
                      'Tiket',
                      style: TextStyle(
                        color: _pages == 1 ? Colors.lightBlue : Colors.grey,
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  ClockWidget(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.imageSearch),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Cari",
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Fitur",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => _setFitur(0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 5.0,
                                      ),
                                      color: _fitur == 0
                                          ? Colors.blue.shade100
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Semua Fitur",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: _fitur == 0
                                                ? Colors.blue
                                                : Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _setFitur(1),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 5.0,
                                      ),
                                      color: _fitur == 1
                                          ? Colors.blue.shade100
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Visitor Management System",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: _fitur == 1
                                                ? Colors.blue
                                                : Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _setFitur(2),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 5.0,
                                      ),
                                      color: _fitur == 2
                                          ? Colors.blue.shade100
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Access Control System",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: _fitur == 2
                                                ? Colors.blue
                                                : Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 50,
                              child: Column(
                                children: [
                                  SvgPicture.asset(Assets.imageDashboard),
                                  Text(
                                    "Dasbor",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 75,
                              child: Column(
                                children: [
                                  SvgPicture.asset(Assets.imageListVisitor),
                                  Text(
                                    "Daftar Pengunjung",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SvgPicture.asset(Assets.imageResident),
                                Text(
                                  "Residen",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Hari Ini",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Tidak ada pengunjung",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Daftar pengunjung akan ditampilkan disini.",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.lightBlue),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Refresh",
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
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
