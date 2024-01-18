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
  final TextEditingController _immatriculationController =
      TextEditingController();
  final TextEditingController _modeleController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _couleurController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _pneuController = TextEditingController();
  final TextEditingController _proprioController = TextEditingController();
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Text(
              'Votre Garage Principal',
              style: GoogleFonts.boogaloo(fontSize: 30),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              style: const TextStyle(fontSize: 8),
              controller: _immatriculationController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Immatriculation',
                  style: GoogleFonts.openSans(fontSize: 17),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(fontSize: 8),
              controller: _modeleController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Modèle',
                  style: GoogleFonts.openSans(fontSize: 17),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(fontSize: 8),
              controller: _typeController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Type',
                  style: GoogleFonts.openSans(fontSize: 17),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(fontSize: 8),
              controller: _numeroController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Numéro de Châssis',
                  style: GoogleFonts.openSans(fontSize: 17),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(fontSize: 8),
              controller: _couleurController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Couleur(s)',
                  style: GoogleFonts.openSans(fontSize: 17),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(fontSize: 8),
              controller: _dateController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Date de mise en circulation',
                  style: GoogleFonts.openSans(fontSize: 17),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(fontSize: 8),
              controller: _pneuController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Type de Pneu (Taille)',
                  style: GoogleFonts.openSans(fontSize: 17),
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
                  requestFocusOnTap: true,
                  label: const Text(
                    'Type de Caburant',
                    style: TextStyle(fontFamily: 'OpenSans', fontSize: 17),
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
              style: const TextStyle(fontSize: 8),
              controller: _proprioController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Propiétaire Précedent',
                  style: GoogleFonts.openSans(fontSize: 17),
                ),
                filled: true,
              ),
            ),
            const SizedBox(height: 70.0),
            ElevatedButton.icon(
              onPressed: _validateFields,
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

  // valider les informations
  void _validateFields() {
    if (_immatriculationController.text.isEmpty ||
        _modeleController.text.isEmpty ||
        _typeController.text.isEmpty ||
        _numeroController.text.isEmpty ||
        _couleurController.text.isEmpty ||
        _proprioController.text.isEmpty ||
        _pneuController.text.isEmpty ||
        _dateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez remplir tous les champs obligatoires'),
        ),
      );
    } else {
      // Si tous les champs sont remplis
      _saveCarData();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const HomeScreen()),
      );
    }
  }

  void _saveCarData() async {
    // Créez une instance de la classe CarDatabase
    // final carDatabase = CarDatabase();

    // await carDatabase.saveCarData(
    //   immatriculation: _immatriculationController.text,
    //   modele: _modeleController.text,
    //   type: _typeController.text,
    //   numero: _numeroController.text,
    //   couleur: _couleurController.text,
    //   date: _dateController.text,
    //   pneu: _pneuController.text,
    //   proprio: _proprioController.text,
    // );
  }
}
