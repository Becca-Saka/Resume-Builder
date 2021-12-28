import 'package:flutter/material.dart';
import '../../database/repo.dart';
import '../widgets.dart';

class Achievements extends StatefulWidget {
  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  final TextEditingController controller =
      new TextEditingController(text: AppRepo.achievements ?? '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Achivements'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              text('Achivements', controller: controller, lines: 8),
              SizedBox(
                height: 10,
              ),
             
              SizedBox(
                  width: double.infinity,
                child: singlefooterButtons(onSaveTap: () {
                  setState(() {
                    AppRepo.achievements = controller.text;
                  });
                }),
              )
            ],
          ),
        ));
  }
}
