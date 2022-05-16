import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
      body:Stack(
        children: <Widget>[
          Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                        // image: DecorationImage(
                        //     image: AssetImage("assets/imgs/h.jpg"), fit: BoxFit.fitHeight)
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "lib/shared/pecture/student.png"),
                                  radius: 65.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: Text("${widget.username.toString()}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text("${widget.accounttype}",
                                  style: TextStyle(
                                      color: Colors.white
                                          .withOpacity(0.85),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 80.0, left: 42, right: 32),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text("University",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.0,
                                              fontWeight:
                                              FontWeight.bold)),
                                      Text("${widget.companyname}",
                                          style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.8),
                                              fontSize: 14.0))
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text("26",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.0,
                                              fontWeight:
                                              FontWeight.bold)),
                                      Text("Comments",
                                          style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.8),
                                              fontSize: 14.0))
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text("48",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.0,
                                              fontWeight:
                                              FontWeight.bold)),
                                      Text("Bookmarks",
                                          style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.8),
                                              fontSize: 14.0))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 0.0,bottom: 35),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChooseUniversty()));
                        },
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 12.0, right: 12.0, top: 10, bottom: 10),
                            child: Text("Signout",
                                style: TextStyle(fontSize: 20.0))),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          )
        ],
      )
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
          children: List.generate(ldata.length, (index){
              return  GestureDetector(
                onTap: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder:(context){
                      return CourseInfo(username: widget.username,schedulesName:scheduleNames[index].toString() ,userToken: widget.userToken,accounttype: widget.accounttype,companyname: widget.companyname,);
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
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.schedule, size: 30),
    ];

    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
      backgroundColor: Color(0xff030629),
        body: getPage(_currentIndex),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          height: 60,
          index: _currentIndex,
          items:items,
          onTap: (index)=>setState(() {
            this._currentIndex=index;
          }),
        ),


      ),
    );
  }
}




