import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final h = constraints.maxHeight / 100;
      final w = constraints.maxWidth / 100;
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "The Workout App 0_0",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          body: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   height: h*0.25,
                //   color: Colors.white,
                // ),
                SizedBox(
                  height: h * 3,
                ),
                Container(
                  color: Colors.white,
                  height: h*40,
                  width: w*80,
                  alignment: Alignment.center,
                  child: ImageSlideshow(
                    height: (h*40)-4,
                    width: (w*80)-4,
                    children: [
                      Image.asset('assets/images/homepage_slideshow/testPhoto.png', fit: BoxFit.cover,),
                      Image.asset('assets/images/homepage_slideshow/testPhoto.png', fit: BoxFit.cover,),
                      Image.asset('assets/images/homepage_slideshow/testPhoto.png', fit: BoxFit.cover,),
                      Image.asset('assets/images/homepage_slideshow/testPhoto.png', fit: BoxFit.cover,),
                    ],
                  ),
                ),
                SizedBox(
                  height: h*5,
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(w*80, h*13),
                        backgroundColor: Colors.black,
                        side: const BorderSide(color: Colors.white, width: 2.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: () {Navigator.pushNamed(context, '/progress_analytics');},
                    child: const Text(
                      'Apki Purani Progress',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    )),
                SizedBox(
                  height: h*5,
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(w*80, h*13),
                        backgroundColor: Colors.black,
                        side: const BorderSide(color: Colors.white, width: 2.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: () {Navigator.pushNamed(context, '/add_new_progress');},
                    child: const Text(
                      'Add New Progress',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    )),
                SizedBox(
                  height: h*5,
                ),

              ],
            ),
          ),
        ),
      );
    });
  }
}
