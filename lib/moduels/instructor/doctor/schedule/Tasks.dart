import 'package:flutter/material.dart';
import 'package:lms/services/Doctor/Get_Tasks.dart';

import 'SlideView.dart';

class tasks extends StatefulWidget {
  String? Schedule_Name;
  String? companyname;
  var userToken;


  tasks({
    this.Schedule_Name,
    this.userToken,
    this.companyname,

  });

  @override
  State<tasks> createState() => _tasksState();
}

class _tasksState extends State<tasks> {
  List<dynamic> ldata = [] ;
  List task_file=[];
  List task_name=[];
  List date=[];
  void initState()  {
    super.initState();
    Future (() async {
      List<dynamic> data = await Get_Tasks().Get_All_Tasks(token: widget.userToken,companyName: widget.companyname!,scheduleName: widget.Schedule_Name);
      setState(() {
        ldata = data;
        Map<int, dynamic> map = ldata.asMap();
        for(int i=0;i<ldata.length;i++){
          task_name.add(map[i]["task_name"]);
          task_file.add(map[i]["task_file"]);
          date.add(map[i]["created_on"]);
        }

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(backgroundColor: const Color(0xff030629),
    appBar: AppBar(
    backgroundColor: const Color(0xff030629),
    title: Text(" Tasks ",style: TextStyle(color: Colors.white),),
    ),
    body: GridView.count(
    scrollDirection:Axis.vertical,
      crossAxisCount: 2,
      children:
      List.generate(ldata.length, (index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context){
              return slideView(link: task_file[index],);
            }));

          },
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ListTile(title: Center(child:  Text(task_name[index].toString(),style: TextStyle(fontSize: 25,),))),
                  Icon(Icons.picture_as_pdf,size: 70,color: Color(0xff030629),),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(date[index].toString(), style: TextStyle(fontSize: 15),overflow:TextOverflow.ellipsis ,),
                  ),
                ],
              ),
            ),

          ),
        );

      }),


    ),

    );


  }}
