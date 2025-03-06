import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:youtube_mp3/Model/DownloadLink.dart';
import 'package:youtube_mp3/Services/FetchAudio_api.dart';

class HomeController with ChangeNotifier {
  TextEditingController textcontroller = TextEditingController();
  String? _errorMessage;
  String? youtubeUrl;
  List<Downloadlink>? downloadlinks;
  Downloadlink? downloadlink; // Ensure this is initialized if needed

  String? get getErrorMessage => _errorMessage;

  Future<void> fetchAudio() async {
    try {
      // Ensure youtubeUrl is not null before making the request
      if (youtubeUrl == null || youtubeUrl!.isEmpty) {
        setError("Please enter a valid YouTube URL.");
        return;
      }

      Response response = await fetchAudioService(youtubeUrl!);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        print(response.body);
        downloadlink ??= Downloadlink();
        downloadlink?.downloadUrl = responseBody["downloadUrl"];

        print("The download link is: " + downloadlink!.downloadUrl!);
      } else {
        print("Failed to fetch audio");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void setError(String message) {
    _errorMessage = message;
    notifyListeners(); // Update UI
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void verifylink() {
    youtubeUrl = textcontroller.text.trim();
    RegExp youtubeRegex = RegExp(
      r"^(https?:\/\/)?(www\.)?(youtube\.com|youtu\.be)\/.+$",
    );

    if (youtubeUrl!.isEmpty) {
      setError("The link cannot be empty.");
    } else if (!youtubeRegex.hasMatch(youtubeUrl!)) {
      setError("Enter a valid YouTube link.");
    } else {
      clearError();
    }
  }

  @override
  void dispose() {
    textcontroller.dispose();
    super.dispose();
  }
}
