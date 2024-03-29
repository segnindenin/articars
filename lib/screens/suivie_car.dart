import 'dart:io';

import 'package:articars/repository/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class SuivieCar extends StatefulWidget {
  const SuivieCar({super.key});

  @override
  State<SuivieCar> createState() => _SuivieCarState();
}

class _SuivieCarState extends State<SuivieCar> {
  late String token = '';
  var backc = const Color.fromARGB(255, 237, 235, 229);
  var backb = const Color.fromARGB(255, 26, 56, 205);

  List<Map<String, dynamic>> _suivies = [];
  bool _isLoading = true;

  void _refreshSuivie() async {
    final data = await SQLHelper.getSuivies();

    // debugPrint(data as String?);

    setState(() {
      _suivies = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshSuivie();
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    return formattedDate;
  }

  final TextEditingController _typeSuivieController = TextEditingController();
  final TextEditingController _carController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _assuranceController = TextEditingController();
  final TextEditingController _policeController = TextEditingController();

  File? _image;
  late ImagePicker _picker;

  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          _suivies.firstWhere((element) => element['id'] == id);
      _typeSuivieController.text = existingJournal['typeSuivie'];
      _carController.text = existingJournal['car'];
      _dateController.text = existingJournal['date'];
      _assuranceController.text = existingJournal['assurance'];
    }
    _picker = ImagePicker();

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
            TextFormField(
              controller: _typeSuivieController,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _carController,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Véhicule',
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
            ElevatedButton(
              onPressed: () async {
                final pickedFile =
                    await _picker.pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  setState(() {
                    _image = File(pickedFile.path);
                  });
                }
              },
              child: const Text("Sélectionner une image"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  await _addItem();
                }

                if (id != null) {
                  await _updateItem(id);
                }

                _typeSuivieController.text = '';
                _carController.text = '';
                _dateController.text = '';
                _assuranceController.text = '';
                _policeController.text = '';

                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor : Colors.blue,
                minimumSize: Size(100, 50),
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

  Future<void> _addItem() async {
    await SQLHelper.createSuivie(
        _typeSuivieController.text,
        _carController.text,
        _dateController.text,
        _assuranceController.text,
        _policeController.text,
        _image?.path);
    _refreshSuivie();
  }

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateSuivie(
        id,
        _typeSuivieController.text,
        _carController.text,
        _dateController.text,
        _assuranceController.text,
        _policeController.text,
        _image?.path);
    _refreshSuivie();
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteSuivie(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Supprimer avec succès!'),
    ));
    _refreshSuivie();
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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _suivies.isEmpty
              ? const Center(child: Text('Aucune suivies disponibles'))
              : SingleChildScrollView(
                  child: Column(
                    children: _suivies.map((suivie) {
                      return SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 365,
                              height: 200,
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 229, 219, 219),
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
                                        Text(
                                          suivie['typeSuivie'],
                                          style: const TextStyle(
                                              fontSize: 22,
                                              color: Colors.white),
                                        ),
                                        IconButton(
                                          iconSize: 40,
                                          onPressed: () => _confirmDeleteDialog(
                                              suivie['id']),
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 25,
                                    left: 25,
                                    child: CircleAvatar(
                                      backgroundImage: suivie['imagePath'] !=
                                              null
                                          ? FileImage(File(suivie['image']))
                                          : const AssetImage('assets/image.jpg')
                                              as ImageProvider,
                                      radius: 25,
                                    ),
                                  ),
                                  Positioned(
                                    top: 60,
                                    left: 250,
                                    child: Row(
                                      children: [
                                        const Icon(Icons.directions_car),
                                        Text(
                                          suivie['car'],
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 80,
                                    left: 25,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Numéro de la police',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          suivie['police_number'],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 200,
                                            ),
                                            Text(
                                              suivie['assurance'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text('Emission'),
                                                Text(
                                                  formatDate(
                                                      suivie['createdAt']),
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
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
                                              icon: const Icon(
                                                  Icons.calendar_month),
                                              label: Text(suivie['date']),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: backb,
          onPressed: () => _showForm(null),
          label: const Icon(
            Icons.post_add,
            size: 35,
            color: Colors.white,
          )),
    );
  }

  void _confirmDeleteDialog(int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: const Text("Voulez-vous vraiment supprimer cet élément?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Annuler"),
            ),
            TextButton(
              onPressed: () {
                _deleteItem(id);
                Navigator.of(context).pop();
              },
              child: const Text("Supprimer"),
            ),
          ],
        );
      },
    );
  }
}