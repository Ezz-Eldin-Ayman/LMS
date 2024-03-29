import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:lms/layouts/chooseuniversty.dart';


void main() =>runApp(DevicePreview(builder: (context)=> LMS()));
class LMS extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
       return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: ChooseUniversty(),
    );
  }
}
