import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_mp3/Controller/HomeController.dart';

class Customelevatedbuttom extends StatelessWidget {
  const Customelevatedbuttom({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<Homecontroller>(context, listen: false);

    return ElevatedButton(
      onPressed: () {
        homeController.verifylink();
        
      },
      child: const Text("Press"),
    );
  }
}
