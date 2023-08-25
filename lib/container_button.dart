import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiple_calculators/age/age_calcultor.dart';
import 'package:multiple_calculators/bmi/bmi_calculator.dart';

//BMI Container button
class ContainerButton1 extends StatelessWidget {
  const ContainerButton1({super.key});
  @override
  Widget build(context) {
    return ClipRRect(
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
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const Bmicalculator()));},
            style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    width: 0.0001, color: Color.fromARGB(255, 255, 255, 255))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'BMI Calculator',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text(
                      'Using this calculator you will be able to',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(190, 255, 255, 255),
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'calculate your BMI',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(190, 255, 255, 255),
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}

//Age Container button
class ContainerButton2 extends StatelessWidget {
  const ContainerButton2({super.key});
  @override
  Widget build(context) {
    return ClipRRect(
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
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => AgeCal())));
            },
            style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    width: 0.0001, color: Color.fromARGB(255, 255, 255, 255))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Age Calculator',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text(
                      'Using this calculator you will be able to',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(190, 255, 255, 255),
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'calculate your Age',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(190, 255, 255, 255),
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}

//GPA Container button
class ContainerButton3 extends StatelessWidget {
  const ContainerButton3({super.key});
  @override
  Widget build(context) {
    return ClipRRect(
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
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    width: 0.0001, color: Color.fromARGB(255, 255, 255, 255))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'GPA Calculator',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text(
                      'Using this calculator you will be able to',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(190, 255, 255, 255),
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'calculate your GPA',
                      style: GoogleFonts.inter(
                          color: const Color.fromARGB(190, 255, 255, 255),
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
