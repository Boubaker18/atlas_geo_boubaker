import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'welcome_page.dart';
import 'about_page.dart';
import 'country_detail_page.dart';
import '../models/country.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  // Liste des pays avec leurs informations
  static final List<Country> countries = Country.allCountries;

  // Fonction pour obtenir le chemin de l'image du drapeau
  String? _getFlagImagePath(String countryName) {
    switch (countryName) {
      case 'France':
        return 'assets/images/france-flag-large.png';
      case 'Tunisie':
        return 'assets/images/Tunisia_Big.png';
      case 'Brésil':
        return 'assets/images/brazil-flag-medium.png';
      case 'Italie':
        return 'assets/images/italy.png';
      case 'Canada':
        return 'assets/images/canada.png';
      case 'Australie':
        return 'assets/images/australia.png';
      case 'Allemagne':
        return 'assets/images/germany.png';
      case 'Afrique du Sud':
        return 'assets/images/south_africa.png';
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liste des Pays',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 95, 30),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 2,
      ),
      drawer: _buildDrawer(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey.shade100,
              Colors.grey.shade200,
            ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          itemCount: countries.length,
          itemBuilder: (context, index) {
            final country = countries[index];
            return _buildCountryCard(context, country);
          },
        ),
      ),
    );
  }

  // Construction du Drawer (menu latéral)
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1E3A5F),
              Color(0xFF2C5F8D),
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // En-tête du Drawer
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                    child: const Icon(
                      Icons.public,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Atlas Géographique',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Option "Accueil"
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text(
                'Accueil',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                );
              },
            ),

            const Divider(color: Colors.white24, height: 1),

            // Option "À propos"
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.white),
              title: const Text(
                'À propos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),

            const Divider(color: Colors.white24, height: 1),

            // Option "Quitter"
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.white),
              title: const Text(
                'Quitter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                _showExitDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Construction d'une carte de pays
  Widget _buildCountryCard(BuildContext context, Country country) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: _getFlagImagePath(country.nom) != null
                ? Image.asset(
                    _getFlagImagePath(country.nom)!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: Text(
                      country.flag,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
          ),
        ),
        title: Text(
          country.nom,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E3A5F),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFF1E3A5F),
          size: 18,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CountryDetailPage(country: country),
            ),
          );
        },
      ),
    );
  }

  // Dialogue de confirmation de sortie
  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quitter l\'application'),
          content: const Text('Voulez-vous vraiment quitter l\'application ?'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Annuler',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text(
                'Quitter',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
