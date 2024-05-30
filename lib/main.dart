import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('API Example')),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String title = '';
  String body = '';
  int userId = 0;

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        setState(() {
          title = responseData['title'];
          body = responseData['body'];
          userId = responseData['userId'];
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        title = 'Error';
        body = '';
        userId = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: fetchData,
          child: const Text('Fetch Data'),
        ),
        const SizedBox(height: 20),
        Text('Title:        $title'),
        const SizedBox(height: 10),
        Text('Body:         $body'),
        const SizedBox(height: 10),
        Text('User ID:      $userId'),
      ],
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('API Example')),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String num_matricule = '';
  int kilomitrage = 0;
  int annee = 0;
  String couleur = '';
  int prix = 0;
  String etat = '';
  String marque = '';

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.21:8000/api/cars'));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body)[5]; 
        setState(() {
          kilomitrage = responseData['kilomitrage'];
          num_matricule = responseData['num_matricule'];
          annee = responseData['annee'];
          couleur = responseData['couleur'];
          prix = responseData['prix'];
          etat = responseData['etat'];
          marque = responseData['marque'];
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        num_matricule = '000';
        kilomitrage = 0;
        annee = 0;
        couleur = '';
        prix = 0;
        etat = '';
        marque = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: fetchData,
          child: const Text('Fetch Data'),
        ),
        const SizedBox(height: 20),
        Text("num_matricule   $num_matricule"),
        Text('Kilomitrage:  $kilomitrage'),
        Text('Année:        $annee'),
        Text('Couleur:      $couleur'),
        Text('Prix:         $prix'),
        Text('État:         $etat'),
        Text('Marque:       $marque'),
      ],
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('API Example')),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Map<String, dynamic>> carsData = [];
  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.137.1:8000/api/cars'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);

        setState(() {
          carsData = List<Map<String, dynamic>>.from(responseData);
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        carsData = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: fetchData,
          child: const Text('Fetch Data'),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(carsData.length, (index) {
                final data = carsData[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Numéro de matricule: ${data['num_matricule']}"),
                    Text('Kilométrage: ${data['kilomitrage']}'),
                    Text('Année: ${data['annee']}'),
                    Text('Couleur: ${data['couleur']}'),
                    Text('Prix: ${data['prix']}'),
                    Text('État: ${data['etat']}'),
                    // if (data['image'] != null)
                    //   Image.network(
                    //     data['image'],
                    //     width: 100,
                    //     height: 100,
                    //     fit: BoxFit.cover,
                    //   ),
                    Text('Marque: ${data['marque']}'),
                    Text('Modele Id : ${data['model_id']}'),
                    Text('Created : ${data['created_at']}'),
                    Text('Update : ${data['created_at']}'),
                    const Divider(),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}*/

/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(VoitureListWidget());
}

class Voiture {
  static int idauto = 0;
  Voiture({
    required this.id,
    required this.num_matricule,
    required this.kilomitrage,
    required this.annee,
    required this.couleur,
    required this.prix,
    required this.etat,
    required this.marque,
    required this.model_id,
    this.created_at,
    this.updated_at,
  });

  int? id;
  String num_matricule;
  int kilomitrage;
  int annee;
  String couleur;
  String prix;
  String etat;
  String marque;
  int model_id;
  DateTime? created_at;
  DateTime? updated_at;

  static Future<List<Voiture>> fetchVoitures() async {
    final response = await http.get(Uri.parse('http://192.168.0.100:8000/api/cars'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      List<Voiture> voitures = [];
      for (var item in jsonData) {
        Voiture voiture = Voiture(
          id: item['id'],
          num_matricule: item['num_matricule'],
          kilomitrage: item['kilomitrage'],
          annee: item['annee'],
          couleur: item['couleur'],
          prix: item['prix'],
          etat: item['etat'],
          marque: item['marque'],
          model_id: item['model_id'],
          created_at: DateTime.parse(item['created_at']),
          updated_at: DateTime.parse(item['updated_at']), 
        );
        voitures.add(voiture);
      }
      return voitures;
    } else {
      throw Exception('Failed to load voitures');
    }
  }
}

class VoitureListWidget extends StatefulWidget {
  @override
  _VoitureListWidgetState createState() => _VoitureListWidgetState();
}

class _VoitureListWidgetState extends State<VoitureListWidget> {
  late Future<List<Voiture>> _futureVoitures;

  @override
  void initState() {
    super.initState();
    _futureVoitures = Voiture.fetchVoitures();
  }

  Future<void> _fetchData() async {
    setState(() {
      _futureVoitures = Voiture.fetchVoitures();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Voitures'),
      ),
      body: FutureBuilder<List<Voiture>>(
        future: _futureVoitures,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Voiture>? voitures = snapshot.data;
            if (voitures != null && voitures.isNotEmpty) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: voitures.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(voitures[index].num_matricule),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Marque: ${voitures[index].marque}'),
                              Text('Kilométrage: ${voitures[index].kilomitrage}'),
                              Text('Année: ${voitures[index].annee}'),
                              Text('Couleur: ${voitures[index].couleur}'),
                              Text('Prix: ${voitures[index].prix}'),
                              Text('État: ${voitures[index].etat}'),
                              Text('Model ID: ${voitures[index].model_id}'),
                              Text('Créé le: ${voitures[index].created_at}'),
                              Text('Mis à jour le: ${voitures[index].updated_at}'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _fetchData,
                    child: Text('Afficher Info'),
                  ),
                ],
              );
            } else {
              return Center(child: Text('No voitures found'));
            }
          }
        },
      ),
    );
  }
}*/
