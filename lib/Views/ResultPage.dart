import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

bool loaded = false;




class _ResultPageState extends State<ResultPage> {

  Future<void> fetchignvideo() async{
  await Future.delayed(Duration(seconds: 2));
  setState(() {
      loaded = true; // Update the loaded state
    });
}

@override
void initState(){
  super.initState();
  fetchignvideo();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    Center(
      child: !loaded ? CircularProgressIndicator(
        color: Colors.redAccent,
      ) : Container(),
    )
      );

  }
}
