import 'package:flutter/material.dart';

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
                onLongPress: (){},
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
                  print(widget.userToken.runtimeType);
                  print(widget.schedulesName);
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
    );
  }
}
