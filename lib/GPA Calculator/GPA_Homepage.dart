import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:multiple_calculators/GPA%20Calculator/Add_cours.dart';
import 'package:multiple_calculators/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiple_calculators/GPA Calculator/Course_widget.dart';
import 'package:multiple_calculators/GPA Calculator/CoursesList.dart';

class GPAHome extends StatefulWidget {
  GPAHome({super.key});

  List<Course> courses = [];

  @override
  State<GPAHome> createState() => _GPAHomeState();
}

class _GPAHomeState extends State<GPAHome> {
  String GPAsystem = "GPA out of 5";
  int GPA = 5;
  int totalcredits = 0;
  double points = 0;
  double finalGPA = 0;
  var values;
  void addcourse(Course newCourse) {
    setState(() {
      widget.courses.add(newCourse);
      totalcredits = totalcredits + newCourse.credite;
      GPAsys();
    });
    print(points);
  }

  void GPAsys() {
    if (GPA == 5) {
      values = widget.courses.map((course) =>
          (grades5[course.grade] as double) * course.credite.toDouble());
      points = values.fold(0.0, (a, b) => a + b);
    } else {
      values = widget.courses.map((course) =>
          (grades4[course.grade] as double) * course.credite.toDouble());
      points = values.fold(0.0, (a, b) => a + b);
    }
  }

  void deletcourse(Course deltedCourse) {
    setState(() {
      widget.courses.remove(deltedCourse);
      totalcredits = totalcredits - deltedCourse.credite;
      GPAsys();
    });
  }

  void _openlayout() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddCourse(
        addNewCourse: addcourse,
      ),
    );
  }

  get GPAcal {
    finalGPA = 0;
    if (widget.courses.isNotEmpty) {
      finalGPA = points / (totalcredits * GPA);
      finalGPA = finalGPA * GPA;
    }

    return Text('GPA : ${finalGPA.toStringAsFixed(2)}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'GPA calcultor',
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            DropdownButton(
              value: GPAsystem,
              items: CoursesType.map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  GPAsystem = value;
                  if (GPAsystem == "GPA out of 5") {
                    GPA = 5;
                  } else {
                    GPA = 4;
                  }
                  GPAsys();
                });
              },
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('creidets : $totalcredits'),
                const SizedBox(
                  width: 16,
                ),
                GPAcal
              ],
            ),

            SizedBox(
              height: 350,
              width: 300,
              child: CoursrsList(removeCourse: deletcourse, widget.courses),
            ),
            //add button
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.blue,
                  onPressed: _openlayout),
            ),
            const SizedBox(
              height: 26,
            ),
            //home button
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 160,
                height: 70,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Myapp())));
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                          width: 0.0001,
                          color: Color.fromARGB(255, 255, 255, 255))),
                  child: const Text(
                    'Home',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ] //
              ),
        ),
      ),
    );
  }
}
