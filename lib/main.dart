import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiple_calculators/container_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        theme: ThemeData(primarySwatch: Colors.pink),
        home: Scaffold(
          //Background Container color
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color.fromARGB(255, 255, 174, 204),
                  Color.fromARGB(255, 255, 233, 241)
                ])),
            height: double.infinity,
            width: double.infinity,
            //Coulmn inside Background Container
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello Again!',
                  style: GoogleFonts.inter(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'You\'ve been missed',
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.normal), //
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  //White Continer
                  child: Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    height: 440,
                    width: 333,
                    //Column inside the white Container
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'What is Your need',
                          style: GoogleFonts.inter(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        //Container Buttons
                        const ContainerButton1(),
                        const SizedBox(
                          height: 30,
                        ),
                        const ContainerButton2(),
                        const SizedBox(
                          height: 30,
                        ),
                        const ContainerButton3()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      designSize: const Size(852, 393),
    );
  }
}
