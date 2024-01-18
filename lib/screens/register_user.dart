import 'package:articars/repository/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_garage.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _secondnameController = TextEditingController();
  final TextEditingController _compagnieController = TextEditingController();

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
              'Identifiez-vous',
              style: GoogleFonts.boogaloo(fontSize: 40),
            ),
            const SizedBox(
              height: 100,
            ),
            TextField(
              controller: _firstnameController,
              decoration: InputDecoration(
                // border: const OutlineInputBorder(),
                icon: const Icon(Icons.person),
                label: Text(
                  'Votre nom',
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
                icon: const Icon(Icons.perm_identity),
                label: Text(
                  'Votre Prenom',
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
                icon: const Icon(Icons.work),
                label: Text(
                  'Nom de Votre Compagnie',
                  style: GoogleFonts.openSans(fontSize: 20),
                ),
                filled: true,
              ),
            ),
            const SizedBox(height: 160.0),
            ElevatedButton.icon(
              onPressed: _validateFields,
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(270, 50),
                backgroundColor: const Color.fromARGB(255, 26, 56, 205),
              ),
              icon: const Icon(
                Icons.skip_next,
                color: Colors.white,
              ),
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

  void _validateFields() {
    if (_firstnameController.text.isEmpty ||
        _secondnameController.text.isEmpty ||
        _compagnieController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez remplir tous les champs obligatoires'),
        ),
      );
    } else {
      // Si tous les champs sont remplis
      _addItem();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const GarageRegister()),
      );
    }
  }

  Future<void> _addItem() async {
    await SQLHelper.createUser(
        _firstnameController.text,
        _secondnameController.text,
        _compagnieController.text,
        null,
        null,
        null,
        null,
        null);
  }
}
