import 'package:shared_preferences/shared_preferences.dart';

Future<void> addWorkoutData(String workoutName, int perSet,int numOfSets) async {
  String newData = "$workoutName,$perSet,$numOfSets";
  if (workoutName != '') {
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
      prefs.setStringList(
          'Workout Card Data Cache', pulledWorkoutCardDataCache);
    }
  }
}

Future<void> removeWorkoutData(String workoutName) async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? pulledWorkoutCardDataCache = prefs.getStringList(
      'Workout Card Data Cache');

  if (pulledWorkoutCardDataCache != null) {
    for (var workoutData in pulledWorkoutCardDataCache) {
      List<String> x = workoutData.split(',');
      if (x[0] == workoutName) {
        pulledWorkoutCardDataCache.remove(workoutData);
        prefs.setStringList(
            'Workout Card Data Cache', pulledWorkoutCardDataCache);
        break;
      }
    }
  } else {
    prefs.setStringList('Workout Card Data Cache', []);
  }
}

Future<List<Map>> getWorkoutCardDataList() async {
  final prefs = await SharedPreferences.getInstance();

  List<String>? pulledWorkoutCardDataCache = prefs.getStringList(
      'Workout Card Data Cache');

  if (pulledWorkoutCardDataCache == null) {
    prefs.setStringList('Workout Card Data Cache', []);
    return [];
  } else {
    List<Map> returnMapList = [];
    for (String stringData in pulledWorkoutCardDataCache) {
      List<String> x = stringData.split(',');
      Map returnMap = {
        'workoutName': x[0],
        'perSet': int.parse(x[1]),
        'numOfSets': int.parse(x[2]),
      };
      returnMapList.add(returnMap);
    }
    return returnMapList;
  }
}

Future<void> setPerSetValue(String workoutName, int perSet) async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? pulledWorkoutCardDataCache = prefs.getStringList(
      'Workout Card Data Cache');
  if (pulledWorkoutCardDataCache != null) {
    for (int i = 0; i < pulledWorkoutCardDataCache.length; i++) {
      String workoutData = pulledWorkoutCardDataCache[i];
      List<String> workoutDataSplit = workoutData.split(',');
      if (workoutDataSplit[0] == workoutName) {
        String newData = '${workoutDataSplit[0]},$perSet,${workoutDataSplit[2]}';
        pulledWorkoutCardDataCache[i] = newData;
        prefs.setStringList(
            'Workout Card Data Cache', pulledWorkoutCardDataCache);
      }
    }
  }
}

Future<void> setNumOfSetsValue(String workoutName, int numOfSets) async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? pulledWorkoutCardDataCache = prefs.getStringList(
      'Workout Card Data Cache');

  if (pulledWorkoutCardDataCache != null) {
    for (int i = 0; i < pulledWorkoutCardDataCache.length; i++) {
      String workoutData = pulledWorkoutCardDataCache[i];
      List<String> workoutDataSplit = workoutData.split(',');
      if (workoutDataSplit[0] == workoutName) {
        String newData = '${workoutDataSplit[0]},${workoutDataSplit[1]},$numOfSets';
        pulledWorkoutCardDataCache[i] = newData;
        prefs.setStringList(
            'Workout Card Data Cache', pulledWorkoutCardDataCache);
      }
    }
  }
}