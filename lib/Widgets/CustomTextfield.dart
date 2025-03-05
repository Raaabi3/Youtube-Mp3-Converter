import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_mp3/Controller/HomeController.dart';

class Customtextfield extends StatelessWidget {
  Customtextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<Homecontroller>(context, listen: false);
    return TextField(controller: homeController.textcontroller );
  }
}
