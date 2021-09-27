
class Todo{
  final int id;
  final String title;
  final DateTime currentTime=DateTime.now();

  Todo({
    required this.id,
    required this.title
  });
}