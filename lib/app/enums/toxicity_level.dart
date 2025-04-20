enum ToxicityLevel {
  nonToxic(title: 'Non-Toxic'),
  toxic(title: 'Toxic');

  const ToxicityLevel({required this.title});

  final String title;
}
