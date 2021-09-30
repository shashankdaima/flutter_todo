final String todoTable = "todo_table";

class TodoFields {
  static final List<String> values = [id, isImportant, currentTime, title];
  static final String id = "_id";
  static final String isImportant = "isImportant";
  static final String currentTime = "currentTime";
  static final String title = "title";
}

class Todo {
  final int? id;
  final bool isImportant;
  final String title;
  final DateTime currentTime ;

  Todo({this.id,required this.currentTime, required this.title, required this.isImportant});

  static Todo fromJson(Map<String, Object?> json) => Todo(
    id: json[TodoFields.id] as int?,
    isImportant: json[TodoFields.isImportant] == 1,
    title: json[TodoFields.title] as String,
    currentTime: DateTime.parse(json[TodoFields.currentTime] as String)
  );
  Map<String, Object?> toJson() =>{
    TodoFields.id:this.id,
    TodoFields.title:this.title,
    TodoFields.isImportant:this.isImportant?1:0,
    TodoFields.currentTime:this.currentTime.toIso8601String(),

  };

}
