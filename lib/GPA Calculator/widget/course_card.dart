import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:multiple_calculators/GPA Calculator/GPA_Homepage.dart';
import 'package:multiple_calculators/GPA Calculator/Course_widget.dart';

class CourseCard extends StatelessWidget {
  CourseCard({required this.course, super.key});
  Course course;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(course.courseName),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("grade : ${course.grade}"),
                const SizedBox(
                  width: 10,
                ),
                Text("credit : ${course.credite.toString()}")
              ],
            )
          ],
        ),
      ),
    );
  }
}
