import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart' as pw;

//Coverting Text to uppercase
toUpperCase(String text){
  return text.toUpperCase();
}

//Card design in profile Screens
Widget cardDesign ({Widget child, Function onRemove}){
  return Card(
             child: Column(
              
               children: [
                  Container(
                    color: Colors.grey[300],
                    alignment: Alignment.centerRight,
                    child: IconButton(icon: Icon(Icons.upgrade), onPressed: null),
                  ),
                  child
                   ],
             ),
           );
}

//Single Save button when filling profile
Widget singlefooterButtons({Function onSaveTap}){
  return  ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Color(0xff47c2d6)
    ),
    onPressed: onSaveTap, child: Text('Save'));
}

//Double Save and add button when filling profile
Widget footerButtons({Function onAddTap, Function onSaveAdd}){
  
  return  Row(
               children: [
                 Expanded(
                   child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       primary: Color(0xff47c2d6)
                     ),
                     onPressed: onAddTap, child: Text('Add')),
                 ),
                  SizedBox(width: 5,),
                  Expanded(
                   child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       primary: Color(0xff47c2d6)
                     ),
                     onPressed: onSaveAdd, child: Text('Save')),
                 ),
               ],
             );
}

//Custom textfields for all editable texts
Widget text(String text,{TextEditingController controller,
 TextInputType input = TextInputType.text,
   int lines = 1,TextInputAction action}){
    return TextField(
      controller: controller,
      keyboardType: input,
      textInputAction: lines ==1?TextInputAction.next:TextInputAction.none,
           decoration: InputDecoration(
             labelText: text
           ),
           maxLines: lines,
              
            );
  }

pw.Widget visibility({pw.Widget child, condition}){
  return condition? child:pw.Container();
}
pw.Widget skillsRate(color, String  level,){
  PdfColor backcolor = PdfColor.fromHex('e8e8e8');
  double width =  level == 'Beginner'?40:level == 'Expert'?100:75;
  return pw.Stack(
    children: [
       pw.Container(
    color: backcolor,
    height: 10,
    width: 100,
    
    ),
    pw.Container(
        width: width,
        height: 10,
      color: color,
      )
    

  ]);
}