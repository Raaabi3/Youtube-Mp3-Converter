import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_mp3/Controller/HomeController.dart';

class Customtextfield extends StatelessWidget {
  Customtextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context, listen: false);
    return TextField(
      controller: homeController.textcontroller,
      decoration: InputDecoration(
        labelText: "Enter Youtube link",
        hintText: 'https://youtu.be/example',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: const Icon(Icons.link),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorText: homeController.getErrorMessage, // SHOW ERROR HERE
      ),
    );
  }
}
