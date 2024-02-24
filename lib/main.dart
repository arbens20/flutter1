import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CV'),
        ),
        body: NameGrid(),
      ),
    );
  }
}

class NameGrid extends StatelessWidget {
  // Liste des noms
  final List<String> names = [
    'Lynne-Flore Simy',
    'Parilus Mathieu',
    'Vital Arbens',
    'Orelien Nageline',
    'MaxWiskennExalent',
    'Saintil Ralph Jacky'
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, // Nombre de colonnes dans la grille
      children: List.generate(6, (index) {
        // Générer une liste de 9 conteneurs avec le nom de chaque personne
        return GridTile(
          child: GestureDetector(
            onTap: () {
              // Navigation vers la page de détails lorsqu'un carré est cliqué
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    name: names[index], // Passer le nom de la personne à la page de détails
                  ),
                ),
              );
            },
           
         child: Padding(
           padding: EdgeInsets.all(15.0),
          child: Container(
            color: Colors.blue, // Couleur de fond du conteneur
            child: Center(
              child: Text(
                names[index], // Afficher le nom de la personne
                style: TextStyle(
                  color: Colors.white, // Couleur du texte
                  fontSize: 20.0, // Taille du texte
                ),
              ),
            ),
          ),
        ),
        ),
        );
      }),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String name;

  DetailPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paj Enfomasyon'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfosBackgroundPage(name: name),
                  ),
                );
                
              },
              child: Text('Personal Information'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AcademicBackgroundPage(name: name),
                  ),
                );
              },
              child: Text('Academic Background'),
            ),
          ],
        ),
      ),
    );
  }
}

class AcademicBackgroundPage extends StatelessWidget {
  final String name;

  AcademicBackgroundPage({required this.name});

  @override
  Widget build(BuildContext context) {
    // Informations académiques pour chaque personne
    Map<String, String> academicInfo = {
      'Lynne-Flore Simy': 'Étude universitaire à l\'École Supérieure d\'Infotronique d\'Haïti (ESIH)',
      'Parilus Mathieu': 'Diplôme en informatique',
      'Vital Arbens': 'Master en génie électrique',
      'Orelien Nageline': 'Licence en économie',
      'MaxWiskennExalent': 'Doctorat en physique',
      'Saintil Ralph Jacky': 'Diplôme en gestion des affaires',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Antécédents académiques de $name'),
      ),
      body: Center(
        child: Text(
          academicInfo[name] ?? 'Aucune information académique disponible',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}





class InfosBackgroundPage extends StatelessWidget {
  final String name;

  InfosBackgroundPage({required this.name});

  @override
  Widget build(BuildContext context) {
    // Informations académiques pour chaque personne
    Map<String, String> academicInfo = {
      'Lynne-Flore Simy': 'Celibataire',
      'Parilus Mathieu': 'Celibataire',
      'Vital Arbens': 'Celibataire',
      'Orelien Nageline': 'Etudiante',
      'MaxWiskennExalent': 'Celibataire',
      'Saintil Ralph Jacky': 'Celibataire',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Infos sur $name'),
      ),
      body: Center(
        child: Text(
          academicInfo[name] ?? 'Aucune information  disponible',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}