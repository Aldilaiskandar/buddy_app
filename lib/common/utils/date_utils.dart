
String currentDateToString() {
  final now = new DateTime.now();
  final String day = now.day.toString();
  final String month =  now.month.toString();
  final String year = now.year.toString();
  final String hour = now.hour.toString();
  final String minute = now.minute<10?'0'+now.minute.toString():now.minute.toString();
  final String second = now.second<10?'0'+now.second.toString():now.second.toString();
  return '$day/$month/$year $hour:$minute:$second';
}
