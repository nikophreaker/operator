import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BottomSheetExample extends HookWidget {
  const BottomSheetExample({super.key, required this.id, required this.delete});

  final int id;
  final VoidCallback delete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Delete id $id'),
            ElevatedButton(
              child: const Text('Delete'),
              onPressed: delete,
            ),
            ElevatedButton(
              child: const Text('Close'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
