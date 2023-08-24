import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiple_calculators/main.dart';
import 'package:intl/intl.dart';

class AgeCal extends StatefulWidget {
  const AgeCal({super.key});

  @override
  State<AgeCal> createState() => _AgeCalState();
}

DateTime firstDate = DateTime.now();
DateTime secondDate = DateTime.now();
get daysdiff {
  return secondDate.difference(DateTime(0, 0, 0)).inDays -
      firstDate.difference(DateTime(0, 0, 0)).inDays;
}

get datesdiff {
  return DateTime(0, 0, daysdiff);
}

class _AgeCalState extends State<AgeCal> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Date calcultor',
                style: GoogleFonts.inter(
                    fontSize: 20, fontWeight: FontWeight.bold), //
              ),
              const SizedBox(
                height: 15,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        DateFormat.yMd().format(firstDate),
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.bold), //
                      ),

                      // ignore: sized_box_for_whitespace
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                Color.fromARGB(255, 205, 180, 219),
                                Color.fromARGB(255, 255, 200, 221)
                              ])),
                          width: 250,
                          height: 90,
                          child: OutlinedButton(
                            onPressed: () {
                              showDatePicker(
                                      context: this.context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100))
                                  .then((value) => setState(() {
                                        firstDate = value!;
                                      }));
                            },
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    width: 0.0001,
                                    color: Color.fromARGB(255, 255, 255, 255))),
                            child: Text('First date'),
                          ),
                        ),
                      ),
                      Text(
                        DateFormat.yMd().format(secondDate),
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.bold), //
                      ),
                      SizedBox(
                        width: 250,
                        height: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                  Color.fromARGB(255, 205, 180, 219),
                                  Color.fromARGB(255, 255, 200, 221)
                                ])),
                            width: 250,
                            height: 90,
                            child: OutlinedButton(
                              onPressed: () {
                                showDatePicker(
                                        context: this.context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100))
                                    .then((value) => setState(() {
                                          secondDate = value!;
                                        }));
                              },
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      width: 0.0001,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              child: Text('Second date'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                firstDate.isBefore(secondDate) && daysdiff < 32
                    ? 'Time diffrence : (years:0 months:0 days:${daysdiff} ) '
                    : firstDate.isBefore(secondDate) && daysdiff >= 32
                        ? 'Time diffrence : (years:${DateFormat.y().format(datesdiff)} months:${DateFormat.M().format(datesdiff)} days:${DateFormat.d().format(datesdiff)} ) '
                        : "The first date is after the second date",
                style: GoogleFonts.inter(
                    fontSize: 16, fontWeight: FontWeight.bold), //
              ), //Container Buttons
              SizedBox(
                height: 50,
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
