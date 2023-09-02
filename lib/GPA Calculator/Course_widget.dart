class Course {
  Course(
      {required this.grade, required this.courseName, required this.credite});
  String grade;
  String courseName;
  int credite;
}

List<String> CoursesType = ["GPA out of 5", "GPA out of 4"];

List<String> grades = ["A+", "A", "B+", "B", "C+", "C", "D+", "D", "F"];

Map<String, double> grades4 = {
  "A+": 4,
  "A": 3.75,
  "B+": 3.5,
  "B": 3,
  "C+": 2.5,
  "C": 2,
  "D+": 1.5,
  "D": 1,
  "F": 0,
};
Map<String, double> grades5 = {
  "A+": 5,
  "A": 4.75,
  "B+": 4.5,
  "B": 4,
  "C+": 3.5,
  "C": 3,
  "D+": 2.5,
  "D": 2,
  "F": 1,
};
