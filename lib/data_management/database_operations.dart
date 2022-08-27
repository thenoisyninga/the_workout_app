import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:the_workout_app/data_management/workout_card_data_management.dart';


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

Future<void> insertDayWorkoutDataToDatabase(String workoutName, DayWorkoutData dayWorkoutData) async {

  WidgetsFlutterBinding.ensureInitialized();
  // Get a location using getDatabasesPath
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'workout_database.db');

  // Opening the database
  Database workoutDatabase = await openDatabase(path, version: 1);
  await workoutDatabase.insert(workoutName, dayWorkoutData.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  workoutDatabase.close();
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
    addWorkoutTableToDatabase(workoutName);
    insertDayWorkoutDataToDatabase(
        workoutName,
        DayWorkoutData(
            dateId: dateId,
            perSet: workoutData['perSet'],
            numOfSet: workoutData['numOfSets']));
  }
}

Future<List<DayWorkoutData>> getWorkoutDataListFromDatabase(String workoutName, int limit) async {
  WidgetsFlutterBinding.ensureInitialized();
  // Get a location using getDatabasesPath
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'workout_database.db');

  // Opening the database
  Database workoutDatabase = await openDatabase(path, version: 1);


  final List<Map<String, dynamic>> maps = await workoutDatabase.query('$workoutName', orderBy: 'dateId', limit: limit);

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return DayWorkoutData(
      dateId: maps[i]['dateId'],
      perSet: maps[i]['perSet'],
      numOfSet: maps[i]['numOfSet'],
    );
  });
}



Future<void> addWorkoutTableToDatabase(String workoutName) async {

  // Get a location using getDatabasesPath
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'workout_database.db');

  // Opening the database
  Database workoutDatabase = await openDatabase(path, version: 1);
  
  List<String> databaseTablesList = await getDatabaseTablesList();

  if (!databaseTablesList.contains(workoutName)) {
    workoutDatabase.execute('CREATE TABLE ${workoutName}(dateId INTEGER PRIMARY KEY, perSet INTEGER, numOfSet INTEGER);');
    addToDatabaseTablesList(workoutName);
    print('table added');
  } else {
    print('table already exists.');
  }
  workoutDatabase.close();
}

Future<List<String>> getDatabaseTablesList() async {
  final prefs = await SharedPreferences.getInstance();
  var x = prefs.getStringList('workoutTablesInDatabase');
  if (x == null) {
    return [];
  } else {
    return x;
  }
}

Future<void> addToDatabaseTablesList(String workoutName) async {
  List<String> oldList = await getDatabaseTablesList();
  final prefs = await SharedPreferences.getInstance();
  oldList.add(workoutName);
  prefs.setStringList('workoutTablesInDatabase', oldList);
}

Future<void> removeFromDatabaseTablesList(String workoutName) async {
  List<String> oldList = await getDatabaseTablesList();
  final prefs = await SharedPreferences.getInstance();
  oldList.remove(workoutName);
  prefs.setStringList('workoutTablesInDatabase', oldList);
}

Future<void> removeTableFromDatabase(String workoutName) async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'workout_database.db');

  // Opening the database
  Database workoutDatabase = await openDatabase(path, version: 1);
  List<String> oldList = await getDatabaseTablesList();
  if (oldList.contains(workoutName)) {
    workoutDatabase.execute('drop table $workoutName');
    removeFromDatabaseTablesList(workoutName);
    print('table removed');
  } else {
    print('the table does not exist');
  }
}