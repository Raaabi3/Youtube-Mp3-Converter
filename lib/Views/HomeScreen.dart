import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_mp3/Controller/HomeController.dart';
import 'package:youtube_mp3/Widgets/CustomElevatedButtom.dart';
import 'package:youtube_mp3/Widgets/CustomTextfield.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _formKey = GlobalKey<FormState>(); // Form key to trigger validation

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Youtube Mp3",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Form(
            key: _formKey,
            autovalidateMode:
                AutovalidateMode.onUserInteraction, 
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:  20.0),
              child: Customtextfield(),
            ),
          ),
          const SizedBox(height: 20),
          Customelevatedbuttom(formKey: _formKey), 
        ],
      ),
    );
  }
}
