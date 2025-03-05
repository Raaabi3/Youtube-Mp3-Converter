import 'package:flutter/widgets.dart';

class Homecontroller with ChangeNotifier {
  TextEditingController textcontroller = TextEditingController();
  String? _errorMessage; 
  bool _isvalid = true;

  bool get getisvalid => _isvalid;
  String? get getErrorMessage => _errorMessage;

  void setError(String message) {
    _errorMessage = message;
    _isvalid = false;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    _isvalid = true;
    notifyListeners();
  }

  void verifylink() {
    if (textcontroller.text.isEmpty) {
      setError("The link cannot be empty.");
    } else if (!textcontroller.text.contains("https://")) {
      setError("The link must start with https://");
    } else if (!textcontroller.text.endsWith(".com")) {
      setError("The link must end with .com");
    }else if (textcontroller.text.length > 11) {
      setError("The link is too short");
    } else {
      clearError();
    }
  }

  void dispose() {
    textcontroller.dispose();
  }
}
