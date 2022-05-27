final DateTime today = DateTime.now();
final DateTime tomorrow = DateTime.now().add(const Duration(days: 1));

class Deadline {
  Deadline(this.dateTime);

  final DateTime dateTime;

  bool haveTimeLeft() {
    return dateTime.isAfter(DateTime.now());
  }

  String getTimeLeft() {
    Duration timeLeft = toDuration();
    if (timeLeft.inDays > 0) {
      return "残り　" + daysLeft(timeLeft);
    } else if (timeLeft.inHours > 0) {
      return "残り　" + hoursLeft(timeLeft);
    } else if (timeLeft.inMinutes > 0) {
      return "残り　" + minutesLeft(timeLeft);
    } else {
      return "過ぎています";
    }
  }

  Duration toDuration() {
    return dateTime.difference(DateTime.now());
  }

  String daysLeft(Duration timeLeft) {
    return timeLeft.inDays.toString() + "日";
  }

  String hoursLeft(Duration timeLeft) {
    return timeLeft.inHours.toString() + "時間";
  }

  String minutesLeft(Duration timeLeft) {
    return timeLeft.inMinutes.toString() + "分";
  }
}
