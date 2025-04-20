enum LightNeeds {
  low(title: 'Low', level: 0.25),
  medium(title: 'Medium', level: 0.5),
  high(title: 'High', level: 1.0);

  const LightNeeds({required this.title, required this.level});

  final String title;
  final double level;
}
