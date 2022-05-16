import 'package:flutter/material.dart';
import 'package:lms/moduels/instructor/doctor/schedule/Tasks.dart';
import '../../../../services/Doctor/student_schedule_services.dart';
import 'Material.dart';

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
               //Upload
              //  ListTile(
              //   title: Text('Upload Materials',style:TextStyle(fontSize: 20,)),
              //   leading: Icon(Icons.upload_rounded),
              //   onTap: (){
              //     Navigator.push(context, MaterialPageRoute(builder:(context){
              //       return MaterialUpload(userToken: widget.userToken,Schedule_Name: widget.schedulesName,);
              //     }));
              //   },
              // ),

              ListTile(
                title: Text('Tasks',style:TextStyle(fontSize: 20,)),
                leading: Icon(Icons.assignment),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context){
                    return tasks(userToken: widget.userToken,Schedule_Name: widget.schedulesName,companyname: widget.companyname,);
                  }));
                },
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

      body:ListView(
        children:List.generate(ldata.length, (index){
          return  Padding(
            padding:  EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white),
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      child: Image.asset('lib/shared/pecture/student.png',width:100 ),
                      radius: 35,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Student Name :  ${student_name[index].toString()}",style: TextStyle(fontSize: 15),),
                      SizedBox(height: 5,),
                      Text("Student ID :  ${id[index].toString()}",style: TextStyle(fontSize: 15),),
                      SizedBox(height: 5,),
                      Text("Schedule :  ${student_schedule_name[index].toString()}",style: TextStyle(fontSize: 15),),
                      SizedBox(height: 5,),
                      Text("University  :  ${company_name[index].toString()}",style: TextStyle(fontSize: 15),),

                    ],
                  ),


                ],
              ),
            ),
          );

        }),
      )
    );}}

// ${company_name[index].toString()}
// ${student_schedule_name[index].toString()}
// ${student_name[index]}
// ${id[index].toString()}