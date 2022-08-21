import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:the_workout_app/data_management/workout_card_data_management.dart';

void createWorkoutTableIfNotExists(String workoutName) async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'workouts_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE IF NOT EXISTS $workoutName(dateId INTEGER PRIMARY KEY, perSet INTEGER, numOfSet INTEGER)',
      );
    },
    version: 1,
  );
}

class DayWorkoutData {
  final int dateId;
  final int perSet;
  final int numOfSet;

  DayWorkoutData({
    required this.dateId,
    required this.perSet,
    required this.numOfSet,
  });

  Map<String, dynamic> toMap() {
    return {
      'dateId': dateId,
      'perSet': perSet,
      'numOfSet': numOfSet,
    };
  }

  @override
  String toString() {
    return 'DayWorkoutData{dateId: $dateId, perSet: $perSet, numOfSet: $numOfSet}';
  }
}

void createWorkoutTable(String workoutName) async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'workouts_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE $workoutName(dateId INTEGER PRIMARY KEY, perSet INTEGER, numOfSet INTEGER)',
      );
    },
    version: 1,
  );
}

Future<void> insertDayWorkoutData(String workoutName, DayWorkoutData dayWorkoutData) async {
  createWorkoutTableIfNotExists(workoutName);

  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'workouts_database.db'),
  );

  final db = await database;

  await db.insert(
    workoutName,
    dayWorkoutData.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

int generateDateID(DateTime now) {
  String dateToday = now.toString().substring(0, 10).replaceAll('-', '');
  return int.parse(dateToday);
}

Future<void> addStoredWorkoutDataToDatabase() async {
  List<Map> persistedDataList = await getWorkoutCardDataList();
  int dateId = generateDateID(DateTime.now());
  for (Map workoutData in persistedDataList) {
    var workoutName = workoutData['workoutName'].toString().replaceAll('-', '');
    print(workoutName);
    insertDayWorkoutData(
        workoutName,
        DayWorkoutData(
            dateId: dateId,
            perSet: workoutData['perSet'],
            numOfSet: workoutData['numOfSets']));
  }
  print('Data Logged Successfully');
}

Future<List<DayWorkoutData>> getWorkoutDataListFromDatabase(String workoutName, int limit) async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'workouts_database.db'),
  );

  final db = await database;

  // Query the table for all The Dogs.

  final List<Map<String, dynamic>> maps = await db.query('$workoutName', orderBy: 'dateId', limit: limit);

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return DayWorkoutData(
      dateId: maps[i]['dateId'],
      perSet: maps[i]['perSet'],
      numOfSet: maps[i]['numOfSet'],
    );
  });
}