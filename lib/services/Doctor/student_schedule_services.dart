import 'package:lms/helper/api.dart';


class StudentScheduleServices{

  Future< List<dynamic>> Get_All_Student_Schedule({required Map<String,dynamic> token,required  schedule_name})async{
    List<dynamic>  data =await Api().get(uri:'https://lmsprov1.herokuapp.com/api-user/schedule/students/$schedule_name/',
        token:token['token']);
    print('data $data');
    return data;





  }
}