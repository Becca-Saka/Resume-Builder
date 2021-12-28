import 'package:flutter/material.dart';
import 'package:resume_builder/views/viewer/select_template.dart';

import 'creator/achivements.dart';
import 'creator/education.dart';
import 'creator/experience.dart';
import 'creator/personal_details.dart';
import 'creator/reference.dart';
import 'creator/skills.dart';
import 'creator/usage.dart';
class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: ListView(
        children: [
          customIcon( 'Personal Information', Icons.person, navigateTo: PersonalDetails()),
          customIcon( 'Skill', Icons.work, navigateTo: Skills()),
          customIcon( 'Education', Icons.book,navigateTo: Education()),
          customIcon( 'Experience', Icons.star_border, navigateTo: Experience()),
          customIcon( 'Reference', Icons.people, navigateTo: Reference()),
          customIcon( 'Achievements', Icons.event_note, navigateTo: Achievements()),
          customIcon( 'How to use', Icons.help, navigateTo: HowTo()),
        
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SelectTemplate()));
        },
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }


  Widget customIcon(String text, IconData icon, {navigateTo} ){
   return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 8.0),
     child: Container(
       height: 60,
       child: Center(
         child: Card(
                  child: ListTile(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>navigateTo));
                    },
                    leading: Icon(icon, color: Color(0xff47c2d6),),
                    title: Text(text),
                  ),
                ),
       ),
     ),
   );

 }

}


