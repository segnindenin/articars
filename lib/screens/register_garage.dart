import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_car.dart';
// import 'package:google_fonts/google_fonts.dart';

class GarageRegister extends StatefulWidget {
  const GarageRegister({super.key});

  // final String token;
  // const GarageRegister({super.key, required this.token});

  @override
  State<GarageRegister> createState() => _GarageRegisterState();
}

class _GarageRegisterState extends State<GarageRegister> {
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
            const SizedBox(height: 50,),
            Text('Votre Garage Principal', style: GoogleFonts.boogaloo(fontSize: 40),),
            const SizedBox(height: 50,),
            TextField(
              controller: _firstnameController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.edit_note),
                label: Text(
                  'Nom',
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
                  'Address',
                  style:  GoogleFonts.openSans(fontSize: 20),
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
                  'Localisation',
                  style:  GoogleFonts.openSans(fontSize: 20),
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
                  'Nom du Responsable',
                  style:  GoogleFonts.openSans(fontSize: 20),
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
                  'Téléphone Celulaire',
                  style:  GoogleFonts.openSans(fontSize: 20),
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
                  'Téléphone Fax',
                  style:  GoogleFonts.openSans(fontSize: 20),
                ),
                filled: true,
              ),
            ),
            const SizedBox(height: 70.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const CarRegister()));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(270, 50),
                  backgroundColor: const Color.fromARGB(255, 26, 56, 205),
                      ),
              icon: const Icon(Icons.skip_next),
              label: Text("Suivant", style: GoogleFonts.openSans(fontSize:20, fontWeight:FontWeight.bold),), 
            ),
          ],
        ),
      ),
    );
  }
}
