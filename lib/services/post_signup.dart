import 'package:flutter/cupertino.dart';
import 'package:lms/helper/api.dart';
class PostSignUp{
  Future<Map<String, dynamic>> postsignup({
    required String username,required String email ,
    required String first_name,required String last_name,
    required String department,required String password,
    required String confirm_password,required String companyname,
    required String usertype,
    required String gender,
    @required String? age,
    @required String? national_id,
    @required String? parent_national_id,
    @required String? parent_email,
  })async{
    Map<String,dynamic> data;

    if (usertype=='student') {
      data =await Api().post(uri:'https://lmsprov1.herokuapp.com/api-user/user/${companyname}/signup/${usertype}/',
          body: {
            "username"          : username,
            "email"             : email,
            "first_name"        : first_name,
            "last_name"         : last_name,
            "department"        : department,
            "gender"            : gender,
            "age"               : age,
            "national_id"       : national_id,
            "parent_national_id": parent_national_id,
            "parent_email"      : parent_email,
            "password"          : password,
            "confirm_password"  : confirm_password
          });
    }else{
       data =await Api().post(uri:'https://lmsprov1.herokuapp.com/api-user/user/${companyname}/signup/${usertype}/',
          body: {
            "username"          : username,
            "email"             : email,
            "first_name"        : first_name,
            "last_name"         : last_name,
            "department"        : department,
            "password"          : password,
            "confirm_password"  : confirm_password
          });
    }

    return data;
  }
}