import 'package:lms/helper/api.dart';


class Get_Tasks{

  Future< List<dynamic>> Get_All_Tasks({required Map<String,dynamic> token,required  scheduleName,required String companyName })async{
    List<dynamic>  data =await Api().get(uri:'https://lmsprov1.herokuapp.com/api-user/schedule/task/$companyName/$scheduleName/',
        token:token['token']);
    print('$data');
    return data;





  }
}