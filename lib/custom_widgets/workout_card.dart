import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final double h;
  final double w;
  final String workoutName;
  final _perSetInputController = TextEditingController();
  final _numOfSetsInputController = TextEditingController();
  int _perSet = 0;
  int _numOfSets = 1;

  String getWorkoutName() {
    return workoutName;
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

  WorkoutCard({Key? key, required this.h, required this.w, required this.workoutName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(h * 2, h * 1.5, h * 2, h * 1.5),
      child: Card(
        elevation: 20,
        color: const Color(0xFF090808),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFEAEAEA), width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 15 * h,
          width: 10 * w,
          // color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(h * 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AutoSizeText(
                  'Pushups',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                          fontSize: 12,
                          color: Colors.grey[200]),
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
                  width: w*3,
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
                          fontSize: 11,
                          color: Colors.grey[200]),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
