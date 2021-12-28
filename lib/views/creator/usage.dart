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
          SizedBox(
            height: 20,
          ),
          customText('1. Fill in all your Details.'),
          customText(
              '2. Some Sections have an add button, click on the add button to add new items to the lists.'),
          customText(
              '3. To remove a section from a list swipe the item left or right.'),
          customText(
              '4. To reorder a section from a list long press and drag the item up or down.'),
          customText(
              '5. After entering all details in each section click on the save button to make sure your details are updated.'),
          customText(
              '6. Click on the eye icon at the bottom of the screen to preview your cv.'),
          customText(
              '7. Select a template from the list and check how your details look on the page.'),
          customText(
              '9. Click on the settings icon to change the size of the font in your pdf.'),
          customText(
              '9. If you don\'t want a section to show you can leave it blank.'),
          customText(
              '10. Click on the download button to save your pdf to to your device.'),
        ],
      ),
    );
  }

  customText(text) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
