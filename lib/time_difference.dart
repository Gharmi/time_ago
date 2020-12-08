import 'package:intl/intl.dart';

String timeAgo(String datetime) {
  DateTime d1 = DateTime.now();
  DateTime d2 = DateTime.parse(datetime);

  //Difference between now and given time in minutes
  var minutes = int.parse((d1.difference(d2)).inMinutes.toString());

  switch (minutes) {
    case 0:
      return "Just Now";
      break;

    case 1:
      return "1 min ago";
      break;

    case 2:
      return "2 mins ago";
      break;

    //If it is more than two minutes return no. of hours.
    default:
      return hourFormatter(datetime);
      break;
  }
}

String hourCalculate(String datetime) {
  DateTime d1 = DateTime.now();
  DateTime d2 = DateTime.parse(datetime);

  var diff = d1.difference(d2); //d2-d1
  return ((diff.inHours).toString());
}

String hourFormatter(String datetime) {
  //Converted time difference in hour
  var hours = int.parse(hourCalculate(datetime));

  switch (hours) {
    case 0:
      return "Few minutes earlier";
      break;

    case 1:
      return "1 hour ago";
      break;

    case 2:
      return "2 hours ago";
      break;

    //Converted into days for more than 2 hours
    default:
      return dayFormatter(datetime);
      break;
  }
}

String dayCalculate(String datetime) {
  DateTime d1 = DateTime.now();
  DateTime d2 = DateTime.parse(datetime);

  var diff = d1.difference(d2); //d2-d1
  return ((diff.inDays).toString());
}

String dayFormatter(String datetime) {
  var days = int.parse(dayCalculate(datetime));

  switch (days) {
    case 0:
      return "Today";
      break;

    case 1:
      return "Yesterday";
      break;

    case 2:
      return "2 days ago";
      break;

    // Return the given time if the difference is more than 2 days.
    default:
      return getDateOnly(datetime);
      break;
  }
}

String getDateOnly(String date) {
  DateTime d1 = DateTime.parse(date);
  return DateFormat.yMMMd().format(d1);
}
