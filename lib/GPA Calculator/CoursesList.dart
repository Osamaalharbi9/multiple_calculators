import 'package:flutter/material.dart';
import 'package:multiple_calculators/GPA Calculator/GPA_Homepage.dart';
import 'package:multiple_calculators/GPA Calculator/Course_widget.dart';
import 'package:multiple_calculators/GPA Calculator/Course_widget.dart';
import 'package:multiple_calculators/GPA%20Calculator/widget/course_card.dart';

class CoursrsList extends StatelessWidget {
  CoursrsList(this.courses, {required this.removeCourse, super.key});
  List<Course> courses;
  void Function(Course deletedCourse) removeCourse;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return Dismissible(
            key: ValueKey(courses[index]),
            onDismissed: (direction) {
              removeCourse(courses[index]);
            },
            child: CourseCard(
              course: courses[index],
            ));
      },
    );
  }
}
