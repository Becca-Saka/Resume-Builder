import 'package:flutter/material.dart';
import 'preview.dart';
class SelectTemplate extends StatefulWidget {
  @override
  _SelectTemplateState createState() => _SelectTemplateState();
}

class _SelectTemplateState extends State<SelectTemplate> {
  double boxWidth, boxHeight;

  Widget imageWidget(String url, int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Preview(index)));
      },
      child: Container(
        height: boxHeight,
        width: boxWidth,
        child: Image(
          image: AssetImage(url),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    boxWidth = (size.width) / 2.2;
    boxHeight = (size.height) / 2.6;

    return Scaffold(
      appBar: AppBar(
        title: Text('Select a template'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),

            Row(
              children: [
                imageWidget('assets/images/temp1.jpg', 1),
                Spacer(),
                imageWidget('assets/images/temp2.png', 2),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //  Spacer(),
            Row(
              children: [
                imageWidget('assets/images/temp3.jpg', 3),
                Spacer(),
                imageWidget('assets/images/temp4.jpg', 4),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //  Spacer(),
            Row(
              children: [
                imageWidget('assets/images/temp5.png', 5),
                Spacer(),
                imageWidget('assets/images/temp6.jpg', 6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
