import 'package:articars/widgets/suivie/vignette_auto.dart';
import 'package:articars/widgets/suivie/visite_tech.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/suivie/assurance_auto.dart';

class SuivieCar extends StatefulWidget {
  const SuivieCar({super.key});

  @override
  State<SuivieCar> createState() => _SuivieCarState();
}

class _SuivieCarState extends State<SuivieCar> {
  late String token = '';
  var backc = const Color.fromARGB(255, 237, 235, 229);
  var backb = const Color.fromARGB(255, 26, 56, 205);

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    return formattedDate;
  }

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _assuranceController = TextEditingController();
  final TextEditingController _policeController = TextEditingController();

  void showAssuranceForm(int? id) async {
    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 120,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _dateController,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _policeController,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Numero de la police',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _assuranceController,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Assurance',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  // await _addItem();
                }

                // if (id != null) {
                //   await _updateItem(id);
                // }
                _dateController.text = '';
                _assuranceController.text = '';
                _policeController.text = '';

                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(100, 50),
              ),
              child: Text(
                id == null ? 'Ajouter' : 'Modifier',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showVisiteForm(int? id) async {
    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 120,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _dateController,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _policeController,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Numero de la police',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _assuranceController,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Assurance',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  // await _addItem();
                }

                // if (id != null) {
                //   await _updateItem(id);
                // }
                _dateController.text = '';
                _assuranceController.text = '';
                _policeController.text = '';

                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(100, 50),
              ),
              child: Text(
                id == null ? 'Ajouter' : 'Modifier',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showVignetteForm(int? id) async {
    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 120,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _dateController,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _policeController,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Numero de la police',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _assuranceController,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Assurance',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  // await _addItem();
                }

                // if (id != null) {
                //   await _updateItem(id);
                // }
                _dateController.text = '';
                _assuranceController.text = '';
                _policeController.text = '';

                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(100, 50),
              ),
              child: Text(
                id == null ? 'Ajouter' : 'Modifier',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                    _activity(
                        activityName: 'Asurance Auto',
                        moveToActivity: () => AssuranceAutoLists(
                              showAssuranceForm: showAssuranceForm,
                            ),
                        date: '25 fev 2024',
                        activityColor: const Color(0xFF4B39EF)),
                    _activity(
                        activityName: 'Visite Technique',
                        moveToActivity: () => VignetteAutoLists(
                              showVignetteForm: showVignetteForm,
                            ),
                        date: '25 fev 2024',
                        activityColor: const Color(0xFFFF5963)),
                    _activity(
                        activityName: 'Vignette Auto',
                        moveToActivity: () => VisiteAutoLists(
                              showVisiteForm: showVisiteForm,
                            ),
                        date: '25 fev 2024',
                        activityColor: const Color(0xFF249689)),
                    _activity(
                        activityName: 'Vignette Commerciale',
                        date: '25 fev 2024',
                        activityColor: Colors.black),
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
    );
  }

  Widget _activity(
      {required String activityName,
      Widget Function()? moveToActivity,
      String? date,
      Color? activityColor}) {
    return InkWell(
      child: Container(
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
              decoration: BoxDecoration(
                color: activityColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 70,
                    ),
                    Text(
                      activityName,
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    IconButton(
                        iconSize: 40,
                        onPressed: () => showAssuranceForm(null),
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
                  backgroundImage: AssetImage('assets/image.jpg'),
                )),
            const Positioned(
                top: 60,
                left: 250,
                child: Row(
                  children: [
                    Icon(Icons.directions_car),
                    Text(
                      'AA 345 AC',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '5e5a23e9-1761-4a17-ad2b-6f57ed79e3c9',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Emission'),
                            Text('$date',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500))
                          ],
                        ),
                        const SizedBox(
                          width: 90,
                        ),
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.blue, // Couleur de fond du bouton
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
      ),
      onTap: () {
        if (moveToActivity != null) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => moveToActivity()));
        } else {
          debugPrint("Tapped on container $activityName");
        }
      },
    );
  }
}
