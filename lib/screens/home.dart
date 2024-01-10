import 'package:flutter/material.dart';
import 'cart_health.dart';
import 'package:google_fonts/google_fonts.dart';
import 'car_gas.dart';
import 'suivie_car.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String token = '';

  var backc = const Color.fromARGB(255, 237, 235, 229);
  var backb = const Color.fromARGB(255, 111, 187, 215);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backc,
        title: Text(
          'Carnet Santé Auto',
          style: GoogleFonts.boogaloo(fontSize: 40, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/home.jpg',
                ),
              ],
            ),
            SizedBox(
              height: 60.0, // Hauteur de la ligne
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    5, // Remplacez cela par le nombre d'éléments que vous avez
                itemBuilder: (context, index) {
                  return Container(
                    width: 130.0, // Largeur de chaque élément
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: const Center(
                      child: Text(
                        'AA 345 AC',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 300,
              margin: const EdgeInsets.all(8),
              child: GridView.count(
                primary: false,
                // padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: (1 / .8),
                children: <Widget>[
                  InkWell(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        color: backc,
                        child: Column(
                          children: [
                            const Icon(
                              Icons.text_snippet_sharp,
                              size: 90,
                              color: Color.fromARGB(255, 111, 187, 215),
                            ),
                            Text(
                              'Suivie',
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 111, 187, 215),
                              ),
                            )
                          ],
                        )),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const SuivieCar()));
                      debugPrint("Tapped on container Suivie");
                    },
                  ),
                  InkWell(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        color: backc,
                        child: Column(
                          children: [
                            const Icon(
                              Icons.recycling,
                              size: 90,
                              color: Color.fromARGB(255, 111, 187, 215),
                            ),
                            Text(
                              'Entretien',
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 111, 187, 215),
                              ),
                            )
                          ],
                        )),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const CartHealth()));
                      debugPrint("Tapped on container Entretien");
                    },
                  ),
                  InkWell(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        color: backc,
                        child: Column(
                          children: [
                            const Icon(
                              Icons.local_gas_station,
                              size: 90,
                              color: Color.fromARGB(255, 111, 187, 215),
                            ),
                            Text(
                              'Carburant',
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 111, 187, 215),
                              ),
                            )
                          ],
                        )),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => const CarGas()));
                      debugPrint("Tapped on container Carburant");
                    },
                  ),
                  InkWell(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        color: backc,
                        child: Column(
                          children: [
                            const Icon(
                              Icons.settings_outlined,
                              size: 90,
                              color: Color.fromARGB(255, 111, 187, 215),
                            ),
                            Text(
                              'Autre',
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 111, 187, 215),
                              ),
                            )
                          ],
                        )),
                    onTap: () {
                      debugPrint("Tapped on container Autre");
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
          ]),
        ),
      ),
    );
  }
}
