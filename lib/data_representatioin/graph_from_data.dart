import '../data_management/database_operations.dart';

List<DateTime> getPastDates(int numOfDays) {
  List<DateTime> returnList = [];
  DateTime date = DateTime.now();
  for (var i = 0; i < numOfDays; i++) {
    returnList.add(date);
    date = date.subtract(Duration(days: 1));
  };
  return returnList;
}
