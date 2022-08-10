import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


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

Future<void> insertDayWorkoutData(String workoutName, DayWorkoutData dayWorkoutData) async {
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
