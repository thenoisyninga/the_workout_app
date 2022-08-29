import 'package:flutter/material.dart';

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
        body: Container(
          alignment: Alignment.center,
          child: ListView(
            padding: EdgeInsets.all(w*4),
            children: [
              Padding(
                padding: EdgeInsets.all(w*5),
                child: Container(
                  height: h*45,
                  width: w*90,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: LineChartWidget(workoutName: 'Pushups', limit: 7,),
                  ),
                ),
              ),
            ]
          ),
        ),
      ));
    });
  }
}
