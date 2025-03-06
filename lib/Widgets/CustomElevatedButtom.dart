import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_mp3/Controller/HomeController.dart';
import 'package:youtube_mp3/Views/ResultPage.dart';

class Customelevatedbuttom extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const Customelevatedbuttom({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context, listen: false);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        minimumSize: Size(300, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        homeController.verifylink(); // Validate link
        formKey.currentState?.validate();
        if (homeController.getErrorMessage == null) {
          homeController.fetchAudio();
          /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ResultPage()),
          );*/
        }
      },
      child: const Text("Press", style: TextStyle(color: Colors.white)),
    );
  }
}
