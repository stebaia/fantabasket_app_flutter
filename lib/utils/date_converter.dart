import 'package:intl/intl.dart';

class DateConverter {
  static String getDateNowWithFormat() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(now);
  }

  static String getOnlyDate() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }

  static String getOnlyHour() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(now);
  }

  static String convert(String? inputDate) {
    if (inputDate != null) {
      DateTime date = DateTime.parse(inputDate).toLocal();
      String formattedDate = DateFormat('MMMM dd - HH:mm').format(date);
      return formattedDate;
    } else
      return "";
  }

  static String convertDate(String? inputDate) {
    if (inputDate != null) {
      DateTime date = DateTime.parse(inputDate).toLocal();
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      return formattedDate;
    } else
      return "";
  }

  static String convertDateToISO(String? inputDate) {
    if (inputDate != null) {
      DateTime date = DateTime.parse(inputDate).toLocal();
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      return formattedDate;
    } else
      return "";
  }

  static String convertAgendaDate(String? inputDate) {
    if (inputDate != null) {
      DateTime date = DateTime.parse(inputDate).toLocal();
      String formattedDate = DateFormat('MMMM dd yyyy').format(date);
      return formattedDate;
    } else
      return "";
  }

  static String compareDates(String? inputDate1, String? inputDate2) {
    try {
      if (inputDate1 == null || inputDate1.isEmpty) {
        return '';
      }
      DateTime date1 = DateTime.parse(inputDate1).toLocal();
      if (inputDate2 == null || inputDate2.isEmpty) {
        if (date1.hour != 0) {
          return DateFormat('MMMM d - HH y').format(date1);
        } else {
          return convert(inputDate1);
        }
      }
      DateTime date2 = DateTime.parse(inputDate2).toLocal();
      if (date1.isAtSameMomentAs(date2)) {
        return convert(inputDate1);
      } else if (date1.year == date2.year && date1.month == date2.month) {
        return DateFormat('MMMM d - ').format(date1) +
            DateFormat('d y').format(date2);
      } else if (date1.year == date2.year) {
        return DateFormat('MMMM - ').format(date1) +
            DateFormat('MMMM y').format(date2);
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  static String compareDatesWithoutHour(
      String? inputDate1, String? inputDate2) {
    try {
      if (inputDate1 == null || inputDate1.isEmpty) {
        return '';
      }
      DateTime date1 = DateTime.parse(inputDate1).toLocal();
      if (inputDate2 == null || inputDate2.isEmpty) {
        if (date1.hour != 0) {
          return DateFormat('MMMM d').format(date1);
        } else {
          return convert(inputDate1);
        }
      }
      DateTime date2 = DateTime.parse(inputDate2).toLocal();
      if (date1.isAtSameMomentAs(date2)) {
        return convert(inputDate1);
      } else if (date1.year == date2.year && date1.month == date2.month) {
        return DateFormat('MMMM d - ').format(date1) +
            DateFormat('d y').format(date2);
      } else if (date1.year == date2.year) {
        return DateFormat('MMMM - ').format(date1) +
            DateFormat('MMMM y').format(date2);
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  static String compareHour(String? inputDate1, String? inputDate2) {
    try {
      if (inputDate1 == null || inputDate1.isEmpty) {
        return '';
      }
      DateTime date1 = DateTime.parse(inputDate1).toLocal();
      if (inputDate2 == null || inputDate2.isEmpty) {
        if (date1.hour != 0) {
          return DateFormat('hh').format(date1);
        } else {
          return convert(inputDate1);
        }
      }
      DateTime date2 = DateTime.parse(inputDate2).toLocal();
      if (date1.isAtSameMomentAs(date2)) {
        return convert(inputDate1);
      } else if (date1.year == date2.year && date1.month == date2.month) {
        return DateFormat('MMMM d - ').format(date1) +
            DateFormat('d y').format(date2);
      } else if (date1.year == date2.year) {
        return DateFormat('MMMM - ').format(date1) +
            DateFormat('MMMM y').format(date2);
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  static String compareDatesToMacro(String? inputDate1, String? inputDate2) {
    try {
      if (inputDate1 == null || inputDate1.isEmpty) {
        return '';
      }
      DateTime date1 = DateTime.parse(inputDate1).toLocal();
      if (inputDate2 == null || inputDate2.isEmpty) {
        if (date1.hour != 0) {
          return DateFormat('MMMM d').format(date1);
        } else {
          return convert(inputDate1);
        }
      }
      DateTime date2 = DateTime.parse(inputDate2).toLocal();
      if (date1.isAtSameMomentAs(date2)) {
        return convert(inputDate1);
      } else if (date1.year == date2.year && date1.month == date2.month) {
        return DateFormat('MMMM d - ').format(date1) +
            DateFormat('d y').format(date2);
      } else if (date1.year == date2.year) {
        return DateFormat('MMMM - ').format(date1) +
            DateFormat('MMMM y').format(date2);
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  static Map<String, DateTime> getCurrentWeekDates() {
    final now = DateTime.now();
    DateTime midnight = DateTime(now.year, now.month, now.day);
    final startOfWeek = midnight.subtract(Duration(days: midnight.weekday + 1));
    final endOfWeek = startOfWeek.add(Duration(days: 9));
    return {'start': startOfWeek, 'end': endOfWeek};
  }
}
