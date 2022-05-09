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
      backgroundColor: Color(0xff030629),
      appBar: AppBar(backgroundColor: Color(0xff030629),),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView(
            children: [
              Container(
                child: Card(
                color: Color(0xffC5C5C5),
                child: Column(
                  children: [
                    Text('Schedule  name',style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    ),),
                    Text('Schedule  name',style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    ),),
                    Text('Schedule  name',style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    ),),
                  ],
                ),
            ),
              ),
              Card(
              color: Color(0xffC5C5C5),
              child: Column(
                children: [
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                ],
              ),
            ),
              Card(
              color: Color(0xffC5C5C5),
              child: Column(
                children: [
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                ],
              ),
            ),
              Card(
              color: Color(0xffC5C5C5),
              child: Column(
                children: [
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                ],
              ),
            ),
              Card(
              color: Color(0xffC5C5C5),
              child: Column(
                children: [
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                ],
              ),
            ),
              Card(
              color: Color(0xffC5C5C5),
              child: Column(
                children: [
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                ],
              ),
            ),
              Card(
              color: Color(0xffC5C5C5),
              child: Column(
                children: [
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                ],
              ),
            ),
              Card(
              color: Color(0xffC5C5C5),
              child: Column(
                children: [
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                ],
              ),
            ),
              Card(
              color: Color(0xffC5C5C5),
              child: Column(
                children: [
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text('Schedule  name',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
                ],
              ),
            ),
            ],
              gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3/2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              )
          ),
        ),
      ),
    );
  }
}
