import 'package:articars/repository/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  User? currentUser;

  @override
  void initState() {
    super.initState();
    SQLHelper.getUser(1).then((user) {
      setState(() {
        currentUser = user;
      });
    });
  }

  var backc = const Color.fromARGB(255, 237, 235, 229);
  var backb = const Color.fromARGB(255, 111, 187, 215);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // can call SystemNavigator.pop() when return bouton  is pressed
          SystemNavigator.pop();
          return false; // Retournez false pour empêcher la navigation arrière
        },
        child: Scaffold(
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
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/home.jpg',
                          height: 300.0,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 4.0,
                                ),
                              ),
                              child: const CircleAvatar(
                                radius: 60.0,
                                backgroundImage: AssetImage('assets/image.jpg'),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              currentUser != null
                                  ? 'Bienvenu, ${currentUser!.userFirstName} ${currentUser!.userLastName}'
                                  : 'Chargement...',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.0, // Hauteur de la ligne
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 130.0,
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
                      _functionality(
                          icon: Icons.text_snippet_sharp,
                          functName: 'Suivie',
                          moveToScreen: () => const SuivieCar()),
                      _functionality(
                          icon: Icons.recycling,
                          functName: 'Entretien',
                          moveToScreen: () => const CartHealth()),
                      _functionality(
                          icon: Icons.local_gas_station,
                          functName: 'Carburant',
                          moveToScreen: () => const CarGas()),
                      _functionality(
                        icon: Icons.settings_outlined,
                        functName: 'Autre',
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
        ));
  }

  Widget _functionality(
      {required IconData icon,
      required String functName,
      Widget Function()? moveToScreen}) {
    return InkWell(
      child: Container(
          padding: const EdgeInsets.all(8),
          color: backc,
          child: Column(
            children: [
              Icon(
                icon,
                size: 70,
                color: const Color.fromARGB(255, 111, 187, 215),
              ),
              Text(
                functName,
                style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 111, 187, 215),
                ),
              )
            ],
          )),
      onTap: () {
        if (moveToScreen != null) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => moveToScreen()));
        } else {
          debugPrint("Tapped on container $functName");
        }
      },
    );
  }
}
