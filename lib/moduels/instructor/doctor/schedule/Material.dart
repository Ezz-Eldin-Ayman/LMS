import 'package:flutter/material.dart';
import 'package:lms/moduels/instructor/doctor/schedule/SlideView.dart';
import 'package:lms/moduels/instructor/doctor/schedule/viewVideo.dart';
import 'package:lms/services/Doctor/Get_Material.dart';

class material extends StatefulWidget {
  String? accounttype;
  String? companyname;
  String? username;
  String? schedulesName;
  var userToken;
  material({
    this.accounttype,
    this.companyname,
    this.username,
    this.schedulesName,
    this.userToken,

  });

  @override
  State<material> createState() => _materialState();
}

class _materialState extends State<material> {


  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
        length: 2,
        child: Scaffold(
        backgroundColor: const Color(0xff030629),
        appBar: AppBar(backgroundColor: const Color(0xff030629),
            title:const Text('View Material'),
          bottom: TabBar(
            tabs: [
              Tab(text: "Slides",icon: Icon(Icons.insert_drive_file),),
              Tab(text: "Videos ",icon: Icon(Icons.video_library),),
            ],
          ),
        ),
        body:
        TabBarView(
          children: [
            viewSlide(userToken: widget.userToken,schedulesName: widget.schedulesName,materialType: "slide",),
            viewVideo(userToken: widget.userToken,schedulesName: widget.schedulesName,materialType: "video",),
          ],
        ),




    ),
      );

  }
}

class viewSlide extends StatefulWidget {

  String? accounttype;
  String? companyname;
  String? username;
  String? schedulesName;
  var userToken;
  String? materialType;
  viewSlide({
    this.accounttype,
    this.companyname,
    this.username,
    this.schedulesName,
    this.userToken,
    this.materialType,

  });
  @override
  State<viewSlide> createState() => _viewSlideState();
}

class _viewSlideState extends State<viewSlide> {
  List<dynamic> ldata = [] ;
  List materialLink=[];
  List materialName=[];
  List date=[];
  void initState()  {
    super.initState();
    Future (() async {
      List<dynamic> data = await AllMaterial().Get_All_Materials(token: widget.userToken, schedule: widget.schedulesName,type: widget.materialType!);
      setState(() {
        ldata = data;
        Map<int, dynamic> map = ldata.asMap();
        for(int i=0;i<ldata.length;i++){
          materialName.add(map[i]["material_name"]);
          materialLink.add(map[i]["slide"]);
          date.add(map[i]["created_on"]);
        }

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return    GridView.count(
      scrollDirection:Axis.vertical,
      crossAxisCount: 2,
      children:
      List.generate(ldata.length, (index){
        return GestureDetector(
          onTap: (){
            print(materialLink);
            Navigator.push(context, MaterialPageRoute(builder:(context){
              return slideView(link: materialLink[index],);
            }));

          },
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ListTile(title: Center(child:  Text(materialName[index].toString(),style: TextStyle(fontSize: 25,),))),
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


    );

  }
}

class viewVideo extends StatefulWidget {

  String? accounttype;
  String? companyname;
  String? username;
  String? schedulesName;
  var userToken;
  String? materialType;
  viewVideo({
    this.accounttype,
    this.companyname,
    this.username,
    this.schedulesName,
    this.userToken,
    this.materialType,

  });

  @override
  State<viewVideo> createState() => _viewVideoState();
}

class _viewVideoState extends State<viewVideo> {
  List<dynamic> ldata = [] ;
  List materialLink=[];
  List materialName=[];
  List date=[];
  void initState()  {
    super.initState();
    Future (() async {
      List<dynamic> data = await AllMaterial().Get_All_Materials(token: widget.userToken, schedule: widget.schedulesName,type: widget.materialType!);
      setState(() {
        ldata = data;
        Map<int, dynamic> map = ldata.asMap();
        for(int i=0;i<ldata.length;i++){
          materialName.add(map[i]["material_name"]);
          materialLink.add(map[i]["lecture_video"]);
          date.add(map[i]["created_on"]);

        }

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      scrollDirection:Axis.vertical,
      crossAxisCount: 2,
      children:
      List.generate(ldata.length, (index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context){
              return PlayVideo(link: materialLink[index],);
            }));

          },
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ListTile(title: Center(child:  Text(materialName[index].toString(),style: TextStyle(fontSize: 25,),))),
                  Icon(Icons.video_library,size: 70,color: Color(0xff030629),),
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


    );







  }
}


