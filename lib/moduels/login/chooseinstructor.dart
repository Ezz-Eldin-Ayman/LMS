import 'package:flutter/material.dart';
import 'package:lms/shared/components/components.dart';
import 'login_screen.dart';

class ChooseInstructor extends StatefulWidget {
  String? companyname;

  bool  isstudent=false;
  bool  isparent=false;

  ChooseInstructor(this.companyname,this.isstudent, {Key? key}) : super(key: key);
  @override
  State<ChooseInstructor> createState() => _ChooseInstructorState();
}

class _ChooseInstructorState extends State<ChooseInstructor> {
  // const ChooseInstructor({Key key}) : super(key: key);
  String accounttype = 'Doctor';
  bool account_type=true;
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff030629),
      appBar: AppBar(
        backgroundColor: Color(0xff030629),
      ),

      body: SingleChildScrollView(
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
                              function: () {
                                accounttype = 'doctor';
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginScreen(accounttype: accounttype, companyname: widget.companyname,isstudent: widget.isstudent,isparent:widget.isparent);
                                }));
                              },
                              name: 'Doctor',
                            ),

                            Container_Button(
                              function: () {
                                accounttype = 'assistant';
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginScreen(accounttype: accounttype, companyname: widget.companyname,isstudent: widget.isstudent,isparent:widget.isparent);
                                }));
                              },
                              name: 'Assistant',
                            ),

                            Container_Button(
                              function: () {
                                accounttype = 'trainer';
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginScreen(accounttype: accounttype,companyname:  widget.companyname,isstudent: widget.isstudent,isparent:widget.isparent);
                                }));
                              },
                              name: 'Trainer',
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


