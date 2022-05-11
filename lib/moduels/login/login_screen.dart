import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lms/layouts/chooseuniversty.dart';
import 'package:lms/moduels/instructor/doctor/maindoctor.dart';
import 'package:lms/services/post_gettoken.dart';
import 'package:lms/services/post_signup.dart';
import 'package:lms/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  String? accounttype;
  String? companyname;
  bool? isstudent;
  bool? isparent;
  LoginScreen({
    this.accounttype,
    this.companyname,
    this.isstudent,
    this.isparent,
    bool? isLogin
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // variables.
  bool? Ah;
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  bool login = true;
  String? user_type;
  bool islogin = false;
  bool account_type = true;
  bool secure = true;
  var username = TextEditingController();
  var email = TextEditingController();
  var first_name = TextEditingController();

  var last_name = TextEditingController();

  var department = TextEditingController();

  var gender = TextEditingController();

  var age = TextEditingController();

  var nationalid = TextEditingController();

  var parent_national_id = TextEditingController();
  var parent_email = TextEditingController();

  var pass = TextEditingController();
  var passconfirm = TextEditingController();

  String dropdownvalue = 'Male';

  var items = ['Male', 'Female'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030629),
      appBar: AppBar(
        backgroundColor: Color(0xff030629),
        title: Text('${widget.accounttype} Account ... '),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Image.asset(
              'lib/shared/pecture/v10.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Visibility(
                  visible: !widget.isparent!,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                login = true;
                              });
                            },
                            child: Container(
                              height: 70,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: login
                                    ? Color(0xff262B58)
                                    : Colors.grey[400],
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Login',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                login = false;
                              });
                            },
                            child: Container(
                              height: 70,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: login
                                    ? Colors.grey[400]
                                    : Color(0xff262B58) ,
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]),
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                // Login
                Visibility(
                  visible: login,
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: Text(
                              'User Name :',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          default_textfield(
                            control_text: emailcontroller,
                            type: TextInputType.emailAddress,
                            text_field: 'enter email',
                            prefix_icon: Icons.email_outlined,
                            on_submit: (data) {
                              user_type = data;
                              // service.Get_companies();
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: Text(
                              'Password :',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          default_textfield(
                            control_text: passcontroller,
                            on_submit: (value) {
                              return print(value);
                            },
                            type: TextInputType.emailAddress,
                            text_field: 'enter password',
                            prefix_icon: Icons.lock,
                            suffix_icon: secure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            iconbuttonfun: () {
                              setState(() {
                                secure = !secure;
                              });
                            },
                            secure: secure,
                          ),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ChooseUniversty();
                                  }));
                                },
                                child: const Text(
                                  'Forget password',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff030629),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: default_button(
                                  pressed: () async {
                                    GetToken().get_token(
                                        companyname: widget.companyname!,
                                        accounttype: widget.accounttype!,
                                        username:
                                            emailcontroller.text.toString(),
                                        password:
                                            passcontroller.text.toString());
                                    Map<String, dynamic> try109 =
                                        await GetToken().getdatauser(
                                            companyname: widget.companyname!,
                                            accounttype: widget.accounttype!,
                                            username:
                                                emailcontroller.text.toString(),
                                            password:
                                                passcontroller.text.toString());

                                    if (try109 != null) {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return MainApp(companyname: widget.companyname,accounttype: widget.accounttype,);
                                      }));
                                    }
                                  },
                                  text: 'login',
                                  backcolor: Color(0xff030629),
                                  fontsize: 20.0,
                                  fonttype: FontWeight.bold,
                                  width: 150.0,
                                  height: 65,
                                  textcolor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Signup Student
                Visibility(
                  visible: !login,
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        default_textfield(
                          control_text: username,
                          type: TextInputType.emailAddress,
                          text_field: 'enter user name',
                          prefix_icon: Icons.email_outlined,

                        ),
                        default_textfield(
                          control_text: email,
                          type: TextInputType.emailAddress,
                          text_field: 'enter email',
                          prefix_icon: Icons.email_outlined,
                        ),
                        default_textfield(
                          control_text: first_name,
                          type: TextInputType.text,
                          text_field: 'enter first name',
                          prefix_icon: Icons.account_circle,
                        ),
                        default_textfield(
                          control_text: last_name,
                          type: TextInputType.text,
                          text_field: 'enter last name',
                          prefix_icon: Icons.account_circle,
                        ),
                        default_textfield(
                          control_text: department,
                          type: TextInputType.text,
                          text_field: 'enter department',
                          prefix_icon:  Icons.account_balance
                        ),
                        Visibility(
                          visible: widget.isstudent!,
                          child: Column(
                            children: [
                              default_textfield(
                                control_text: age,
                                type: TextInputType.number,
                                text_field: 'enter age',
                                prefix_icon: Icons.perm_identity
                              ),
                              default_textfield(
                                control_text: nationalid,
                                type: TextInputType.number,
                                text_field: 'enter national id',
                                prefix_icon: Icons.perm_identity_rounded,
                              ),
                              default_textfield(
                                control_text: parent_national_id,
                                type: TextInputType.number,
                                text_field: 'enter parent national id',
                                prefix_icon: Icons.perm_identity_rounded,
                              ),
                              default_textfield(
                                control_text: parent_email,
                                type: TextInputType.text,
                                text_field: 'enter parent email',
                                prefix_icon: Icons.perm_identity_rounded,
                              ),
                              Container(
                                margin: const EdgeInsetsDirectional.only(
                                    end: 20, start: 20, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 25),
                                  child: DropdownButton(
                                    iconSize: 35,
                                    underline: Container(),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20.0),
                                    isExpanded: true,
                                    // Initial Value
                                    value: dropdownvalue,

                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    // Array list of items
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },

                                  ),
                                ),
                              ),

                            ],
                          ),

                        ),
                        default_textfield(
                          control_text: pass,
                          on_submit: (value) {
                            return print(value);
                          },
                          type: TextInputType.emailAddress,
                          text_field: 'enter password',
                          prefix_icon: Icons.lock,
                          suffix_icon: secure
                              ? Icons.visibility
                              : Icons.visibility_off,
                          iconbuttonfun: () {
                            setState(() {
                              secure = !secure;
                            });
                          },
                          secure: secure,
                        ),
                        default_textfield(
                          control_text: passconfirm,
                          on_submit: (value) {
                            return print(value);
                          },
                          type: TextInputType.emailAddress,
                          text_field: 'enter password',
                          prefix_icon: Icons.lock,
                          suffix_icon: secure
                              ? Icons.visibility
                              : Icons.visibility_off,
                          iconbuttonfun: () {
                            setState(() {
                              secure = !secure;
                            });
                          },
                          secure: secure,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: default_button(
                            pressed: () {
                                PostSignUp().postsignup(
                                    username: username.text.toString(),
                                    email: email.text.toString(),
                                    first_name: first_name.text.toString(),
                                    last_name: last_name.text.toString(),
                                    department: department.text.toString(),
                                    password: pass.text.toString(),
                                    confirm_password: passconfirm.text
                                        .toString(),
                                    companyname: widget.companyname.toString(),
                                    usertype: widget.accounttype.toString(),
                                    gender: gender.text.toString(),
                                    age: age.text.toString(),
                                    national_id: nationalid.text.toString(),
                                    parent_national_id:
                                    parent_national_id.text.toString(),
                                    parent_email: parent_email.text.toString());

                            },
                            text: 'Submit',
                            backcolor: Color(0xff030629),
                            fontsize: 20.0,
                            fonttype: FontWeight.bold,
                            width: 150.0,
                            height: 65,
                            textcolor: Colors.white,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
