import 'package:lms/helper/api.dart';


class AllSchedule{

  Future< List<dynamic>> Get_All_Schedule({required Map<String,dynamic> token})async{
    List<dynamic>  data =await Api().get(uri:'https://lmsprov1.herokuapp.com/api-user/schedule/instructor/',
        token:token['token']);
    print('$data');
    return data;





}
}