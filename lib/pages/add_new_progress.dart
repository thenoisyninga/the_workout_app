import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom_widgets/workout_card.dart';
import '../data_management/workout_card_data_management.dart';

class AddNewProgress extends StatefulWidget {
  AddNewProgress({Key? key}) : super(key: key);

  @override
  State<AddNewProgress> createState() => _AddNewProgressState();
}

class _AddNewProgressState extends State<AddNewProgress> {
  List<Map> workoutCardsData = getWorkoutCardDataList();

  void addNewWorkout(String workoutName) {
    setState(() {
      addWorkoutData(workoutName, 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map> workoutCardsData = getWorkoutCardDataList();
    return LayoutBuilder(builder: (context, constraints) {
      final h = constraints.maxHeight / 100;
      final w = constraints.maxWidth / 100;

      return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: AppBar(
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.check_circle_outline_rounded,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
                SizedBox(width: w * 3),
              ],
              title: const Text(
                'Add New Progress',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              centerTitle: true,
            ),
          ),
          body: SizedBox(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: workoutCardsData.map((workoutName) => WorkoutCard(workoutName: workoutName)).toList(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                addNewWorkout('Push-ups');
                print('buttonPressed');
                print(workoutCardsData);
              },
              shape: const CircleBorder(side: BorderSide(color: Colors.white)),
              child: const Icon(Icons.add)),
        ),
      );
    });
  }
}
