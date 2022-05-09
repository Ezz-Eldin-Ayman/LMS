import 'package:flutter/material.dart';

class ScheduleMain extends StatefulWidget {
  const ScheduleMain({Key? key}) : super(key: key);

  @override
  State<ScheduleMain> createState() => _ScheduleMainState();
}

class _ScheduleMainState extends State<ScheduleMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030629),
      appBar: AppBar(backgroundColor: const Color(0xff030629),),
      body: GridView(
        children: const [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text("Schedule Name",textAlign: TextAlign.center, ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text("Schedule Name",textAlign: TextAlign.center, ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text("Schedule Name",textAlign: TextAlign.center, ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text("Schedule Name",textAlign: TextAlign.center, ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text("Schedule Name",textAlign: TextAlign.center, ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text("Schedule Name",textAlign: TextAlign.center, ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text("Schedule Name",textAlign: TextAlign.center, ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text("Schedule Name",textAlign: TextAlign.center, ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text("Schedule Name",textAlign: TextAlign.center, ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text("Schedule Name",textAlign: TextAlign.center, ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text("Schedule Name",textAlign: TextAlign.center, ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text("Schedule Name",textAlign: TextAlign.center, ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text("Schedule Name",textAlign: TextAlign.center, ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text("Schedule Name",textAlign: TextAlign.center, ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              child: Center(
                child: ListTile(
                  title: Text("Schedule Name",textAlign: TextAlign.center, ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
              ),
            ),
          ),


        ],
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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

