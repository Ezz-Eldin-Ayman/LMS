import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

class StudentSchedule extends StatefulWidget {

  List<dynamic>?  data;
  StudentSchedule({
    this.data

  });
  setstate(){
print(data![0]['student_name']);
  }
  @override
  State<StudentSchedule> createState() => _StudentScheduleState();
}

class _StudentScheduleState extends State<StudentSchedule> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030629),
      appBar: AppBar(backgroundColor: const Color(0xff030629),
          title:const Text('Student Schedule')
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
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
                  Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('')
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:const [
                           Text('id : 2018030012      ',
                          style:TextStyle (
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 1,
                          ),
                          textAlign:TextAlign.center,
                          maxLines: 1,
                             ),
                           Text('can post : false',
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
                            child: Text('student_schedule_name: python'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Company Name: python',style: TextStyle(color: Colors.black),),
                          ),

         ],
                  )
                ],
              ),
            ),
          ),
        ],
    )
    );
  }
}