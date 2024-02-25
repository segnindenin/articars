import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VisiteAutoLists extends StatefulWidget {
  final Function(int?)? showVisiteForm;
  const VisiteAutoLists({super.key, required this.showVisiteForm});

  @override
  State<VisiteAutoLists> createState() => _VisiteAutoListsState();
}

class _VisiteAutoListsState extends State<VisiteAutoLists> {
  late String token = '';
  var backc = const Color.fromARGB(255, 237, 235, 229);
  var backb = const Color.fromARGB(255, 26, 56, 205);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backb,
        title: Text(
          'Assurance Auto',
          style: GoogleFonts.openSans(
              fontSize: 23, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              width: 365,
              height: 180 * 5,
              child: Column(
                children: <Widget>[
                  customList('25 fev 2023'),
                  customList('3 fev 2024'),
                  customList('3 jan 2024'),
                  customList('3 déc 2023'),
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
          onPressed: () => widget.showVisiteForm?.call(null),
          label: const Icon(Icons.post_add, size: 35)),
    );
  }

  Widget customList(String? date) {
    return Container(
        width: 365,
        height: 180,
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: const Color.fromARGB(255, 229, 219, 219), width: 2),
        ),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              const Positioned(
                  top: 60,
                  left: 250,
                  child: Row(
                    children: [
                      Icon(Icons.directions_car),
                      Text(
                        'AA 345 AC',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
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
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        '5e5a23e9-1761-4a17-ad2b-6f57ed79e3c9',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Divider(
                        color: Color.fromARGB(255, 100, 98, 98),
                        indent: 10,
                        endIndent: 10,
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 200,
                          ),
                          Text(
                            'SANLAM Assurance',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Emission'),
                              Text('$date',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                          const SizedBox(
                            width: 90,
                          ),
                          ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.calendar_month),
                              label: const Text('2 Sept. 2023'))
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
