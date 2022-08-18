import 'package:flutter/material.dart';

import '../data_management/database_operations.dart';
import '../data_representatioin/graph_from_data.dart';

class ProgressAnalytics extends StatelessWidget {
  const ProgressAnalytics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final h = constraints.maxHeight / 100;
      final w = constraints.maxWidth / 100;
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Progress Analytics",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
        ),
            body: Center(
              child: ElevatedButton(
                child: Text('Press Me'),
                onPressed: () async {
                  print(getPastDates(7));
                },
              ),
            ),
      ));
    });
  }
}
