import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(
            DateFormat('EEEE, d MMM yyyy','id_ID').format(DateTime.now()),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              DateFormat('hh:mm:ss a','id_ID').format(DateTime.now()),
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
          )
        ]);
      },
    );
  }
}
