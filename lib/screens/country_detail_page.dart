import 'package:flutter/material.dart';
import '../models/country.dart';

class CountryDetailPage extends StatelessWidget {
  final Country country;

  const CountryDetailPage({
    super.key,
    required this.country,
  });

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
        title: Text(
          country.nom,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1E3A5F),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 2,
      ),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Drapeau en grand format
              Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: _getFlagImagePath(country.nom) != null
                      ? Image.asset(
                          _getFlagImagePath(country.nom)!,
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.contain,
                        )
                      : Text(
                          country.flag,
                          style: const TextStyle(fontSize: 150),
                        ),
                ),
              ),

              const SizedBox(height: 20),

              // Carte des informations
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // Nom du pays
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.public,
                              size: 40,
                              color: Color(0xFF1E3A5F),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              country.nom,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E3A5F),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Capitale
                    _buildInfoCard(
                      icon: Icons.location_city,
                      title: 'Capitale',
                      value: country.capitale,
                    ),

                    const SizedBox(height: 12),

                    // Population
                    _buildInfoCard(
                      icon: Icons.people,
                      title: 'Population',
                      value: country.population,
                    ),

                    const SizedBox(height: 12),

                    // Superficie
                    _buildInfoCard(
                      icon: Icons.map,
                      title: 'Superficie',
                      value: country.superficie,
                    ),

                    const SizedBox(height: 12),

                    // Langue officielle
                    _buildInfoCard(
                      icon: Icons.language,
                      title: 'Langue(s) officielle(s)',
                      value: country.langues,
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget pour afficher une carte d'information
  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Icône
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF1E3A5F).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF1E3A5F),
                size: 28,
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Texte
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF1E3A5F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
