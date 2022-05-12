// import 'package:flutter/material.dart';
// import 'package:lms/services/Doctor/Get_Schedule.dart';
// import 'Course_Info.dart';
// class ScheduleMain extends StatefulWidget {
//   String? accounttype;
//   String? companyname;
//   String? username;
//   String? password;
//   ScheduleMain({
//     this.accounttype,
//     this.companyname,
//     this.username,
//     this.password,
//
//   });
//
//   @override
//   State<ScheduleMain> createState() => _ScheduleMainState();
// }
//
// class _ScheduleMainState extends State<ScheduleMain> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff030629),
//       appBar: AppBar(backgroundColor: const Color(0xff030629),),
//       body: Column(
//         children: [
//           GridView(
//             children:  [
//               GestureDetector(
//                 onTap: (){
//                   setState(()async {
//                     Map<String, dynamic>  data =await AllSchedule().Get_All_Schedule(companyname: widget.companyname!, accounttype: widget.accounttype!, username: widget.username!, password: widget.password!);
//                     Navigator.push(context, MaterialPageRoute(builder:(context){
//                       return CourseInfo();
//                     }));
//                   });
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.all(5.0),
//                   child: Card(
//                     child: Center(
//                       child: ListTile(
//                         title: Text("Schedule Name",textAlign: TextAlign.center, ),
//                       ),
//                     ),
//                     elevation: 8,
//                     shadowColor: Colors.green,
//                     shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(5.0),
//                 child: Card(
//                   child: Center(
//                     child: ListTile(
//                       title: Text("Schedule Name",textAlign: TextAlign.center, ),
//                     ),
//                   ),
//                   elevation: 8,
//                   shadowColor: Colors.green,
//                   shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
//                   ),
//                 ),
//               ),
//
//
//
//             ],
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 50
//               )
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// //   Card(
// //
// //   color: Color(0xffC5C5C5),
// //   child: Column(
// //     children: [
// //       Text('Schedule  name',style: TextStyle(
// //           fontSize: 20,
// //           color: Colors.black
// //       ),),
// //       Text('Schedule  name',style: TextStyle(
// //           fontSize: 20,
// //           color: Colors.black
// //       ),),
// //       Text('Schedule  name',style: TextStyle(
// //           fontSize: 20,
// //           color: Colors.black
// //       ),),
// //     ],
// //   ),
// // ),
//
