import '../data_management/database_operations.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

List<DateTime> getPastDates(int numOfDays) {
  List<DateTime> returnList = [];
  DateTime date = DateTime.now();
  for (var i = 0; i < numOfDays; i++) {
    returnList.add(date);
    date = date.subtract(Duration(days: 1));
  };
  return returnList;
}

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        backgroundColor: Colors.white,
        maxX: 7,
        minX: 0,
        maxY: 25,
        minY: 0,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 10),
              FlSpot(1, 8),
              FlSpot(2, 18),
              FlSpot(3, 15),
              FlSpot(4, 20),
              FlSpot(5, 16),
              FlSpot(6, 23),
            ],
            barWidth: 5,
          )
        ]
      ),
    );
  }
}

List<FlSpot> pointsListFromWorkoutData(List<DayWorkoutData> dayWorkoutDataList, int limit) {
  List<DateTime> datesList = getPastDates(limit);
  List<int> dateIdList = [];

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
        returnList[index] = FlSpot(index.toDouble(), dayWorkoutData.perSet.toDouble());
      } else {
        returnList[index] = FlSpot(index.toDouble(), 0);
      }

    }

    return returnList;
  }

  return returnList;
}

int getMaxYValue(List<DayWorkoutData> dayWorkoutDataList) {
  int max = 0;
  for (DayWorkoutData dayWorkoutData in dayWorkoutDataList) {
    if (dayWorkoutData.perSet > max) {
      max = dayWorkoutData.perSet;
    }
  }
  return (max + 5);
}

int getMinYValue(List<DayWorkoutData> dayWorkoutDataList) {
  var min = 100000000000000000;
  for (DayWorkoutData dayWorkoutData in dayWorkoutDataList) {
    if (dayWorkoutData.perSet < min) {
      min = dayWorkoutData.perSet;
    }
  }
  return (min - 5);
}

