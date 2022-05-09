import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:lms/moduels/login/login_screen.dart';

bool? isLogin;

class Api{
  Future<dynamic> get ({required String uri,@required String? token})async{
    Map<String,String> header={};
    if(token!=null){
      header.addAll({
        'Content-Type':'application/json',
        'Authorization': 'Bearer $token'
      });
    }
    Uri url=Uri.parse(uri);
    http.Response response=await http.get(url,headers: header);
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }
    else{
      throw Exception('there problem in status code ${response.statusCode}');
    }
  }



  Future<dynamic> post({required String uri,@required dynamic body,@required String? token ,})async{
    Map<String,String> header={};
    if(token!=null){
      header.addAll({
        'Content-Type':'application/json',
        'Authorization': 'Bearer $token',

      });
    }
    Uri url = Uri.parse(uri);
    http.Response response = await http.post(
        url,
        body:body,
        headers: {

        });

    if(response.statusCode==200){
      isLogin=true;
      print("sssss");
      LoginScreen(isLogin: true,);
      Fluttertoast.showToast(
          msg: "Login Successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Map<String,dynamic> data =jsonDecode(response.body);
      return data;
    }else{
      isLogin=false;
      Fluttertoast.showToast(
          msg: "statuscode ${response.statusCode} , ${jsonDecode(response.body)}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      throw Exception('there is a problem in statuscode ${response.statusCode} and the error in body ${jsonDecode(response.body)}');
    }

  }


  Future<dynamic> put({required String uri,@required dynamic body,@required String? token})async{
    Map<String,String> header={};
    header.addAll({
      'Content-Type':'application/json'
    });
    if(token!=null){
      header.addAll({
        'Authorization': 'Bearer $token'
      });
    }
    Uri url = Uri.parse(uri);
    http.Response response = await http.post(
        url,
        body:body,
        headers: header
    );
    if(response.statusCode==200){
      Map<String,dynamic> data =jsonDecode(response.body);
      return data;
    }else{
      throw Exception('there is a problem in statuscode ${response.statusCode} and the error in body ${jsonDecode(response.body)}');
    }



  }
}