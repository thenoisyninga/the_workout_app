import 'package:flutter/material.dart';
import 'package:the_workout_app/data_management/database_operations.dart';

import '../custom_widgets/workout_graph.dart';

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
          child: FutureBuilder(
            future: getDatabaseTablesList(),
            builder:
                (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              if (snapshot.hasData) {
                return ListView(padding: EdgeInsets.all(w * 4), children: [
                  for (String workoutName in snapshot.data as List<String>)
                    (WorkoutGraph(
                      workoutName: workoutName,
                      presentationMode: 'weekly',
                      width: 300,
                      height: 375,
                    ))
                ]);
              } else {
                return SizedBox(height: 10, width: 10, child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ));
    });
  }
}
