import 'package:flutter/material.dart';

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
      ));
    });
  }
}
