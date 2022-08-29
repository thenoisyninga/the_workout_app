import 'package:flutter/material.dart';

import '../data_representatioin/graph_from_data.dart';

class WorkoutGraph extends StatelessWidget {
  const WorkoutGraph({Key? key, required this.height, required this.width, required this.workoutName, required this.presentationMode}) : super(key: key);

  final double height;
  final double width;
  final String workoutName;
  final String presentationMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 24),
      child: Container(
        height: height,
        width: width,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
          ),
          child: LineChartWidget(workoutName: workoutName, presentationMode: presentationMode,),
        ),
      ),
    );
  }
}
