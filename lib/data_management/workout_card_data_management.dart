import 'package:shared_preferences/shared_preferences.dart';

Future<void> addWorkoutData(
    String workoutName, int perSet, int numOfSets) async {
  String newData = "$workoutName,$perSet,$numOfSets";

  //Pulling cache list
  final prefs = await SharedPreferences.getInstance();
  List<String>? pulledWorkoutCardDataCache =
      prefs.getStringList('Workout Card Data Cache');

  if (pulledWorkoutCardDataCache == null) {
    // If the list, doesn't exist, create a new one.
    prefs.setStringList('Workout Card Data Cache', []);
  } else {
    // Add the data, update it in shared prefs.
    pulledWorkoutCardDataCache.add(newData);
    prefs.setStringList('Workout Card Data Cache', pulledWorkoutCardDataCache);
  }
}

Future<void> removeWorkoutData(String workoutName) async {

  final prefs = await SharedPreferences.getInstance();
  List<String>? pulledWorkoutCardDataCache = prefs.getStringList('Workout Card Data Cache');

  if (pulledWorkoutCardDataCache != null) {
    for (var workoutData in pulledWorkoutCardDataCache) {
      List<String> x = workoutData.split(',');
      if (x[0] == workoutName) {
        pulledWorkoutCardDataCache.remove(workoutData);
        prefs.setStringList('Workout Card Data Cache', pulledWorkoutCardDataCache);
        break;
      }
    }
  } else {
    prefs.setStringList('Workout Card Data Cache', []);
  }
}

Future<List<Map>> getWorkoutCardDataList() async {
  final prefs = await SharedPreferences.getInstance();

  List<String>? pulledWorkoutCardDataCache = prefs.getStringList('Workout Card Data Cache');

  if (pulledWorkoutCardDataCache == null) {
    prefs.setStringList('Workout Card Data Cache', []);
    return [];
  } else {
    List<Map> returnMapList = [];
    for (String stringData in pulledWorkoutCardDataCache) {
      List<String> x = stringData.split(',');
      Map returnMap = {
        'workoutName': x[0],
        'perSet': x[1],
        'numOfSets': x[2],
      };
      returnMapList.add(returnMap);
    }
    return returnMapList;
  }
}
