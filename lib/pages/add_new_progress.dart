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
            title: Text(
              'Add New Progress',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              WorkoutCard(h: h, w: w,),
              WorkoutCard(h: h, w: w,),
              WorkoutCard(h: h, w: w,),
              WorkoutCard(h: h, w: w,),
              WorkoutCard(h: h, w: w,),
              WorkoutCard(h: h, w: w,),
            ],
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
      padding: EdgeInsets.fromLTRB(h*2, h*1.5, h*2, h*1.5),
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          height: 15*h,
          width:  10*w,
          // color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(h*3),
            child: TextButton(
              style: TextButton.styleFrom(
                fixedSize: Size(h*2, w * 5),
                backgroundColor: Colors.blue
              ),
              child: Text("A button"),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
