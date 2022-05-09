import 'package:flutter/material.dart';
import 'package:lms/moduels/login/chooseccount.dart';
import 'package:lms/services/get_all_companies_service.dart';
import 'package:lms/shared/components/components.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class ChooseUniversty extends StatefulWidget {
  const ChooseUniversty({Key? key}) : super(key: key);

  @override
  State<ChooseUniversty> createState() => _ChooseUniverstyState();
}

class _ChooseUniverstyState extends State<ChooseUniversty> {
  String dropdownvalue="Choose Company";
  @override
  Widget build(BuildContext context) {
    const AlertDialog(
      title: Text("Please Choose Company To Get Start"),

    );
    return Scaffold(
      backgroundColor:const Color(0xff030629),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const  Text(
              'Hey There  !',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),
            ),
            const  SizedBox(height: 10.0,),
            const Text(
              'Lets Choose The',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),

            ),
            const SizedBox(height: 10.0,),
            const  Text(
              'Company To Get Start .',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),

            ),
            const Spacer(flex: 1),
            const  Text(
              'Choose My Company *',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,

              ),
            ),
            const SizedBox(height: 10.0,),
            FutureBuilder<List<String>>(
              future: AllCompanyServices().get_allcompanies(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<String> companies=snapshot.data!;

                  return  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.circular(10),),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: DropdownButton(
                        iconSize:35,
                        underline: Container(),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black, fontSize: 20.0),
                        // Initial Value
                        value: dropdownvalue,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black,),
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        iconEnabledColor: Colors.grey,

                        // Array list of items
                        items: companies.map((String companies) {
                          return DropdownMenuItem(
                            value: companies,
                            child: Text(companies),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue =newValue!;
                          });
                        },
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }else{
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            const Spacer(flex:1),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                default_button(
                  pressed: (){
                    setState(() {
                      if (dropdownvalue!='Choose Company') {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ChooseAccount(dropdownvalue);
                            }));
                      }else{
                        Alert(
                          context: context,
                          title: "Please Choose  Company \n \n To Get Start \n",
                            style: const AlertStyle(
                              titleStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,

                              ),
                              backgroundColor: Color(0xffC5C5C5),
                            buttonAreaPadding: EdgeInsets.all(50),
                            ) , ).show();
                       }
                    });
                  },
                  text: 'Next',
                  backcolor: Colors.white,
                  fontsize: 20.0,
                  fonttype: FontWeight.bold,
                  width: 120.0,
                  textcolor: Colors.black,
                ),

              ],
            ),

            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
