import 'package:flutter/material.dart';
import '../../database/repo.dart';
import '../widgets.dart';

class Achievements extends StatefulWidget {
  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  final TextEditingController controller =  new TextEditingController();

  @override
  void initState() {
      controller.text = AppRepo. achievements??'';
      super.initState();
    }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Achivements'),),
      body:   Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          SizedBox(height: 10,),
           
      text('Achivements', controller: controller, lines: 5 ),
            SizedBox(height: 10,),
            singlefooterButtons(onSaveTap: (){
              setState(() {
                                AppRepo.achievements =controller.text;
                              });

            })
        ],),
      )
    );
  }
}
