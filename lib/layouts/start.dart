import 'package:flutter/material.dart';
import 'chooseuniversty.dart';

class Start extends StatefulWidget {


  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xff030629),
    body: GestureDetector(
    onTap: (){
      setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return ChooseUniversty();
      }));
      });
    },
      child: Container(
      margin: EdgeInsets.all(100.0),
      decoration: BoxDecoration(
      shape: BoxShape.circle,

      ),
      ),
    )
    ),
    );
  }
}
