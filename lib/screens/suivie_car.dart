import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuivieCar extends StatefulWidget {
  const SuivieCar({super.key});

  @override
  State<SuivieCar> createState() => _SuivieCarState();
}

class _SuivieCarState extends State<SuivieCar> {
  late String token = '';
  var backc = const Color.fromARGB(255, 237, 235, 229);
  var backb = const Color.fromARGB(255, 26, 56, 205);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backb,
        title: Text(
          'Carnet Suivie',
          style: GoogleFonts.openSans(
              fontSize: 23, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 365,
                height: 200 * 5,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 365,
                      height: 200,
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromARGB(255, 229, 219, 219),
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 6, 91, 248),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  const Text(
                                    'Asurance Auto',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                  IconButton(
                                      iconSize: 40,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add_circle_outline_outlined,
                                        color: Colors.white,
                                        // size: 15,
                                      ))
                                ]),
                          ),
                          const Positioned(
                              top: 25,
                              left: 25,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.caradisiac.com/images/5/7/3/6/205736/S0-quelle-sera-la-voiture-de-l-annee-2024-780687.jpg'),
                              )),
                          const Positioned(
                              top: 60,
                              left: 250,
                              child: Row(
                                children: [
                                  Icon(Icons.directions_car),
                                  Text(
                                    'AA 345 AC',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                          Positioned(
                              top: 80,
                              left: 25,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'numero de la police',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    '5e5a23e9-1761-4a17-ad2b-6f57ed79e3c9',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 200,
                                      ),
                                      Text(
                                        'SANLAM Assurance',
                                        style: TextStyle(
                                            // fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Emission'),
                                          Text('3 juin 2023',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500))
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 90,
                                      ),
                                      ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .blue, // Couleur de fond du bouton
                                          ),
                                          onPressed: () {},
                                          icon:
                                              const Icon(Icons.calendar_month),
                                          label: const Text('2 Sept. 2023'))
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: 365,
                      height: 200,
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromARGB(255, 229, 219, 219),
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 6, 91, 248),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  const Text(
                                    'Visite Technique',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                  IconButton(
                                      iconSize: 40,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add_circle_outline_outlined,
                                        color: Colors.white,
                                        // size: 15,
                                      ))
                                ]),
                          ),
                          const Positioned(
                              top: 25,
                              left: 25,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.caradisiac.com/images/5/7/3/6/205736/S0-quelle-sera-la-voiture-de-l-annee-2024-780687.jpg'),
                              )),
                          const Positioned(
                              top: 60,
                              left: 250,
                              child: Row(
                                children: [
                                  Icon(Icons.directions_car),
                                  Text(
                                    'AA 345 AC',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                          Positioned(
                              top: 80,
                              left: 25,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'numero de la police',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    '5e5a23e9-1761-4a17-ad2b-6f57ed79e3c9',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 200,
                                      ),
                                      Text(
                                        'SANLAM Assurance',
                                        style: TextStyle(
                                            // fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Emission'),
                                          Text('3 juin 2023',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500))
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 90,
                                      ),
                                      ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .blue, // Couleur de fond du bouton
                                          ),
                                          onPressed: () {},
                                          icon:
                                              const Icon(Icons.calendar_month),
                                          label: const Text('2 Sept. 2023'))
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: 365,
                      height: 200,
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromARGB(255, 229, 219, 219),
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 6, 91, 248),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  const Text(
                                    'Vignette Auto',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                  IconButton(
                                      iconSize: 40,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add_circle_outline_outlined,
                                        color: Colors.white,
                                        // size: 15,
                                      ))
                                ]),
                          ),
                          const Positioned(
                              top: 25,
                              left: 25,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.caradisiac.com/images/5/7/3/6/205736/S0-quelle-sera-la-voiture-de-l-annee-2024-780687.jpg'),
                              )),
                          const Positioned(
                              top: 60,
                              left: 250,
                              child: Row(
                                children: [
                                  Icon(Icons.directions_car),
                                  Text(
                                    'AA 345 AC',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                          Positioned(
                              top: 80,
                              left: 25,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'numero de la police',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    '5e5a23e9-1761-4a17-ad2b-6f57ed79e3c9',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 200,
                                      ),
                                      Text(
                                        'SANLAM Assurance',
                                        style: TextStyle(
                                            // fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Emission'),
                                          Text('3 juin 2023',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500))
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 90,
                                      ),
                                      ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .blue, // Couleur de fond du bouton
                                          ),
                                          onPressed: () {},
                                          icon:
                                              const Icon(Icons.calendar_month),
                                          label: const Text('2 Sept. 2023'))
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: backb,
          onPressed: () {},
          label: const Icon(Icons.post_add, size: 35)),
    );
  }
}
