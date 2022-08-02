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
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Container(
              alignment: Alignment.center,
              height: h*15,
              child: const Text(
                "The Workout App 0_0",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            // child: AppBar(
            //   // shape: ,
            //   title: const Text(
            //     "The Workout App 0_0",
            //     style: TextStyle(fontSize: 25),
            //   ),
            //   centerTitle: true,
            // ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: h*0.25,
                color: Colors.white,
              ),
              SizedBox(
                height: h * 2.5,
              ),
              Container(
                alignment: Alignment.center,
                child: ImageSlideshow(
                  height: h * 35,
                  width: w * 80,
                  children: [
                    Image.asset('assets/images/homepage_slideshow/test.png'),
                    Image.asset('assets/images/homepage_slideshow/test.png'),
                    Image.asset('assets/images/homepage_slideshow/test.png'),
                    Image.asset('assets/images/homepage_slideshow/test.png'),
                  ],
                ),
              ),
              SizedBox(
                height: h*5,
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(w*80, h*13),
                    onSurface: Colors.black,
                      side: const BorderSide(color: Colors.white, width: 2.5),
                      shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                      )
                  ),
                  onPressed: () {print("Button 1 pressed.");},
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
                      onSurface: Colors.black,
                      side: const BorderSide(color: Colors.white, width: 2.5),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero
                      )
                  ),
                  onPressed: () {print("Button 2 pressed.");},
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

            ],
          ),
        ),
      );
    });
  }
}
