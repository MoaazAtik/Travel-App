/* If I was fetching data from an external API
 * this Entity (fields,...) should be matching it. */
class Trip {
  final String title;
  final List<String> photos;
  final String description;
  final DateTime date;
  final String location;

  Trip({
    required this.title,
    required this.photos,
    required this.description,
    required this.date,
    required this.location,
  });
}
