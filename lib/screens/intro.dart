import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_user.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/car_icon.png',
                  width: 600,
                ),
              ],
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              'Mon carnet Auto',
              style: GoogleFonts.playfairDisplay(
                  fontSize: 35, fontWeight: FontWeight.w500),
            ),
            const Center(
              widthFactor: 350,
              child: Text(
                  'Roulons ensemble pour vaincre les accidents de la route',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const UserRegister()));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(270, 50),
                backgroundColor: const Color.fromARGB(255, 26, 56, 205),
              ),
              icon: const Icon(
                Icons.skip_next,
                color: Colors.white,
              ),
              label: Text(
                "Acceder au carnet",
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ]),
          SizedBox(
            width: MediaQuery.of(context).size.width,
          )
        ]),
      ),
    );
  }
}
