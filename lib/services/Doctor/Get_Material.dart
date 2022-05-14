import 'package:lms/helper/api.dart';


class AllMaterial{

  Future< List<dynamic>> Get_All_Materials({required Map<String,dynamic> token,required  schedule,required String type })async{
    List<dynamic>  data =await Api().get(uri:'https://lmsprov1.herokuapp.com/api-user/schedule/material/$type/$schedule',
        token:token['token']);
    print('$data');
    return data;





  }
}