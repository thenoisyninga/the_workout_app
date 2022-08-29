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
  LineChartWidget({Key? key, required this.workoutName, required this.presentationMode})
      : super(key: key);
  final String workoutName;
  final String presentationMode;
  var workoutDayData;
  int limit = 7;
  String xAxisTitle = 'Last 7 days';

  @override
  Widget build(BuildContext context) {
    if (presentationMode == 'weekly') {
      limit = 7;
      xAxisTitle = 'Last 7 days';
    } else if (presentationMode == 'monthly') {
      limit = 30;
      xAxisTitle = 'Last 30 days';
    } else if (presentationMode == 'yearly') {
      limit = 365;
      xAxisTitle = 'Past Year';
    } else {
      limit = 7;
      xAxisTitle = 'Last 7 days';
    }
    return FutureBuilder(
        future: getWorkoutDataListFromDatabase(workoutName, limit),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LineChart(
              LineChartData(
                  backgroundColor: Colors.white,
                  maxX: limit.toDouble(),
                  minX: 1,
                  maxY: getMaxYValue(pointsListFromWorkoutData(
                      snapshot.data! as List<DayWorkoutData>, limit)),
                  minY: getMinYValue(pointsListFromWorkoutData(
                      snapshot.data! as List<DayWorkoutData>, limit)),
                  baselineX: 0,
                  baselineY: getMinYValue(pointsListFromWorkoutData(
                      snapshot.data! as List<DayWorkoutData>, limit)),
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                        axisNameWidget: Text(
                          'Per Set',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        axisNameSize: 30),
                    bottomTitles: AxisTitles(
                      axisNameWidget: Text(
                        'Last 7 days',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      axisNameSize: 40,
                    ),
                    topTitles: AxisTitles(
                      axisNameSize: 100,
                      axisNameWidget: Text(
                        workoutName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 37),
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      top: BorderSide.none,
                      left: BorderSide(),
                      right: BorderSide.none,
                      bottom: BorderSide(),
                    )
                  ),
                  lineBarsData: [
                    LineChartBarData(
                        spots: pointsListFromWorkoutData(
                            snapshot.data! as List<DayWorkoutData>, limit),
                        barWidth: 5,
                        dotData: FlDotData(show: false),
                        color: Colors.black,
                        isCurved: false,
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.black87,
                        ))
                  ]),
            );
          } else {
            return Center(
              child: Container(
                  height: 20, width: 20, child: CircularProgressIndicator()),
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
  return (max);
}

double getMinYValue(List<FlSpot> FlSpotsList) {
  var min = 100000000000000000.0;
  for (var spot in FlSpotsList) {
    if (spot.y < min) {
      min = spot.y;
    }
  }
  return (min - 2);
}
