import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget default_textfield({
  required TextInputType type,
  bool secure=false,
  Function(String) ? on_submit,
  required String text_field,
   IconData? prefix_icon,
  IconData? suffix_icon,
  required var control_text,

})=>Padding(
  padding: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
  ),

    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: TextFormField(
        style: TextStyle(
          fontSize: 20.0,
        ),
        controller:control_text ,
        keyboardType: type,
        obscureText: secure,
        onFieldSubmitted: on_submit,

        decoration:  InputDecoration(
            labelText: text_field,
            fillColor: Colors.red,
            border: InputBorder.none,
            prefixIcon: Icon(
              prefix_icon,
            ),
            suffixIcon: Icon(
              suffix_icon,
            )
        ),
      ),
    ),
);



Widget default_button({
  required Color backcolor,
  required Color textcolor,
  required double width,
  required double fontsize,
  required Function() pressed,
  required String text,
  FontWeight? fonttype,
  double? height,
  AlignmentGeometry? aligment,
  double radius=35.0,


})=> Container(
  alignment: aligment,
  width: width,
  height: height,
  child: MaterialButton(
    elevation: 500.0,
    onPressed:pressed,
    child: Text(
      text
      ,style: TextStyle(
        fontWeight:fonttype,
        color: textcolor,
        fontSize:fontsize
    ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: backcolor,
  ),

);

// widget default drop down menu
Widget Default_DropDownMenu({
  // items in drop
  required var items,
  required Function changed,

})=>DropdownButton(
items: items.map((String items){

  return DropdownMenuItem(
    value: items,
    child: Text(items),
  );
}).toList(),
  onChanged:changed(),
);



// button container
Widget Container_Button({
  required Function() function,
  double padding=10.0,
  double radious=30.0,
  double height=93.0,
  double width=300.0,
  Color color=Colors.white,
  required String name,



})=> GestureDetector(
    onTap: (){
     function();

    },
    child:  Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        height: height,
        width: width,
        decoration:BoxDecoration(
          borderRadius : BorderRadius.circular(radious),
          color: Colors.white,
        ),
        child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              Text(
              name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Color(0xff030629),
                ),
              ),

            ]
        ),
      ),
    )
);
