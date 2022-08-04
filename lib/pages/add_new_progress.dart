import 'package:flutter/material.dart';

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
              SizedBox(width: w*3),
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
              side: const BorderSide(color: Colors.white)
            ),
            child: const Icon(Icons.add)
          ),
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
                const Text(
                  'Pushups',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'per Set',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 30,
                      width: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '# of Sets',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 30,
                      width: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
