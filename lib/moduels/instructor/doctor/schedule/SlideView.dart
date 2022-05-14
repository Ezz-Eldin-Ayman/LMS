import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class slideView extends StatefulWidget {
  String? link;
  slideView({
   this.link,

});

  @override
  State<slideView> createState() => _slideViewState();
}

class _slideViewState extends State<slideView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
  body: SfPdfViewer.network("https://lmsprov1.herokuapp.com${widget.link}"),
));

  }
}
