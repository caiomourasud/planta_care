enum ExperienceLevel {
  hopeless(
    title: 'Hopeless',
    description: "The only plants that's stil "
        'alive are the ones that never lived.',
  ),
  beginner(
    title: 'Beginner',
    description: 'Beginner Every now and then I '
        'manage to keep a coctus alive',
  ),
  experienced(
    title: 'Experienced',
    description: 'What I dont know about plants '
        'is not worth knowing',
  );

  const ExperienceLevel({required this.title, required this.description});

  final String title;
  final String description;
}
