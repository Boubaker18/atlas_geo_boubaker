class Country {
  final String nom;
  final String flag;
  final String capitale;
  final String population;
  final String superficie;
  final String langues;

  Country({
    required this.nom,
    required this.flag,
    required this.capitale,
    required this.population,
    required this.superficie,
    required this.langues,
  });

  // Données complètes des pays
  static final List<Country> allCountries = [
    Country(
      nom: 'France',
      flag: '🇫🇷',
      capitale: 'Paris',
      population: '67 millions',
      superficie: '643 801 km²',
      langues: 'Français',
    ),
    Country(
      nom: 'Tunisie',
      flag: '🇹🇳',
      capitale: 'Tunis',
      population: '12 millions',
      superficie: '163 610 km²',
      langues: 'Arabe',
    ),
    Country(
      nom: 'Brésil',
      flag: '🇧🇷',
      capitale: 'Brasília',
      population: '215 millions',
      superficie: '8 515 767 km²',
      langues: 'Portugais',
    ),
    Country(
      nom: 'Italie',
      flag: '🇮🇹',
      capitale: 'Rome',
      population: '59 millions',
      superficie: '301 340 km²',
      langues: 'Italien',
    ),
    Country(
      nom: 'Canada',
      flag: '🇨🇦',
      capitale: 'Ottawa',
      population: '39 millions',
      superficie: '9 984 670 km²',
      langues: 'Anglais',
    ),
    Country(
      nom: 'Australie',
      flag: '🇦🇺',
      capitale: 'Canberra',
      population: '26 millions',
      superficie: '7 692 024 km²',
      langues: 'Anglais',
    ),
    Country(
      nom: 'Allemagne',
      flag: '🇩🇪',
      capitale: 'Berlin',
      population: '84 millions',
      superficie: '357 022 km²',
      langues: 'Allemand',
    ),
    Country(
      nom: 'Espagne',
      flag: '🇪🇸',
      capitale: 'Madrid',
      population: '47 millions',
      superficie: '505 990 km²',
      langues: 'Espagnol',
    ),
    Country(
      nom: 'Afrique du Sud',
      flag: '🇿🇦',
      capitale: 'Pretoria',
      population: '60 millions',
      superficie: '1 219 090 km²',
      langues: 'Afrikaans',
    ),
  ];

  // Trouver un pays par son nom
  static Country? findByName(String nom) {
    try {
      return allCountries.firstWhere((country) => country.nom == nom);
    } catch (e) {
      return null;
    }
  }
}
