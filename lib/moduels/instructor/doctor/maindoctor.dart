import 'package:flutter/material.dart';
import 'package:lms/moduels/instructor/doctor/schedule/schedulemain.dart';

class MainDoctor extends StatefulWidget {
  const MainDoctor({Key? key}) : super(key: key);

  @override
  State<MainDoctor> createState() => _MainDoctorState();
}

class _MainDoctorState extends State<MainDoctor> {

  int bottom_navigator_bar_selected=1;
  void _Item_Navigator_Bar(int index){
    setState(() {
      bottom_navigator_bar_selected=index;
    });
  }
List<Widget> _pages =[
  ScheduleMain(),
  Scaffold(
    backgroundColor: Color(0xff030629),
    appBar: AppBar(backgroundColor: Color(0xff030629),),
    body: Column(
      children: [
        Text('home')
      ],
    ),
  ),
  Scaffold(
    backgroundColor: Color(0xff030629),
    appBar: AppBar(backgroundColor: Color(0xff030629),),
    body: Column(
      children: [
        Text('profile')
      ],
    ),
  ),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[bottom_navigator_bar_selected],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _Item_Navigator_Bar,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.table_view_outlined),label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: 'profile'),
        ],
        backgroundColor: Color(0xffC5C5C5),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: bottom_navigator_bar_selected,

      ),
    );
  }
}
