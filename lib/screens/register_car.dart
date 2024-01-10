import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
// import 'package:google_fonts/google_fonts.dart';

class CarRegister extends StatefulWidget {
  const CarRegister({super.key});

  // final String token;
  // const CarRegister({super.key, required this.token});

  @override
  State<CarRegister> createState() => _CarRegisterState();
}

class _CarRegisterState extends State<CarRegister> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _secondnameController = TextEditingController();
  final TextEditingController _compagnieController = TextEditingController();
  // String? _selectedNomCoffret;
  final List<String> caburantOption = [
    'Petrol',
    'Gazoil',
    'SuperGazoil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Text(
              'Votre Garage Principal',
              style: GoogleFonts.boogaloo(fontSize: 40),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: _firstnameController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Immatriculation',
                  style: GoogleFonts.openSans(fontSize: 20),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _secondnameController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Modèle',
                  style: GoogleFonts.openSans(fontSize: 20),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _compagnieController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Type',
                  style: GoogleFonts.openSans(fontSize: 20),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _compagnieController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Numéro de Châssis',
                  style: GoogleFonts.openSans(fontSize: 20),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _compagnieController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Couleur(s)',
                  style: GoogleFonts.openSans(fontSize: 20),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _compagnieController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Date de mise en circulation',
                  style: GoogleFonts.openSans(fontSize: 20),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _compagnieController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Type de Pneu (Taille)',
                  style: GoogleFonts.openSans(fontSize: 20),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.,
              children: [
                const Icon(Icons.edit_note),
                const SizedBox(
                  width: 15,
                ),
                DropdownMenu<List>(
                  // width:360,
                  requestFocusOnTap: true,
                  label: const Text(
                    'Type de Caburant',
                    style: TextStyle(fontFamily: 'OpenSans', fontSize: 20),
                  ),
                  dropdownMenuEntries: caburantOption.map((String value) {
                    return DropdownMenuEntry(
                      value: caburantOption,
                      label: value,
                      style: MenuItemButton.styleFrom(
                        // padding: const EdgeInsets.all(1.0),
                        fixedSize: const Size(250, 50),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _compagnieController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Propiétaire Précedent',
                  style: GoogleFonts.openSans(fontSize: 20),
                ),
                filled: true,
              ),
            ),
            const SizedBox(height: 70.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const HomeScreen()));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(270, 50),
                backgroundColor: const Color.fromARGB(255, 26, 56, 205),
              ),
              icon: const Icon(Icons.skip_next, color: Colors.white),
              label: Text(
                "Suivant",
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
