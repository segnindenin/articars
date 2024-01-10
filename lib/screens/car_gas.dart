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
              width: 365,
              height: 200 * 5,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 365,
                      height: 250,
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromARGB(255, 229, 219, 219),
                            width: 2),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            IntrinsicHeight(
                              child: Row(
                                children: <Widget>[
                                  const VerticalDivider(
                                    thickness: 10,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    'Conso. Mensuelle(Juillet)',
                                    style: GoogleFonts.openSans(
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      verticalDirection: VerticalDirection
                                          .up, // <-- reverse direction
                                      children: [
                                        Text(
                                          '70',
                                          style: GoogleFonts.openSans(
                                              fontSize: 90,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold),
                                        ), // <-- first child
                                      ],
                                    ),
                                    Text(
                                      'Litres',
                                      style: GoogleFonts.openSans(
                                          fontSize: 18,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 130,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    color: Color.fromARGB(255, 79, 152, 212),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          '40',
                                          style: GoogleFonts.openSans(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Rechargement(s)',
                                          style: GoogleFonts.openSans(
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '19000',
                                          style: GoogleFonts.openSans(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Dépences(FCFA)',
                                          style: GoogleFonts.openSans(
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              color: Color.fromARGB(255, 100, 98, 98),
                              indent: 10,
                              endIndent: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Dernier Rechargement',
                                  style: GoogleFonts.openSans(
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '2023-12-14',
                                  style: GoogleFonts.openSans(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '36 ',
                                      style: GoogleFonts.openSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Litre',
                                      style: GoogleFonts.openSans(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                                Text(
                                  '48 000 FCFA',
                                  style: GoogleFonts.openSans(
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
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
                  const Text(
                    'Listes de regargement effectuées',
                  ),
                  Container(
                      width: 365,
                      height: 400,
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromARGB(255, 229, 219, 219),
                            width: 2),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.local_gas_station,
                                      color: Color.fromARGB(255, 87, 85, 85),
                                      size: 33,
                                    ),
                                    RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color:
                                              Color.fromARGB(255, 87, 85, 85),
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '15 ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.0,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'litre',
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      color: Color.fromARGB(255, 87, 85, 85),
                                      Icons.calendar_month,
                                      size: 33,
                                    ),
                                    Text(
                                      ' 2023-12-14',
                                      style: GoogleFonts.openSans(
                                          color: const Color.fromARGB(
                                              255, 87, 85, 85),
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.attach_money,
                                      size: 33,
                                      color: Color.fromARGB(255, 87, 85, 85),
                                    ),
                                    Text(
                                      ' 20 000 FCFA',
                                      style: GoogleFonts.openSans(
                                          color: const Color.fromARGB(
                                              255, 87, 85, 85),
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 110, 164, 209),
                            indent: 10,
                            endIndent: 10,
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.local_gas_station,
                                      color: Color.fromARGB(255, 87, 85, 85),
                                      size: 33,
                                    ),
                                    RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color:
                                              Color.fromARGB(255, 87, 85, 85),
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '15 ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.0,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'litre',
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      color: Color.fromARGB(255, 87, 85, 85),
                                      Icons.calendar_month,
                                      size: 33,
                                    ),
                                    Text(
                                      ' 2023-12-14',
                                      style: GoogleFonts.openSans(
                                          color: const Color.fromARGB(
                                              255, 87, 85, 85),
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.attach_money,
                                      size: 33,
                                      color: Color.fromARGB(255, 87, 85, 85),
                                    ),
                                    Text(
                                      ' 20 000 FCFA',
                                      style: GoogleFonts.openSans(
                                          color: const Color.fromARGB(
                                              255, 87, 85, 85),
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 110, 164, 209),
                            indent: 10,
                            endIndent: 10,
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.local_gas_station,
                                      color: Color.fromARGB(255, 87, 85, 85),
                                      size: 33,
                                    ),
                                    RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color:
                                              Color.fromARGB(255, 87, 85, 85),
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '15 ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.0,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'litre',
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      color: Color.fromARGB(255, 87, 85, 85),
                                      Icons.calendar_month,
                                      size: 33,
                                    ),
                                    Text(
                                      ' 2023-12-14',
                                      style: GoogleFonts.openSans(
                                          color: const Color.fromARGB(
                                              255, 87, 85, 85),
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.attach_money,
                                      size: 33,
                                      color: Color.fromARGB(255, 87, 85, 85),
                                    ),
                                    Text(
                                      ' 20 000 FCFA',
                                      style: GoogleFonts.openSans(
                                          color: const Color.fromARGB(
                                              255, 87, 85, 85),
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 110, 164, 209),
                            indent: 10,
                            endIndent: 10,
                          ),
                        ],
                      )),
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
          label: const Icon(Icons.add, size: 35)),
    );
  }
}
