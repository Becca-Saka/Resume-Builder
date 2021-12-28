import 'package:flutter/material.dart';

import 'personal_details.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
      final double statusbarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 150),
        child:Container(
      height: 50+statusbarHeight,
      child:  AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading:  IconButton( onPressed: ()=> Navigator.pop(context),
        icon: Icon(Icons.arrow_back, color: Colors.white),),
      title: Text('Profile', style: TextStyle(color: Colors.white),),
      centerTitle: true,
      ),
      decoration: BoxDecoration(
        gradient: gradient()),
    ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                textSeperator('Sections'),
                customIcon( 'Personal Details', Icons.person, onTap:(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PersonalDetails()));
                }),
                customIcon( 'Education', Icons.book, onTap:(){}),
                customIcon( 'Experience', Icons.work, onTap:(){}),
                customIcon( 'Skill', Icons.star_border, onTap:(){}),
                customIcon( 'Objective', Icons.assignment, onTap:(){}),
                customIcon( 'Reference', Icons.people, onTap:(){}),
                SizedBox(
                  height: 5,
                ),
                textSeperator('More Sections'),
                 customIcon( 'Projects', Icons.person, onTap:(){}),
                customIcon( 'Cover Letter', Icons.event_note, onTap:(){}),
                customIcon( 'Add more sections', Icons.add, onTap:(){}),
                  textSeperator('Manage Sections'),
                customIcon( 'Rearrange/Edit Heading', Icons.compare_arrows, onTap:(){}),
                customIcon( 'Help', Icons.help, onTap:(){}),
              
              ],
            ),
          ),

          Container(
            height: 50,
             decoration: BoxDecoration(
        gradient: gradient()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.remove_red_eye, color: Colors.white,),
            SizedBox(width: 5,),
            Text('View CV', style: TextStyle(color: Colors.white),)
          ],
        ),
            
          ),
        
        ],
      ),
    );
  }


  Widget customIcon(String text, IconData icon, {Function onTap} ){
   return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 8.0),
     child: Container(
       height: 60,
       child: Center(
         child: Card(
                  child: ListTile(
                    onTap: onTap,
                    leading: LinearShaderMask(child: icon),
                    title: Text(text),
                  ),
                ),
       ),
     ),
   );

 }

 Widget textSeperator(String text){
   return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 5,
        left: 16,
        right: 12,
      ),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(text, style: TextStyle(
           fontSize: 16,
           color: Colors.grey[700],
         ),),
          Seperator(),

       ],
     ),
   );
 }

 Gradient gradient (){
   return LinearGradient(
          colors: [Color(0xff37ADCA), Color(0xff3C93C6), Color(0xff4B4fBB)],
          begin: const FractionalOffset(0.2, 0.1),
          end: const FractionalOffset(0.5, 0.0),
          // stops: [0.6, 0.10, 0.12],
          tileMode: TileMode.clamp,
        );
 }



}


class LinearShaderMask extends StatelessWidget {
 final IconData child;
  LinearShaderMask({this.child});
  @override
  Widget build(BuildContext context) {
    return ShaderMask(shaderCallback: (bounds){
      return RadialGradient(
        colors: [Color(0xff37ADCA), Color(0xff3C93C6), Color(0xff643CB7)],
        center: Alignment.topLeft,
        radius: 1,
        tileMode: TileMode.mirror,


        ).createShader(bounds);
    },
    child: Icon(child, color: Colors.white),
    );
  }
}

class Seperator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context,  BoxConstraints constraints){
      final boxWidth = constraints.constrainWidth();
      final dashWidth = 2.0;
      final dashHeight = 1.0;
      final dashCount = (boxWidth/ (2*dashWidth)).floor();
      return Flex(
        children: List.generate(dashCount, (_) {
          return SizedBox(
            width: dashWidth,
            height: dashHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey[400]),
            ),
          );
        }),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
      );

    });
  }
}


 