import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:operator_test/core/db/local/app_db.dart';
import 'package:operator_test/features/master_location/bloc/master_bloc.dart';
import 'package:operator_test/features/master_location/ui/screens/select_map_screen.dart';
import 'package:operator_test/generated/assets.dart';
import 'package:operator_test/injection.dart';

import '../../../attendance/ui/widgets/dialog_delete.dart';

class MasterScreen extends StatefulHookWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterState();
}

class _MasterState extends State<MasterScreen> {
  final MasterBloc masterBloc = getIt.get<MasterBloc>();

  @override
  void initState() {
    super.initState();
    masterBloc.add(GetMasterFetchStreamEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: [
            ExpansionTile(
              initiallyExpanded: true,
              shape: Border(),
              textColor: Color(0xff02AFE6),
              collapsedIconColor: Color(0xff02AFE6),
              iconColor: Color(0xff02AFE6),
              title: Text('Lokasi',
                  style: TextStyle(color: Color(0xff02AFE6))),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocConsumer<MasterBloc, MasterState>(
                            bloc: masterBloc,
                            builder: (context, getMasterState) {
                              switch (getMasterState.runtimeType) {
                                case GetMasterFetchingStreamLoadingState:
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );

                                case GetMasterFetchingStreamSuccess:
                                  final getMasterData = getMasterState
                                  as GetMasterFetchingStreamSuccess;
                                  return StreamBuilder<List<MasterData>>(
                                      stream: getMasterData.masterData,
                                      builder: (context,
                                          AsyncSnapshot<List<MasterData>>
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
                                                                  masterBloc.add(
                                                                      DeleteMasterFetchEvent(
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
                                                          att.lat.toString(),
                                                          style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          att.long.toString(),
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
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
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

                                case GetMasterFetchingErrorState:
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
                            listener: (context, getMasterState) {
                              if (getMasterState.runtimeType ==
                                  DeleteMasterFetchingSuccess) {
                                masterBloc.add(GetMasterFetchStreamEvent());
                                Navigator.pop(context);
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
