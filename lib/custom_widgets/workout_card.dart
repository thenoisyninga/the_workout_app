import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatefulWidget {
  final String workoutName;

  WorkoutCard({Key? key, required this.workoutName}) : super(key: key);

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

  int getPerSet() {
    return int.parse(_numOfSetsInputController.text);
  }

  int getNumOfSets() {
    return int.parse(_perSetInputController.text);
  }

  void setPerSet(int x) {
    _perSetInputController.text = x.toString();
  }

  void setNumOfSets(int x) {
    _numOfSetsInputController.text = x.toString();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final h = constraints.maxHeight / 100;
      final w = constraints.maxWidth / 100;
      print("The screen height constant: $h");
      print("The screen width constant: $w");
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
                    padding: EdgeInsets.fromLTRB(w*5, 0, w*5, 0),
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
                  SizedBox(height: w*3,),
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
                          // TODO: Add system to set input values to private class variables.
                          controller: _perSetInputController,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.top,
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
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.top,
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
                          onPressed: () {},
                          style: ButtonStyle(

                          ),
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
