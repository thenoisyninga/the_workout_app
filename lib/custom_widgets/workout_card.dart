import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../data_management/workout_card_data_management.dart';

class WorkoutCard extends StatefulWidget {
  final String workoutName;
  final int perSetValue;
  final int numOfSetsValue;

  Function removeACardCallback;

  WorkoutCard(
      {Key? key,
      required this.workoutName,
      required this.removeACardCallback,
      required this.perSetValue,
      required this.numOfSetsValue})
      : super(key: key);

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  final _perSetInputController = TextEditingController();

  final _numOfSetsInputController = TextEditingController();

  int _perSet = 0;

  int _numOfSets = 1;

  String getWorkoutName() {
    return widget.workoutName;
  }

  @override
  void initState() {
    _numOfSetsInputController.text = '${widget.numOfSetsValue}';
    _perSetInputController.text = '${widget.perSetValue}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final h = constraints.maxHeight / 100;
      final w = constraints.maxWidth / 100;
      return Padding(
        padding: EdgeInsets.fromLTRB(w * 2, w * 1.5, w * 2, w * 1.5),
        child: Card(
          elevation: 20,
          color: const Color(0xFF090808),
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xFFEAEAEA), width: 1.5),
              borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 40 * w,
            width: 10 * w,
            // color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(w * 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: w * 3,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(w * 5, 0, w * 5, 0),
                    child: Container(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        getWorkoutName(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: w * 3,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 40,
                        width: 70,
                        child: TextField(
                          controller: _perSetInputController,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.top,
                          onChanged: (text) {
                            setPerSetValue(getWorkoutName(), int.parse(text));
                          },
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            labelText: 'per Set',
                            labelStyle: TextStyle(
                                fontSize: 12, color: Colors.grey[200]),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w * 3,
                      ),
                      Container(
                        height: 40,
                        width: 70,
                        child: TextField(
                          controller: _numOfSetsInputController,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.top,
                          onChanged: (text) {
                            setNumOfSetsValue(
                                getWorkoutName(), int.parse(text));
                          },
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            labelText: '# of Sets',
                            labelStyle: TextStyle(
                                fontSize: 11, color: Colors.grey[200]),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w * 6,
                      ),
                      TextButton(
                          onPressed: () {
                            // removeWorkoutData('Push-ups');
                            widget.removeACardCallback(getWorkoutName());
                          },
                          style: ButtonStyle(),
                          child: Text(
                            "Remove Entry",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
