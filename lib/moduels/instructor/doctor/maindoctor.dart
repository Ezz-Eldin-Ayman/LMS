import 'package:flutter/material.dart';

void main() => runApp(new MainApp());



class PageOne extends StatefulWidget {
  String? accounttype;
  String? companyname;
  PageOne({
    this.accounttype,
    this.companyname,
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
              ],
            ),
          ),


    );
  }
}

class PageTwo extends StatefulWidget {

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: const Color(0xff030629),
      appBar: AppBar(backgroundColor: const Color(0xff030629),title: Text(" Schedules ",style: TextStyle(color: Colors.white),),),
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
  MainApp({
    this.accounttype,
    this.companyname,
  });
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {


  Widget getPage(int index) {
    switch (index){
      case 0:
        return PageOne(accounttype: widget.accounttype,companyname: widget.companyname,);
        break;
      case 1:
        return PageTwo();
        break;
      case 2:
        return PageThree();
        break;
      default:
        return PageOne();
        break;
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

    return  Scaffold(
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
        );
  }
}
