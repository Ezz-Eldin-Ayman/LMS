import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/layouts/chooseuniversty.dart';
import 'package:lms/moduels/instructor/doctor/schedule/Course_Info.dart';
import 'package:lms/services/Doctor/Get_Schedule.dart';

void main() => runApp(new MainApp());



class PageOne extends StatefulWidget {
  String? accounttype;
  String? companyname;
  String? username;
  String? password;
  PageOne({
    this.accounttype,
    this.companyname,
    this.password,
    this.username,
  });


  @override
  State<PageOne> createState() => _PageOneState();
}


class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030629),
      appBar: AppBar(
        backgroundColor: const Color(0xff030629),
        title: Text(" Home ",style: TextStyle(color: Colors.white),),
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Company Is : " + widget.companyname.toString(),style: TextStyle(color: Colors.white),),
            Text("And Your Are - " +
                widget.accounttype.toString() +
                " -  In This Company ",
              style: TextStyle(color: Colors.white),),
            MaterialButton(onPressed: (){


              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                    return ChooseUniversty();
                  }));
            },
            color: Colors.red,
            child: Text("LogOut",style: TextStyle(color: Colors.white),),)
          ],
        ),
      ),


    );
  }
}

class PageTwo extends StatefulWidget {
  String? accounttype;
  String? companyname;
  String? username;
  String? password;
  Map<String,dynamic>? userToken;
  PageTwo({
    this.accounttype,
    this.companyname,
    this.password,
    this.username,
    this.userToken,
  });
  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  List<dynamic> ldata = [] ;
  List scheduleNames=[];
  void initState()  {
    super.initState();
    Future (() async {
      List<dynamic> data = await AllSchedule().Get_All_Schedule(token:widget.userToken!);
     setState(() {
       ldata = data;
       Map<int, dynamic> map = ldata.asMap();
       for(int i=0;i<ldata.length;i++){
         scheduleNames.add(map[i]["instructor_schedule_name"]);
       }

     });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: const Color(0xff030629),
      appBar: AppBar(backgroundColor: const Color(0xff030629),
        title: Text(" Schedules ",style: TextStyle(color: Colors.white),),
      ),
      body:
      GridView.count(
        scrollDirection:Axis.vertical,

          crossAxisCount: 2,
          children:
          List.generate(ldata.length, (index){
              return  GestureDetector(
                onTap: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder:(context){
                      return CourseInfo(username: widget.username,schedulesName:scheduleNames[index].toString() ,userToken: widget.userToken,);
                    }));
                  });

                },
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    child: Center(
                      child: ListTile(
                        title: Text(scheduleNames[index].toString(),textAlign: TextAlign.center, ),
                      ),
                    ),
                    elevation: 8,
                    shadowColor: Colors.green,
                    shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
                    ),
                  ),
                ),
              );

            }),


      ),




    );
  }
}

class PageThree extends StatefulWidget {

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030629),
      appBar: AppBar(
        backgroundColor: const Color(0xff030629),
        title: Text(" Profile ",style: TextStyle(color: Colors.white),),
      ),
      body:
      Center(
        child: Column(
          children: [

          ],
        ),
      ),


    );
  }
}

class MainApp extends StatefulWidget {
  String? accounttype;
  String? companyname;
  String? username;
  String? password;
  Map<String,dynamic>? userToken;
  MainApp({
    this.accounttype,
    this.companyname,
    this.password,
    this.username,
    this.userToken,
  });
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {


  Widget getPage(int index) {
    switch (index){
      case 0:
        return PageOne(accounttype: widget.accounttype,companyname: widget.companyname,username: widget.username,password: widget.password,);
      case 1:
        return PageTwo(accounttype: widget.accounttype,companyname: widget.companyname,username: widget.username,password: widget.password,userToken: widget.userToken,);
      case 2:
        return PageThree();
      default:
        return PageOne();
    }
  }

  int _currentIndex = 0;

  onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: getPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.table_view_outlined),label: 'Schedule'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),label: 'profile'),
          ],
          onTap: onTabTapped,
          currentIndex: _currentIndex,
        ),
      ),
    );
  }
}




