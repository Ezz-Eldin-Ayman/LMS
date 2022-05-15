import 'dart:io';

import 'package:flutter/mat'
    'erial.dart';

import 'package:lms/shared/components/components.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../services/Doctor/UploadFile,dart.dart';
 
enum SingingCharacter { slide, video }

class MaterialUpload extends StatefulWidget {
  String? Schedule_Name;
  Map<String,dynamic>? userToken;
  MaterialUpload({
    this.Schedule_Name,
    this.userToken
  });
  SingingCharacter? _character = SingingCharacter.slide;

  @override
  State<MaterialUpload> createState() => _MaterialUploadState();
}

class _MaterialUploadState extends State<MaterialUpload> {
  VideoPlayerController? filecontroller;

  void initState() {
    super.initState();

    filecontroller = VideoPlayerController.file(new File(""))
      ..initialize().then((value) {
        setState(() {});
      });
  }

  late File filea;

  // File filea = File(platformFile.path);
  bool ismute = false;
  String Material = 'k';
  var user_type;

  var materialname = TextEditingController();
  SingingCharacter? _character = SingingCharacter.slide;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff030629),
        title: Text('mokh'),
      ),
      body: Container(
        color: Color(0xff030629),
        child: ListView(
          children: [
            Text(
              'Upload Material ',
              style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),


            ListTile(
              title: const Text('slide', style: TextStyle(color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.slide,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('video', style: TextStyle(color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.video,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),


            Text('material name :', style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),),


            default_textfield(
              control_text: materialname,
              type: TextInputType.text,
              text_field: 'enter Name Material',
              prefix_icon: Icons.email_outlined,
              on_submit: (data) {
                user_type = data;
                // service.Get_companies();
              },
            ),


// video palace
            Center(
              child: AspectRatio(child: VideoPlayer(filecontroller!),
                aspectRatio: filecontroller!.value.aspectRatio,
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  final file = await PickFile();
                  if (file == null)
                    return;
                  else {
                    filea = File(file.path);
                    filecontroller = VideoPlayerController.file(file)
                      ..initialize().then((value) {
                        setState(() {
                          print('ahmed hassan maghwry   ${filea!.runtimeType}');
                        });
                      });
                  }
                },
                child: Text('Upload Video', style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),)),

            FloatingActionButton(onPressed: () {
              setState(() {
                filecontroller!.setVolume(ismute ? 1 : 0);
                ismute = !ismute;
              });
            },
              child: ismute ? Icon(Icons.volume_off_rounded) : Icon(
                  Icons.volume_up),),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                ElevatedButton(
                    onPressed: () async {
                      filecontroller!.play();
                      // FilePickerResult? result = await FilePicker.platform.pickFiles();
                    },
                    child: Icon(Icons.play_arrow_rounded)),

                ElevatedButton(
                    onPressed: () async {
                      Duration? d = await filecontroller!.position;
                      var changeduration = d! - Duration(seconds: 10);
                      filecontroller!.seekTo(changeduration);
                      // FilePickerResult? result = await FilePicker.platform.pickFiles();
                    },
                    child: Text('<<', style: TextStyle(color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),)),

                ElevatedButton(
                    onPressed: () async {
                      filecontroller!.pause();
                      // FilePickerResult? result = await FilePicker.platform.pickFiles();
                    },
                    child: Icon(Icons.pause)),

                ElevatedButton(
                    onPressed: () async {
                      Duration? d = await filecontroller!.position;
                      var changeduration = d! + Duration(seconds: 10);
                      filecontroller!.seekTo(changeduration);
                      // FilePickerResult? result = await FilePicker.platform.pickFiles();
                    },
                    child: Text('>>')),
                ElevatedButton(
                  onPressed: () async {

                  },
                  child: const Text('Send', style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),),
              ],

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150.0,
                  child: default_button(
                    pressed: () async {
                      print('ahmed hassan maghwry   ${filea!.runtimeType}');
                      UploadFile().Upload_Video(
                          token: widget.userToken!,
                          fileName: materialname.text.toString(),
                          Schedule_Name: widget.Schedule_Name!,
                          uploadvideo: filea!);
                    },
                    text: 'send',
                    backcolor: Colors.blue,
                    fontsize: 20.0,
                    fonttype: FontWeight.bold,
                    width: 5,
                    height: 60,
                    textcolor: Colors.white,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Future<File?> PickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);

    if (result == null)
      return null;
    else
      return File(result.files.single.path.toString());
  }

}