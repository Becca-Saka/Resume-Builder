import 'package:flutter/material.dart';

class HowTo extends StatefulWidget {
  @override
  _HowToState createState() => _HowToState();
}

class _HowToState extends State<HowTo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How to use'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 30,),
          customText('1. Fill in all your Details.'),
          customText('2. Some Sections have an add button, click on the add button to add new items to the lists.'),
          customText('3. To remove a section from a list swipe the item left or right.'),
          customText('4. After entering all details click on the save button to make sure your deatails are updated.'),
          customText('5. Click on the eye Icon at the bottom of the screen to preview your cv.'),
          customText('6. Select a template from the list and check how your details look on the page.'),
          customText('7. Click on the settings icon to change the size of the font in your pdf.'),
          customText('8. If you don\'t want a section to show you can leave it blank.'),
          customText('9. Click on the download button to save your pdf to to your device.'),
        ],
      ),
    );
  }
  customText(text){
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(text,
       style: TextStyle(
         fontSize: 20
       ),
       ),
    );
  }
}