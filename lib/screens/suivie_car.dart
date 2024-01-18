import 'package:articars/repository/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  List<Map<String, dynamic>> _suivies = [];
  bool _isLoading = true;

  void _refreshSuivie() async {
    final data = await SQLHelper.getSuivies();

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
                  TextField(
                    controller: _typeSuivieController,
                    decoration: const InputDecoration(hintText: 'Type'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _carController,
                    decoration: const InputDecoration(hintText: 'Véhicule'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _dateController,
                    decoration: const InputDecoration(hintText: 'Date'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _assuranceController,
                    decoration: const InputDecoration(hintText: 'Assurance'),
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

                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Ajouter' : 'Modifier'),
                  )
                ],
              ),
            ));
  }

  Future<void> _addItem() async {
    await SQLHelper.createSuivie(
      _typeSuivieController.text,
      _carController.text,
      _dateController.text,
      _assuranceController.text,
    );
    _refreshSuivie();
  }

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateSuivie(
      id,
      _typeSuivieController.text,
      _carController.text,
      _dateController.text,
      _assuranceController.text,
    );
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
                                    Text(
                                      suivie['typeSuivie'],
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                    IconButton(
                                      iconSize: 40,
                                      onPressed: () =>
                                          _confirmDeleteDialog(suivie['id']),
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
                                  backgroundImage: NetworkImage(
                                      'https://images.caradisiac.com/images/5/7/3/6/205736/S0-quelle-sera-la-voiture-de-l-annee-2024-780687.jpg'),
                                ),
                              ),
                              Positioned(
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
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 80,
                                left: 25,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'numero de la police',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '5e5a23e9-1761-4a17-ad2b-6f57ed79e3c9',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 200,
                                        ),
                                        Text(
                                          suivie['assurance'],
                                          style: TextStyle(
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
                                              formatDate(suivie['createdAt']),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 90,
                                        ),
                                        ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                          ),
                                          onPressed: () {},
                                          icon:
                                              const Icon(Icons.calendar_month),
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
