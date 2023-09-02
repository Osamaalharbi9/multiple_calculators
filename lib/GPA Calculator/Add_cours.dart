import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:multiple_calculators/GPA%20Calculator/Course_widget.dart';
import 'package:flutter/material.dart';
import 'package:multiple_calculators/GPA Calculator/Course_widget.dart';

class AddCourse extends StatefulWidget {
  AddCourse({required this.addNewCourse, super.key});
  void Function(Course newCourse) addNewCourse;

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  final _titelContreller = TextEditingController();
  final _crediteController = TextEditingController();
  var _dropbuttonvalue = grades[0];
//this funcation is used in case one off the essential gaps is empty
  void _invaild() {
    final creditNumber = int.tryParse(_crediteController.text);
    var amountnumberIsInvalid = creditNumber == null || creditNumber < 0;
    if (amountnumberIsInvalid == true || _titelContreller.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Someting wrong happened'),
          content:
              const Text('Could you please check your course details again '),
          actions: [
            ElevatedButton(
                onPressed: (() {
                  return Navigator.pop(ctx);
                }),
                child: const Text('OK'))
          ],
        ),
      );
    }

    widget.addNewCourse(Course(
        credite: creditNumber!,
        grade: _dropbuttonvalue,
        courseName: _titelContreller.text));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _crediteController.dispose();
    _titelContreller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        // ignore: sort_child_properties_last
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _titelContreller,
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Course Titel')),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _crediteController,
                      decoration: const InputDecoration(
                        label: Text(
                          "Credit",
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  DropdownButton(
                    value: _dropbuttonvalue,
                    items: grades.map(
                      (e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _dropbuttonvalue = value;
                      });
                    },
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  ElevatedButton(
                      onPressed: _invaild, child: const Text('Add course')),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                  const Spacer(
                    flex: 1,
                  )
                ],
              )
            ],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 0));
  }
}
