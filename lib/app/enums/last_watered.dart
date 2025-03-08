enum LastWatered {
  today('Today'),
  yesterday('Yesterday'),
  threeFourDaysAgo('3-4 days ago'),
  aboutOneWeekAgo('About 1 week ago'),
  twoWeeksOrMoreAgo('2 weeks or more ago');

  const LastWatered(this.label);

  final String label;
}
