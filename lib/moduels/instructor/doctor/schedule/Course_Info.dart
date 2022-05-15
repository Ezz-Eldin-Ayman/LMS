import 'package:flutter/material.dart';

import '../../../../services/Doctor/student_schedule_services.dart';
import 'Material.dart';
import 'StudentSchedule.dart';
import 'UploadMaterialVide.dart';

class CourseInfo extends StatefulWidget {
  String? accounttype;
  String? companyname;
  String? username;
  String? schedulesName;
  Map<String,dynamic>? userToken;
  CourseInfo({
    this.accounttype,
    this.companyname,
    this.username,
    this.schedulesName,
    this.userToken,

  });

  @override
  State<CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  List<dynamic> ldata = [] ;
  List id=[];
  List student_schedule_name=[];
  List company_name=[];
  List student_name=[];
  List can_post=[];
  void initState()  {
    super.initState();
    Future (() async {
      List<dynamic> data = await StudentScheduleServices().Get_All_Student_Schedule(token:widget.userToken! , schedule_name: widget.schedulesName);
      setState(() {
        ldata = data;
        Map<int, dynamic> map = ldata.asMap();
        for(int i=0;i<ldata.length;i++){
          id.add(map[i]["id"]);
          student_schedule_name.add(map[i]["student_schedule_name"]);
          company_name.add(map[i]["company_name"]);
          student_name.add(map[i]["student_name"]);
          can_post.add(map[i]["can_post"]);
        }

      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: const Color(0xff030629),
    appBar: AppBar(backgroundColor: const Color(0xff030629),
          title:const Text('Student Schedule')
      ),

      drawer: Drawer(
        backgroundColor: Colors.indigoAccent,
        child: ListView(
            padding: EdgeInsets.all(0.0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(widget.username.toString(),style:TextStyle(
                  fontSize: 30,
                  color: Colors.white,

                ),),
                accountEmail: Text("Welcome ${widget.accounttype}",style: TextStyle(fontSize: 16)),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black,
                  maxRadius: 20.0,
                  backgroundImage: AssetImage('lib/shared/pecture/Doctor.png',),
                ),
                decoration: BoxDecoration(
                    color: Colors.indigo,
                ),),

              ListTile(
                title: Text('Student Schedule',style:TextStyle(fontSize: 20,)),
                leading: Icon(Icons.person),
                  onTap: (){
                    Navigator.of(context).pop();}
              ),

              Divider(),


              ListTile(
                title: Text('View Materials',style:TextStyle(fontSize: 20,)),
                leading: Icon(Icons.book),
                onTap: (){
                  print(widget.userToken.runtimeType);
                  print(widget.schedulesName);
                  Navigator.push(context, MaterialPageRoute(builder:(context){
                    return material(userToken: widget.userToken,schedulesName: widget.schedulesName,);
                  }));
                },
              ),
               ListTile(
                title: Text('Upload Materials',style:TextStyle(fontSize: 20,)),
                leading: Icon(Icons.upload_rounded),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context){
                    return MaterialUpload(userToken: widget.userToken,Schedule_Name: widget.schedulesName,);
                  }));
                },
              ),

              ListTile(
                title: Text('Tasks',style:TextStyle(fontSize: 20,)),
                leading: Icon(Icons.assignment),
                onLongPress: (){},
              ),


              ListTile(
                title:const Text('Quizs',style:TextStyle(fontSize: 20,)),
                leading: Icon(Icons.assignment),
                onLongPress: (){},
              ),

              Divider(),

              ListTile(
                  title: Text('Close ',style:TextStyle(fontSize: 20,)),
                  leading: Icon(Icons.close),
                  onTap: (){
                    Navigator.of(context).pop();}
              ),
            ]
        ),
      ),
      body:Container(
        child:ListView(
          children:List.generate(ldata.length, (index){
            return  Padding(
              padding: const EdgeInsets.all(10.0),
              child: Expanded(
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          child: Image.asset('lib/shared/pecture/student.png',width:100 ),
                          radius: 35,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [

                            Row(
                              children: [
                                const Padding  (
                                    padding:   EdgeInsets.all(8.0),
                                    child:Text('Student name :',
                                      style: TextStyle(
                                      fontWeight: FontWeight.bold,

                                    ),maxLines: 1,textAlign: TextAlign.right,)
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:Text(student_name[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      wordSpacing: 1,
                                     ),)
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('id :    ${id[index].toString()}   ',
                                  style:TextStyle (
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 1,
                                  ),
                                  textAlign:TextAlign.center,
                                  maxLines: 1,
                                ),
                                Text('can post : ${can_post[index].toString()}',
                                  style:TextStyle (
                                    fontSize: 15,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 1,
                                  ),
                                  textAlign:TextAlign.center,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text('student_schedule_name: ${student_schedule_name[index].toString()}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Company Name: ${company_name[index].toString()}',style: TextStyle(color: Colors.black),),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );

          }),
        )
      )
    );}}
