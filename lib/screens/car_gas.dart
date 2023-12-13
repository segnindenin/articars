import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarGas extends StatefulWidget {
  const CarGas({super.key});

  @override
  State<CarGas> createState() => _CarGasState();
}

class _CarGasState extends State<CarGas> {
  late String token = '';
  var backc = const Color.fromARGB(255, 237, 235, 229);
  var backb = const Color.fromARGB(255, 26, 56, 205);
  final List<String> itemList = [
    'Janvier',
    'Fevrier',
    'Mars',
    'Avril',
    'Mai',
    'Juin',
    'Juillet',
    'Août',
    'Septembre',
    'Octobre',
    'Novembre',
    'Decembre',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backb,
        title: Text(
          'Carburant',
          style: GoogleFonts.openSans(
              fontSize: 23, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 60.0, // Hauteur de la ligne
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 130.0, // Largeur de chaque élément
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        itemList[index],
                        style: GoogleFonts.openSans(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 365,
              height: 200 * 5,
              // color: Colors.amber,
              child: Column(
                children: <Widget>[
                  InkWell(
                    child: Container(
                        width: 365,
                        height: 200,
                        margin: const EdgeInsets.all(3),
                        // padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color.fromARGB(255, 229, 219, 219),
                              width: 2),
                          // color: Colors.white,
                        ),
                        // color: backc,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '2023-12-13',
                                    style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Garage',
                                    style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('GEPA-service',
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Kilométrage'),
                                  Text('Kilométrage prochaine visite',
                                      style: GoogleFonts.openSans(
                                        fontSize: 15,
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('10 000 Km',
                                      style: GoogleFonts.openSans(
                                        fontSize: 20,
                                      )),
                                  Text('0 Km',
                                      style: GoogleFonts.openSans(
                                        fontSize: 20,
                                      ))
                                ],
                              ),
                              const Divider(
                                color: Color.fromARGB(255, 100, 98, 98),
                                indent: 10,
                                endIndent: 10,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Text("Huile : "),
                                    Text("20W50",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ]),
                                  Row(children: [
                                    Text("Filtre : "),
                                    Icon(Icons.oil_barrel_outlined),
                                    Text("Oui",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Icon(Icons.air_outlined),
                                    Text("Oui",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ]),
                                  Row(children: [
                                    Text("Bougies : "),
                                    Text("Oui",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ]),
                                ],
                              ),
                              const Row(
                                children: [
                                  Text('Autre :'),
                                ],
                              ),
                              const Row(
                                children: [
                                  Text('Parebrise anti reflets :'),
                                ],
                              ),
                            ],
                          ),
                        )),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const CarGas()));
                      debugPrint("Tapped on container Suivie");
                    },
                  ),
                  InkWell(
                    child: Container(
                        width: 365,
                        height: 200,
                        margin: const EdgeInsets.all(3),
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
                      debugPrint("Tapped on container Entretien");
                    },
                  ),
                  InkWell(
                    child: Container(
                        width: 365,
                        height: 200,
                        margin: const EdgeInsets.all(3),
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
                      debugPrint("Tapped on container Carburant");
                    },
                  ),
                  InkWell(
                    child: Container(
                        width: 365,
                        height: 200,
                        margin: const EdgeInsets.all(3),
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
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: backb,
          onPressed: () {},
          label: const Icon(Icons.post_add, size: 35)),
    );
  }
}
