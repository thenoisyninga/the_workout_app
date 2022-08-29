import 'package:flutter/material.dart';

import '../custom_widgets/workout_card.dart';
import '../data_management/database_operations.dart';
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
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.grey[900],
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white, width: 2),
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
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          backgroundColor: Color(0xFF262626),
                              title: Text(
                                  "Are you sure you want to log this data for today?", style: TextStyle(color: Colors.white),),
                              content: Text(
                                  "Today's data for these workouts will be over-written", style: TextStyle(color: Colors.grey[500]),),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      addStoredWorkoutDataToDatabase();
                                      Navigator.pop(_);
                                      showDialog(context: context, builder: (_) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.white,
                                            width: 4,
                                          ),
                                          borderRadius: BorderRadius.circular(30)
                                        ),
                                        backgroundColor: Colors.black,
                                        content: Container(
                                          color: Colors.black,
                                          height: h*15,
                                          width: w*60,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Progress Updated', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                                              SizedBox(height: h*2,),
                                              Icon(Icons.check_circle, color: Colors.white, size: 50,)
                                            ],
                                          ),
                                        ),
                                      ));
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
                  },
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
            future: getPersistedWorkoutCardDataList(),
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
                var newWorkoutController = TextEditingController();
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.white,
                                width: 4,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          content: Container(
                            height: h * 35,
                            width: w * 70,
                            child: Column(
                              children: [
                                SizedBox(height: h*3,),
                                Text(
                                  'Add New Workout',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: h*5,),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(w*2, 0, w*2, 0),
                                  child: TextField(
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      cursorColor: Colors.white,
                                      controller: newWorkoutController,
                                      decoration: InputDecoration(
                                          focusColor: Colors.red,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          label: Text(
                                            'Workout Name',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          labelStyle:
                                              TextStyle(color: Colors.white))),
                                ),
                                SizedBox(height: h*2,),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        onSurface: Colors.black,
                                        side: BorderSide(
                                          color: Colors.white,
                                        )),
                                    onPressed: () {
                                      addNewWorkout(newWorkoutController.text);
                                      Navigator.pop(_);
                                    },
                                    child: Text(
                                      'Add',
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ],
                            ),
                          ),
                        ));
              },
              shape: const CircleBorder(side: BorderSide(color: Colors.white)),
              child: const Icon(Icons.add)),
        ),
      );
    });
  }
}
