import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:multiple_calculators/main.dart';

class Bmicalculator extends StatefulWidget {
  const Bmicalculator({super.key});

  @override
  State<Bmicalculator> createState() => _BmicalculatorState();
}

class _BmicalculatorState extends State<Bmicalculator> {
  Color? userstatecolor;
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  double num1 = 0, num2 = 0, heightconverter = 0, num3 = 0, result = 0;
  String displayrate = '';
  var userstate = '';
  calculate() {
    setState(() {
      num1 = double.parse(height.text);
      num2 = double.parse(weight.text);
      heightconverter = num1 / 100;
      num3 = heightconverter * heightconverter;
      result = num2 / num3;
      displayrate = result.toStringAsFixed(2);
      if (result < 18.5) {
        userstate = 'Underweight';
        userstatecolor = const Color.fromARGB(255, 255, 59, 45);
      } else if (18.5 < result && result <= 24.9) {
        userstate = 'Normal';
        userstatecolor = Colors.green;
      } else if (25 <= result && result <= 29.9) {
        userstatecolor = const Color.fromARGB(255, 255, 55, 41);
        userstate = 'Overweight';
      } else if (30 <= result && result <= 34.9) {
        userstate = 'Obese';
        userstatecolor = const Color.fromARGB(255, 166, 11, 0);
      } else if (result >= 35) {
        userstate = 'Extremely Obese';
        userstatecolor = const Color.fromARGB(255, 105, 7, 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 255, 174, 204),
            Color.fromARGB(255, 255, 233, 241)
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 190,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 440,
                width: 333,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'BMI Calculator',
                      style: GoogleFonts.inter(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextField(
                        keyboardType: const TextInputType.numberWithOptions(),
                        controller: height,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 239, 239, 239),
                            hintText: 'Enter your height',
                            prefixIcon: const Icon(Icons.height),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextField(
                        keyboardType: const TextInputType.numberWithOptions(),
                        controller: weight,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 239, 239, 239),
                            hintText: 'Enter your weight',
                            prefixIcon:
                                const Icon(Icons.monitor_weight_outlined),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      userstate,
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: userstatecolor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(displayrate,
                        style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    const SizedBox(
                      height: 20,
                    ),
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
                        height: 74,
                        child: OutlinedButton(
                            onPressed: calculate,
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    width: 0.0001,
                                    color: Color.fromARGB(255, 255, 255, 255))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Calculate',
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 100,
          ),
          GNav(
              mainAxisAlignment: MainAxisAlignment.center,
              tabBorderRadius: 22,
              tabBackgroundColor: Colors.white,
              tabActiveBorder: Border.all(color: Colors.white),
              tabs: [
                GButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Myapp()));
                  },
                  icon: Icons.home,
                  text: 'Home',
                ),
              ])
        ],
      ),
    ));
  }
}
