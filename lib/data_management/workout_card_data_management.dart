List<Map> workoutCardDataList = [];

void addWorkoutData(String workoutName, int perSet, int numOfSets) {
  Map dataMap = {workoutName: workoutName, perSet: perSet, numOfSets: numOfSets};
  workoutCardDataList.add(dataMap);
}

void removeWorkoutData(String workoutName,) {
  for (var workoutData in workoutCardDataList) {
    if (workoutData[workoutName] == workoutName) {
      workoutCardDataList.remove(workoutData);
      break;
    }
  }
}

List<Map> getWorkoutCardDataList() {
  return workoutCardDataList;
}