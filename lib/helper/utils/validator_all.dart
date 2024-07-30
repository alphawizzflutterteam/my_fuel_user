import 'package:intl/intl.dart';

class Validator {
  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter name';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an email address';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value!.isEmpty) {
    } else if (value.length < 10) {
      return 'Please enter a valid phone';
    } else if (value.length > 10) {
      return 'Please enter a valid phone of 10 digits';
    }
    return null;
  }

  static String? validateWithhint(String? value, String hint) {
    if (value!.isEmpty) {
      return 'Please enter an $hint';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an password';
    } else if (value.length < 6) {
      return 'Please enter password of length 6 digits';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value!.isEmpty) {
      return 'Please enter an password';
    } else if (value != password) {
      return 'Password does not match';
    }
    return null;
  }

  static String? validateMsmeno(String? value) {
    if (value!.isEmpty) {
      return 'Please enter MSME number';
    }
    // Example validation pattern for Indian MSME number format
    if (!RegExp(r'^[A-Z]{2}[0-9]{2}[A-Z]{1}[0-9]{1}[A-Z0-9]{3}$')
        .hasMatch(value)) {
      return 'Please enter a valid MSME number';
    }
    return null;
  }

  static String convertDateString(String inputDate) {
    // Parse the input string into a DateTime object
    DateTime dateTime = DateFormat('yyyy-MM-dd').parse(inputDate);

    // Format the DateTime object into the desired output format
    String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);

    return formattedDate;
  }

// Add more static methods for other validations as needed
}
