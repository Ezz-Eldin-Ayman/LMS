import 'package:lms/helper/api.dart';



class AllCompanyServices{

  Future<List<String>> get_allcompanies()async{
    List<dynamic> data =await Api().get(uri:'https://lmsprov1.herokuapp.com/api-user/companies/');
    List<String> companieslist=[];
    companieslist.addAll({
      'Choose Company'
    });
    for(int i=0;i<data.length;i++){
      // companieslist.add(
      //     CompanyModels.fromjson(data[i]['company_name'])
      // );
      companieslist.add(data[i]['company_name']);
      print(data[i]['company_name']);
    }
    print(companieslist);
    return companieslist;



  }




}