import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:operator_test/features/attendance/ui/screens/attendance_form_screen.dart';
import 'package:operator_test/features/attendance/ui/screens/attendance_screen.dart';
import 'package:operator_test/features/master_location/ui/screens/master_form_screen.dart';
import 'package:operator_test/features/master_location/ui/screens/master_screen.dart';
import 'package:operator_test/generated/assets.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key, required this.camera, required this.camera2});

  final CameraDescription camera;
  final CameraDescription camera2;

  @override
  Widget build(BuildContext context) {
    var selectedPage = useState(0);

    final _pageOptions = [
      AttendanceScreen(),
      MasterScreen(),
    ];

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                selectedPage.value == 0 ? AttendanceFormScreen() : MasterFormScreen()
            ),
          );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => RegisterScreen(
          //           camera: widget.camera, camera2: widget.camera2)),
          // );
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
                        color: selectedPage.value == 0
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
                            selectedPage.value == 0 ? Colors.lightBlue : Colors.grey,
                            BlendMode.srcIn)),
                    Text(
                      'Beranda',
                      style: TextStyle(
                        color: selectedPage.value == 0 ? Colors.lightBlue : Colors.grey,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  selectedPage.value = 0;
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: selectedPage.value == 1
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
                          selectedPage.value == 1 ? Colors.lightBlue : Colors.grey,
                          BlendMode.srcIn),
                    ),
                    Text(
                      'Master',
                      style: TextStyle(
                        color: selectedPage.value == 1 ? Colors.lightBlue : Colors.grey,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  selectedPage.value = 1;
                },
              ),
            ),
          ],
        ),
      ),
      body: _pageOptions[selectedPage.value],
    );
  }
}

// class _HomeScreenState extends State<HomeScreen> {
//
// }
