import 'dart:io';
import 'package:lms/helper/api.dart';
class UploadFile{
  Future<Map<String, dynamic>> Upload_Video({required String fileName, required File uploadVideo,required String Schedule_Name,required Map<String,dynamic> token})async{
    Map<String,dynamic> uploaddata =await Api().post(uri:'https://lmsprov1.herokuapp.com/api-user/schedule/material/video/$Schedule_Name/', token:token['token'],
        body: {
          'material_name': fileName,
          'lecture_video': uploadVideo,
        });
    print("hhhhhhhh ${uploaddata.runtimeType}");
    return uploaddata;
  }

}