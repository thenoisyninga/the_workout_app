import '../data_management/database_operations.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

List<DateTime> getPastDates(int numOfDays) {
  List<DateTime> returnList = [];
  DateTime date = DateTime.now();
  for (var i = 0; i < numOfDays; i++) {
    returnList.add(date);
    date = date.subtract(Duration(days: 1));
  }
  ;
  return returnList;
}

class LineChartWidget extends StatelessWidget {
  LineChartWidget({Key? key, required this.workoutName, required this.limit})
      : super(key: key);
  final String workoutName;
  final int limit;
  var workoutDayData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getWorkoutDataListFromDatabase(workoutName, limit),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LineChart(
              LineChartData(
                  backgroundColor: Colors.white,
                  maxX: limit.toDouble(),
                  minX: 1,
                  maxY: getMaxYValue(pointsListFromWorkoutData(snapshot.data! as List<DayWorkoutData>, limit)),
                  minY: getMinYValue(pointsListFromWorkoutData(snapshot.data! as List<DayWorkoutData>, limit)),
                  lineBarsData: [
                    LineChartBarData(
                      spots: pointsListFromWorkoutData(snapshot.data! as List<DayWorkoutData>, limit),
                      barWidth: 5,
                    )
                  ]),
            );
          } else {
            return Center(
              child: Container(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator()
              ),
            );
          }
        });
  }
}

List<FlSpot> pointsListFromWorkoutData(
    List<DayWorkoutData> dayWorkoutDataList, int limit) {
  List<DateTime> datesList = getPastDates(limit);
  List<int> dateIdList = [];

  print('pointsListFromWorkoutData called.');

  for (var date in datesList) {
    dateIdList.add(generateDateID(date));
  }

  List<FlSpot> returnList = [];
  for (var dateId in dateIdList) {
    returnList.add(FlSpot(dateId.toDouble(), 0));
  }

  for (var index = 0; index < returnList.length; index++) {
    for (DayWorkoutData dayWorkoutData in dayWorkoutDataList) {
      if (returnList[index].x == dayWorkoutData.dateId) {
        returnList[index] =
            FlSpot(limit - index.toDouble(), dayWorkoutData.perSet.toDouble());
      } else {
        returnList[index] = FlSpot(limit - index.toDouble(), 0);
      }
    }
  }

  return returnList;
}

double getMaxYValue(List<FlSpot> FlSpotsList) {
  var max = 0.0;
  for (var spot in FlSpotsList) {
    if (spot.y > max) {
      max = spot.y;
    }
  }
  return (max + 2);
}


double getMinYValue(List<FlSpot> FlSpotsList) {
  var min = 100000000000000000.0;
  for (var spot in FlSpotsList) {
    if (spot.y < min) {
      min = spot.y;
    }
  }
  if (min <= 2){
    return min;
  } else {
    return (min - 2);
  }
}
