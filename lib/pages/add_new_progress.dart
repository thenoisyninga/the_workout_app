import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom_widgets/workout_card.dart';

class AddNewProgress extends StatelessWidget {
  const AddNewProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              WorkoutCard(
                h: h,
                w: w, workoutName: 'Push-ups',
              ),
              WorkoutCard(
                h: h,
                w: w, workoutName: 'Push-ups',
              ),
              WorkoutCard(
                h: h,
                w: w, workoutName: 'Push-ups',
              ),
              WorkoutCard(
                h: h,
                w: w, workoutName: 'Push-ups',
              ),
              WorkoutCard(
                h: h,
                w: w, workoutName: 'Push-ups',
              ),
              WorkoutCard(
                h: h,
                w: w, workoutName: 'Push-ups',
              ),
              WorkoutCard(
                h: h,
                w: w, workoutName: 'Push-ups',
              ),
              WorkoutCard(
                h: h,
                w: w, workoutName: 'Push-ups',
              ),
              WorkoutCard(
                h: h,
                w: w, workoutName: 'Push-ups',
              ),
              WorkoutCard(
                h: h,
                w: w, workoutName: 'Push-ups',
              ),

            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {},
              shape: const CircleBorder(side: BorderSide(color: Colors.white)),
              child: const Icon(Icons.add)),
        ),
      );
    });
  }
}

