final DateTime today = DateTime.now();
final DateTime tomorrow = DateTime.now().add(const Duration(days: 1));

class Deadline {
  Deadline(this.dateTime);

  final DateTime dateTime;

  String getTimeLeft() {
    Duration timeLeft = toDuration();
    if (timeLeft.inDays > 0) {
      return "残り　" + daysLeft(timeLeft);
    } else {
      return "残り　" + hourLeft(timeLeft);
    }
  }

  Duration toDuration() {
    return dateTime.difference(DateTime.now());
  }

  String daysLeft(Duration timeLeft) {
    return timeLeft.inDays.toString() + "日";
  }

  String hourLeft(Duration timeLeft) {
    return timeLeft.inHours.toString() + "時間";
  }
}
