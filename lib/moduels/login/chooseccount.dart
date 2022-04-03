import 'package:flutter/material.dart';
import 'package:lms/shared/components/components.dart';
import 'chooseinstructor.dart';
import 'login_screen.dart';

class ChooseAccount extends StatefulWidget {
//  const ChooseAccount({Key? key}) : super(key: key);
  String companyname;
  ChooseAccount(this.companyname);

  @override
  State<ChooseAccount> createState() => _ChooseAccountState();
}

class _ChooseAccountState extends State<ChooseAccount> {
  String? accounttype;

  bool isstudent=true;
  bool isparent=false;

  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff030629),
      appBar: AppBar(
        backgroundColor: Color(0xff030629),
      ),

      body:SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:const [
                Text(
                  'Choose My',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Type .',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                  children: <Widget>[
                    Center(
                      child: Image(
                        image: new AssetImage('lib/shared/pecture/v2.png'),
                        width: screenWidth,
                        height: screenHeight/2,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 25,),

                            Container_Button(
                              function: (){
                                isstudent=false;
                                Navigator.push(context, MaterialPageRoute(builder:(context){
                                  return ChooseInstructor(widget.companyname,isstudent);
                                }));
                              },
                              name: 'Instructor',


                            ),

                            Container_Button(
                              function: (){
                                isstudent=true;
                                accounttype='student';
                                Navigator.push(context, MaterialPageRoute(builder:(context){
                                  return LoginScreen(accounttype: accounttype!,companyname: widget.companyname,isstudent: isstudent,isparent:isparent);
                                }));
                              },
                              name: 'Student',

                            ),

                            Container_Button(
                              function: (){
                                accounttype='parent';
                                isparent=true;
                                Navigator.push(context, MaterialPageRoute(builder:(context){
                                  return LoginScreen(accounttype: accounttype!,companyname: widget.companyname,isstudent: isstudent,isparent: isparent,);
                                }));
                              },
                              name: 'parent',
                            ),
                          ],
                        ),
                      ),
                    ),

                  ] ),
            ),
          ],
        ),
      )

    );
  }
}