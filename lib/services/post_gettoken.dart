import 'package:lms/helper/api.dart';
class GetToken{
bool ?ahmed;

  Future<Map<String, dynamic>> get_token({required String companyname,required String accounttype ,required String username,required String password})async{
    Map<String,dynamic> token =await Api().post(uri:'https://lmsprov1.herokuapp.com/api-user/user/$companyname/login/$accounttype/',
    body: {
      'username': username,
      'password': password,
    });
print(token['token']);
    return token;
  }


  Future<Map<String, dynamic>> getdatauser({required String companyname,required String accounttype,required String username,required String password })async{
    Map<String, dynamic> token=await GetToken().get_token(companyname: companyname, accounttype: accounttype,username: username,password: password);
    // String toke=await token['token'];
    Map<String, dynamic> data =await Api().get(uri: 'https://lmsprov1.herokuapp.com/api-user/auth-user/', token:token['token'].toString());
    print('$data');
    return data;

  }

}