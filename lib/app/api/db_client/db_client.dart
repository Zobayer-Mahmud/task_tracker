import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_tracker/app/api/data/response/model/task/task_model.dart';
import 'package:task_tracker/app/common/app_constants.dart';

class DBClient extends GetxService {
  late final Database db;
  final DBClient dbClient = DBClient();

  Future<DBClient> init() async {
    await dbClient.setupDB();
    return dbClient;
  }

  Future<void> setupDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task_tracker.db');
    db = await openDatabase(path, version: 2,
        onCreate: (Database newDb, int version) async {
      //create task table
      await newDb.execute('''
          CREATE TABLE ${AppConstants.task}
          (
            _id TEXT PRIMARY KEY,
            title TEXT,
            owner TEXT,
            description TEXT,
            dueDate TEXT,
            createdAt TEXT,
            deleted TEXT,
            updatedAt TEXT,
            __v TEXT,
            completed INTEGER
          )
        ''');
    });
  }

  Future<int> insertTask(TaskModel taskModel) {
    return db.insert(
      AppConstants.task,
      taskModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteTask(String id) {
    return db.delete(
      AppConstants.task,
      where: '_id = ?',
      whereArgs: [id],
    );
  }

  Future<List<TaskModel>> getAllProducts() async {
    final queryResult = await db.query(
      AppConstants.task,
      orderBy: "dueDate ASC",
    );
    return queryResult.map((e) => TaskModel.fromJson(e)).toList();
  }
}
