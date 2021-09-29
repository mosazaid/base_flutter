import 'package:JordanElectricPowerCompany/utils/translations_delegate_base.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AppDateUtils {

  static DateTime convertFormatToDate(String formatTime, String dateFormat) {
    DateTime parseDate =
    DateFormat(dateFormat).parse(formatTime);

    return DateTime.parse(formatTime);

  }

  static String convertDateToFormat(DateTime dateTime, String dateFormat) {
    return DateFormat(dateFormat).format(dateTime);
  }

  static DateTime convertISOStringToDateTime(String date) {
    DateTime newDate;

    newDate = DateTime.parse(date);

    return newDate;
  }

  static String convertStringToDateFormat(String date, String dateFormat) {
    DateTime dateTime ;
    if(date.contains("/Date"))
      dateTime= getDateTimeFromServerFormat(date);
    else
      dateTime = DateTime.parse(date);
    return convertDateToFormat(dateTime, dateFormat);
  }

  static convertDateFromServerFormat(String str, dateFormat) {
    var date = getDateTimeFromServerFormat(str);

    return DateFormat(dateFormat).format(date);
  }

  static DateTime getDateTimeFromServerFormat(String str) {
    DateTime date = DateTime.now();
    if (str != null) {
      const start = "/Date(";

      const end = "+0300)";
      if (str.contains("/Date")) {
        final startIndex = str.indexOf(start);

        final endIndex = str.indexOf(end, startIndex + start.length);

        date = new DateTime.fromMillisecondsSinceEpoch(int.parse(str.substring(startIndex + start.length, endIndex)));
      } else {
        date = DateTime.now();
      }
    } else {
      date = DateTime.parse(str);
    }

    return date;
  }

  static String differenceBetweenDateAndCurrentInYearMonthDay(DateTime firstDate, BuildContext context) {
    DateTime now = DateTime.now();
    // now = now.add(Duration(days: 400, minutes: 0));
    var difference = firstDate.difference(now);

    int years = now.year - firstDate.year;
    int months = now.month - firstDate.month;
    int days = now.day - firstDate.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months += (days < 0 ? 11 : 12);
    }
    if (days < 0) {
      final monthAgo = new DateTime(now.year, now.month - 1, firstDate.day);
      days = now.difference(monthAgo).inDays + 1;
    }
    return "$days ${TranslationBase.of(context).days}, $months ${TranslationBase.of(context).months}, $years ${TranslationBase.of(context).years}";
  }

  static String differenceBetweenDateAndCurrent(DateTime firstDate, BuildContext context, {bool isShowSecond = false, bool isShowDays = true }) {
    DateTime now = DateTime.now();
    var difference = now.difference(firstDate);

    int minutesInDays = difference.inMinutes;
    int secondInDays = difference.inSeconds;
    int hoursInDays = minutesInDays ~/ 60; // ~/ : truncating division to make the result int
    int second = secondInDays % 60;
    int minutes = minutesInDays % 60;
    int days = hoursInDays ~/ 24;
    int hours = hoursInDays % 24;

    double hoursInOneDay = difference.inHours / difference.inDays;

    return (isShowDays
            ? (days > 0 ? "$days ${TranslationBase.of(context).days}," : '')
            : "") +
        (hours > 0 ? "$hours ${TranslationBase.of(context).hr}," : "") +
        " $minutes ${TranslationBase.of(context).min}" +
        (isShowSecond ? ", $second Sec" : "");
  }

  static String differenceBetweenServerDateAndCurrent(String str, BuildContext context) {
    const start = "/Date(";

    const end = "+0300)";

    final startIndex = str.indexOf(start);

    final endIndex = str.indexOf(end, startIndex + start.length);

    var date = new DateTime.fromMillisecondsSinceEpoch(int.parse(str.substring(startIndex + start.length, endIndex)));
    return differenceBetweenDateAndCurrent(date, context);
  }

  /// get month by
  /// [weekDay] convert week day in int to week day name
  static getWeekDay(int weekDay) {
    switch (weekDay) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday ";
      case 7:
        return "Sunday";
    }
  }

  /// get month by
  /// [weekDay] convert week day in int to week day name arabic
  static getWeekDayArabic(int weekDay) {
    switch (weekDay) {
      case 1:
        return "الاثنين";
      case 2:
        return "الثلاثاء";
      case 3:
        return "الاربعاء";
      case 4:
        return "الخميس";
      case 5:
        return "الجمعه";
      case 6:
        return "السبت ";
      case 7:
        return "الاحد";
    }
  }

  /// get month by
  /// [month] convert month number in to month name
  static getMonth(int month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
    }
  }

  /// get month by
  /// [month] convert month number in to month name in Arabic
  static getMonthArabic(int month) {
    switch (month) {
      case 1:
        return "يناير";
      case 2:
        return " فبراير";
      case 3:
        return "مارس";
      case 4:
        return "أبريل";
      case 5:
        return "مايو";
      case 6:
        return "يونيو";
      case 7:
        return "يوليو";
      case 8:
        return "أغسطس";
      case 9:
        return "سبتمبر";
      case 10:
        return " اكتوبر";
      case 11:
        return " نوفمبر";
      case 12:
        return "ديسمبر";
    }
  }

  static getMonthByName(String month) {
    switch (month.toLowerCase()) {
      case 'january':
        return 1;
      case 'february':
        return 2;
      case 'march':
        return 3;
      case 'april':
        return 4;
      case 'may':
        return 5;
      case 'june':
        return 6;
      case 'july':
        return 7;
      case 'august':
        return 8;
      case 'september':
        return 9;
      case 'october':
        return 10;
      case 'november':
        return 11;
      case 'december':
        return 12;
    }
  }

  static DateTime convertStringToDate(String date) {
    // /Date(1585774800000+0300)/

    if (date != null) {
      const start = "/Date(";
      const end = "+0300)";
      final startIndex = date.indexOf(start);
      final endIndex = date.indexOf(end, startIndex + start.length);
      DateTime newDate = DateTime.fromMillisecondsSinceEpoch(
        int.parse(
          date.substring(startIndex + start.length, endIndex),
        ),
      );
      return newDate;
    } else
      return DateTime.now();
  }

  /// get data formatted like Apr 26,2020
  /// [dateTime] convert DateTime to data formatted Arabic
  static String getMonthDayYearDateFormattedAr(DateTime dateTime) {
    if (dateTime != null)
      return getMonthArabic(dateTime.month) + " " + dateTime.day.toString() + ", " + dateTime.year.toString();
    else
      return "";
  }

  /// get data formatted like Apr 26,2020
  /// [dateTime] convert DateTime to data formatted
  static String getMonthDayYearDateFormatted(DateTime dateTime, {bool isArabic = false}) {
    if (dateTime != null)
      return isArabic
          ? getMonthArabic(dateTime.month)
          : getMonth(dateTime.month) + " " + dateTime.day.toString() + ", " + dateTime.year.toString();
    else
      return "";
  }

  /// get data formatted like 26 Apr 2020
  /// [dateTime] convert DateTime to data formatted
  static String getDayMonthYearDateFormatted(DateTime dateTime, {bool isArabic = false}) {
    if (dateTime != null)
      return dateTime.day.toString() +
          " " +
          "${isArabic ? getMonthArabic(dateTime.month) : getMonth(dateTime.month)}" +
          " " +
          dateTime.year.toString();
    else
      return "";
  }

  /// get data formatted like 26/4/2020
  /// [dateTime] convert DateTime to data formatted
  static String getDayMonthYearDate(DateTime dateTime, {bool isArabic = false}) {
    if (dateTime != null)
      return dateTime.day.toString() + "/" + "${dateTime.month}" + "/" + dateTime.year.toString();
    else
      return "";
  }

  /// get data formatted like 10:45 PM
  /// [dateTime] convert DateTime to data formatted
  static String getHour(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  static String getAgeByBirthday(String birthOfDate, BuildContext context, {bool isServerFormat = true}) {
    // https://leechy.dev/calculate-dates-diff-in-dart
    DateTime birthDate;
    if (birthOfDate.contains("/Date")) {
      birthDate = AppDateUtils.getDateTimeFromServerFormat(birthOfDate);
    } else {
      birthDate = DateTime.parse(birthOfDate);
    }
    final now = DateTime.now();
    int years = now.year - birthDate.year;
    int months = now.month - birthDate.month;
    int days = now.day - birthDate.day;
    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months += (days < 0 ? 11 : 12);
    }
    if (days < 0) {
      final monthAgo = new DateTime(now.year, now.month - 1, birthDate.day);
      days = now.difference(monthAgo).inDays + 1;
    }
    return "$years ${TranslationBase.of(context).years}  $months ${TranslationBase.of(context).months} $days ${TranslationBase.of(context).days}";
  }

  static bool isToday(DateTime dateTime) {
    DateTime todayDate = DateTime.now().toUtc();
    if (dateTime.day == todayDate.day && dateTime.month == todayDate.month && dateTime.year == todayDate.year) {
      return true;
    }
    return false;
  }

  static String getDate(DateTime dateTime) {
    print(dateTime);
    if (dateTime != null)
      return getMonth(dateTime.month) + " " + dateTime.day.toString() + "," + dateTime.year.toString();
    else
      return "";
  }

  static String getDateFormatted(DateTime dateTime) {
    print(dateTime);
    if (dateTime != null)
      return dateTime.day.toString() + "/" + dateTime.month.toString() + "/" + dateTime.year.toString();
    else
      return "";
  }

  static String getTimeHHMMA(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  static String getTimeHHMMA2(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime);
  }

  static String getStartTime(String dateTime) {
    String time = dateTime;

    if (dateTime.length > 7) time = dateTime.substring(0, 5);
    return time;
  }

  static String getTimeFormated(DateTime dateTime) {
    print(dateTime);
    if (dateTime != null)
      return dateTime.hour.toString() + ":" + dateTime.minute.toString();
    else
      return "";
  }


  // handel date like "09/05/2021 17:00"
  static DateTime getDateTimeFromString(String str) {
    List<String>  array = str.split('/');
    int day = int.parse(array[0]);
    int month = int.parse(array[1]);

    List<String>  array2 = array[2].split(' ');
    int year = int.parse(array2[0]);
    String hour = array2[1];
    List<String> hourList = hour.split(":");

    DateTime date =  DateTime(year, month, day, int.parse(hourList[0]), int.parse(hourList[1]));


    return date;
  }


  static convertDateFormatImproved(String str) {
    String newDate;
    const start = "/Date(";
    if (str.isNotEmpty) {
      const end = "+0300)";

      final startIndex = str.indexOf(start);
      final endIndex = str.indexOf(end, startIndex + start.length);

      var date = new DateTime.fromMillisecondsSinceEpoch(
          int.parse(str.substring(startIndex + start.length, endIndex)));
      newDate = date.year.toString() +
          "/" +
          date.month.toString().padLeft(2, '0') +
          "/" +
          date.day.toString().padLeft(2, '0');
    }

    return newDate??'';
  }
}
