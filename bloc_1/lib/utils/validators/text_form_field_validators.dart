class Validator{
  static String? validateUsersInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter the students name';
    } else if (value.contains(RegExp(r'[0-9]'))) {
      return 'a valid name does not contain any numbers [0-9]';
    } else {
      return null;
    }
  }
}