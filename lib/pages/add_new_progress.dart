import 'package:flutter/material.dart';

import '../custom_widgets/workout_card.dart';
import '../data_management/workout_card_data_management.dart';

class AddNewProgress extends StatefulWidget {
  AddNewProgress({Key? key}) : super(key: key);

  @override
  State<AddNewProgress> createState() => _AddNewProgressState();
}

class _AddNewProgressState extends State<AddNewProgress> {
  void addNewWorkout(String workoutName) {
    setState(() {
      addWorkoutData(workoutName, 1, 1);
    });
  }

  void removeACard(String workoutName) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          alignment: Alignment.center,
              title: const Text(
                "Are you sure?",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              actions: [
                TextButton(
                    onPressed: () {
                      removeWorkoutData(workoutName);
                      setState(() {});
                      Navigator.pop(_);
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(_);
                    },
                    child: Text(
                      'No',
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ));
  }

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
          body: SizedBox(
              child: FutureBuilder(
            future: getWorkoutCardDataList(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<dynamic, dynamic>>> snapshot) {
              return ListView(
                scrollDirection: Axis.vertical,
                children: snapshot.data!
                    .map((workoutData) => WorkoutCard(
                          workoutName: workoutData['workoutName'],
                          removeACardCallback: removeACard,
                          numOfSetsValue: workoutData['numOfSets'],
                          perSetValue: workoutData['perSet'],
                        ))
                    .toList(),
              );
            },
          )
              // ListView(
              //   scrollDirection: Axis.vertical,
              //   children: workoutCardsData.map((workoutData) => WorkoutCard(workoutName: workoutData['workoutName'])).toList(),
              // ),
              ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                addNewWorkout('Push-ups');
              },
              shape: const CircleBorder(side: BorderSide(color: Colors.white)),
              child: const Icon(Icons.add)),
        ),
      );
    });
  }
}
