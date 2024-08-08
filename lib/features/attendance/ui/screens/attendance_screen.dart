import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:operator_test/core/db/local/app_db.dart';
import 'package:operator_test/features/attendance/bloc/attendance_bloc.dart';
import 'package:operator_test/features/home/ui/widgets/clock.dart';
import 'package:operator_test/generated/assets.dart';
import 'package:operator_test/injection.dart';

import '../widgets/dialog_delete.dart';

class AttendanceScreen extends StatefulHookWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceState();
}

class _AttendanceState extends State<AttendanceScreen> {
  final AttendanceBloc attendanceBloc = getIt.get<AttendanceBloc>();

  @override
  void initState() {
    super.initState();
    attendanceBloc.add(GetAttendanceFetchStreamEvent());
  }

  @override
  Widget build(BuildContext context) {
    var fitur = useState(0);

    return SingleChildScrollView(
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
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
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
                              onTap: () => fitur.value = 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 5.0,
                                    ),
                                    color: fitur.value == 0
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
                                          color: fitur.value == 0
                                              ? Colors.blue
                                              : Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => fitur.value = 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 5.0,
                                    ),
                                    color: fitur.value == 1
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
                                          color: fitur.value == 1
                                              ? Colors.blue
                                              : Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => fitur.value = 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 5.0,
                                    ),
                                    color: fitur.value == 2
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
                                          color: fitur.value == 2
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
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Absensi",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  BlocConsumer<AttendanceBloc, AttendanceState>(
                      bloc: attendanceBloc,
                      builder: (context, getAttendanceState) {
                        switch (getAttendanceState.runtimeType) {
                          case GetAttendanceFetchingStreamLoadingState:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );

                          case GetAttendanceFetchingStreamSuccess:
                            final getAttendanceData = getAttendanceState
                                as GetAttendanceFetchingStreamSuccess;
                            return StreamBuilder<List<AttendanceData>>(
                                stream: getAttendanceData.attendanceData,
                                builder: (context,
                                    AsyncSnapshot<List<AttendanceData>>
                                        snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                        primary: false,
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          final att = snapshot.data![index];
                                          return GestureDetector(
                                            onTap: () {
                                              showBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return BottomSheetExample(
                                                        id: att.id,
                                                        delete: () =>
                                                            attendanceBloc.add(
                                                                DeleteAttendanceFetchEvent(
                                                                    id: att
                                                                        .id)));
                                                  });
                                            },
                                            child: Card(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    att.id.toString(),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    att.name.toString(),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    att.address.toString(),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    DateFormat(
                                                            'EEEE, d MMM yyyy hh:mm:ss a',
                                                            'id_ID')
                                                        .format(att.createdAt)
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                    // return Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Column(
                                    //     crossAxisAlignment: CrossAxisAlignment.center,
                                    //     children: [
                                    //       Padding(
                                    //         padding: const EdgeInsets.only(left: 8.0),
                                    //         child: Text(
                                    //           "Tidak ada pengunjung",
                                    //           textAlign: TextAlign.center,
                                    //           style: TextStyle(
                                    //               color: Colors.grey,
                                    //               fontWeight: FontWeight.bold,
                                    //               fontSize: 16),
                                    //         ),
                                    //       ),
                                    //       Padding(
                                    //         padding: const EdgeInsets.only(left: 8.0),
                                    //         child: Text(
                                    //           "Daftar pengunjung akan ditampilkan disini.",
                                    //           textAlign: TextAlign.center,
                                    //           style: TextStyle(
                                    //               color: Colors.grey, fontSize: 16),
                                    //         ),
                                    //       ),
                                    //       OutlinedButton(
                                    //         style: OutlinedButton.styleFrom(
                                    //           side: BorderSide(color: Colors.lightBlue),
                                    //         ),
                                    //         onPressed: () {},
                                    //         child: Text(
                                    //           "Refresh",
                                    //           style: TextStyle(
                                    //             color: Colors.lightBlue,
                                    //             fontSize: 16,
                                    //           ),
                                    //         ),
                                    //       )
                                    //     ],
                                    //   ),
                                    // );
                                  } else if (snapshot.hasError) {
                                    return Text(
                                      '${snapshot.error}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    );
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                });
                            getAttendanceData.attendanceData.listen((data) {
                              ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    final att = data[index];
                                    return Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            att.id.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            att.name.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            att.address.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            DateFormat(
                                                    'EEEE, d MMM yyyy hh:mm:ss a',
                                                    'id_ID')
                                                .format(att.createdAt)
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            });

                          case GetAttendanceFetchingErrorState:
                            return Text(
                              "Error Fetching Data",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            );
                          default:
                            return Padding(
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
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
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
                            );
                        }
                      },
                      listener: (context, getAttendanceState) {
                        if (getAttendanceState.runtimeType ==
                            DeleteAttendanceFetchingSuccess) {
                          attendanceBloc.add(GetAttendanceFetchStreamEvent());
                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
