import 'package:flutter/material.dart';

class ScheduleMain extends StatefulWidget {
  String? accounttype;
  String? companyname;
  bool? isstudent;
  bool? isparent;
  ScheduleMain({
    this.accounttype,
    this.companyname,
    this.isstudent,
    this.isparent,
    bool? isLogin
  });

  @override
  State<ScheduleMain> createState() => _ScheduleMainState();
}

class _ScheduleMainState extends State<ScheduleMain> {
  bool  c = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff030629),
      appBar: AppBar(backgroundColor: const Color(0xff030629),),
      body: GridView(
        children:  [
          GestureDetector(
            onTap: (){
              setState(() {
                c= !c;

              });
            },
            child:  Padding(
              padding: EdgeInsets.all(5.0),
              child: Card(
                color: c?Colors.red:Colors.green,
                child: Center(
                  child: ListTile(
                    title: Text("Schedule Name",textAlign: TextAlign.center, ),
                  ),
                ),
                elevation: 8,
                shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
                ),
              ),
            ),
          ),
          SizedBox(width: 10,height: 10,),
          Text(widget.companyname.toString(),style: TextStyle(color: Colors.white),),
          Text(widget.accounttype.toString(),style: TextStyle(color: Colors.white)),




        ],
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 50
          )
      ),
    );
  }
}


//   Card(
//
//   color: Color(0xffC5C5C5),
//   child: Column(
//     children: [
//       Text('Schedule  name',style: TextStyle(
//           fontSize: 20,
//           color: Colors.black
//       ),),
//       Text('Schedule  name',style: TextStyle(
//           fontSize: 20,
//           color: Colors.black
//       ),),
//       Text('Schedule  name',style: TextStyle(
//           fontSize: 20,
//           color: Colors.black
//       ),),
//     ],
//   ),
// ),

