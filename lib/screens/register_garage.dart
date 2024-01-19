import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_car.dart';
// import 'package:google_fonts/google_fonts.dart';

class GarageRegister extends StatefulWidget {
  const GarageRegister({super.key});

  @override
  State<GarageRegister> createState() => _GarageRegisterState();
}

class _GarageRegisterState extends State<GarageRegister> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _responsibleController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _faxController = TextEditingController();

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
              style: GoogleFonts.boogaloo(fontSize: 30),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              style: const TextStyle(fontSize: 17),
              controller: _firstnameController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Nom',
                  style: GoogleFonts.openSans(fontSize: 17),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(fontSize: 17),
              controller: _addressController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Address',
                  style: GoogleFonts.openSans(fontSize: 17),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(fontSize: 17),
              controller: _locationController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Localisation',
                  style: GoogleFonts.openSans(fontSize: 17),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(fontSize: 17),
              controller: _responsibleController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Nom du Responsable',
                  style: GoogleFonts.openSans(fontSize: 17),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(fontSize: 17),
              controller: _phoneController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Téléphone Celulaire',
                  style: GoogleFonts.openSans(fontSize: 17),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(fontSize: 17),
              controller: _faxController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Téléphone Fax',
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
    if (_firstnameController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _locationController.text.isEmpty ||
        _responsibleController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _faxController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Veuillez remplir tous les champs obligatoires'),
        ),
      );
    } else {
      // Si tous les champs sont remplis
      _saveUserData();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const CarRegister()),
      );
    }
  }

  void _saveUserData() async {}
}
