import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNewProgress extends StatelessWidget {
  const AddNewProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final h = constraints.maxHeight / 100;
      final w = constraints.maxWidth / 100;
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check_circle_outline_rounded,
                    size: 35,
                  )),
              SizedBox(width: w * 3),
            ],
            title: const Text(
              'Add New Progress',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
              WorkoutCard(
                h: h,
                w: w,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {},
              shape: const CircleBorder(
                  side: BorderSide(color: Colors.white)),
              child: const Icon(Icons.add)),
        ),
      );
    });
  }
}

class WorkoutCard extends StatelessWidget {
  final double h;
  final double w;

  WorkoutCard({Key? key, required this.h, required this.w}) : super(key: key);

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
                Text(
                  'Pushups',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 40,
                  width: 70,
                  child:  TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: 'per Set',
                      labelStyle: TextStyle(
                        color: Colors.grey[200]
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 70,
                  child:  TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: 'per Set',
                      labelStyle: TextStyle(
                          color: Colors.grey[200]
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white
                        ),
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
