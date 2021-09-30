
import 'dart:async';

import 'package:flutter_todo/data/Todo.dart';
import 'package:flutter_todo/framework/TodoDatabase.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TodoDatabaseImpl implements TodoDatabase{
  static final TodoDatabase instance=TodoDatabaseImpl._init();
  static final List<Todo> initialTodo=[
    Todo(id:1,currentTime:DateTime.now(),title:"First Todo",isImportant: true),
    Todo(id:2,currentTime:DateTime.now(),title:"Second Todo",isImportant: false),
    Todo(id:3,currentTime:DateTime.now(),title:"Third Todo",isImportant: true),
    Todo(id:4,currentTime:DateTime.now(),title:"Fourth Todo",isImportant: false),
    Todo(id:5,currentTime:DateTime.now(),title:"Fifth Todo",isImportant: true),
  ];
  static Database? _database;


  //Private Constructor
  TodoDatabaseImpl._init();

  Future <Database> get database async{
    if(_database!=null) return _database!;

    _database=await _initDb("todo_database.db");
    return _database!;
  }
  Future <Database> _initDb(String file) async{
    final dbPath= await getDatabasesPath();
    final path=join(dbPath,file);
    return await openDatabase(path, version: 1, onCreate: onCreateDatabase );
  }

  @override
  void addItem(Todo todo) async{
    final db =await (instance as TodoDatabaseImpl).database;
    final id = await db.insert(todoTable, todo.toJson());

  }

  @override
  void addItems(List<Todo> list) {
    // TODO: implement addItems
  }

  @override
  Future<List<Todo>>? getAllItems() {
    // TODO: implement getAllItems
    return null;
  }

  @override
  void removeItem(int id) {
    // TODO: implement removeItem
  }


  FutureOr<void> onCreateDatabase(Database db, int version) async {
      final idType ="INTEGER PRIMARY KEY AUTOINCREMENT";
      final textType ="TEXT NOT NULL";
      final boolType= "BOOLEAN NOT NULL";
      final integerType="INTEGER NOT NULL";
      await db.execute("""
          CREATE TABLE $todoTable(
            ${TodoFields.id} $idType,
            ${TodoFields.isImportant} $boolType,
            ${TodoFields.title} $textType,
            ${TodoFields.currentTime} $textType
          )
      """);


  }

}