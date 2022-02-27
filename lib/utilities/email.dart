class Email {
  Email({String? input}) {
    value = input;
  }

  void updateContents(String inputtedText) {
    value = inputtedText;
  }

  String? value;
}
