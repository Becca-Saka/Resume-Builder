import 'package:flutter/material.dart';
import 'package:resume_builder/models/education_model.dart';
import '../../database/repo.dart';
import '../widgets.dart';

class Education extends StatefulWidget {
  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  List<EducationItem> listText = [];
  List<EducationModel> modelList = AppRepo.educationModel;

  @override
  initState() {
    updateList();
    super.initState();
  }

  updateList() {
    if (modelList != null) {
      modelList.forEach((element) {
        listText.add(EducationItem(
          model: element,
        ));
      });
    } else {
      addNew();
    }
  }

  saveText() {
    AppRepo.educationModel = [];
    listText.forEach((element) {
      final educationModel = EducationModel(
        college: element.collegeController.text,
        degree: element.degreeController.text,
        startDate: element.startDateController.text,
        endDate: element.endDateController.text,
        summary: element.summaryController.text,
      );
      AppRepo.educationModel.add(educationModel);

      print(AppRepo.educationModel);
    });
  }

  addNew() => setState(() => listText.add(EducationItem()));
  remove(int index) => setState(() => listText.removeAt(index));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ReorderableListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: _getReorderableListItems(),
                onReorder: _updateItems,
              ),
              SizedBox(
                height: 10,
              ),
              footerButtons(onAddTap: addNew, onSaveAdd: saveText),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getReorderableListItems() => listText
      .asMap()
      .map((i, item) => MapEntry(i, _buildEducationList(item, i)))
      .values
      .toList();

  Dismissible _buildEducationList(EducationItem item, int index) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direction) {
          remove(index);
        },
        child: item);
  }

  void _updateItems(int oldIndex, int newIndex) {
    listText.insert(newIndex, listText[oldIndex]);
    if (oldIndex < newIndex) {
      listText.removeAt(oldIndex);
    } else {
      listText.removeAt(oldIndex + 1);
    }
    setState(() {});
  }
}

class EducationItem extends StatelessWidget {
  final EducationModel model;
  EducationItem({this.model});
  final TextEditingController collegeController = new TextEditingController();
  final TextEditingController degreeController = new TextEditingController();
  final TextEditingController startDateController = new TextEditingController();
  final TextEditingController endDateController = new TextEditingController();
  final TextEditingController summaryController = new TextEditingController();

  updateText() {
    if (model != null) {
      collegeController.text = model.college ?? '';
      degreeController.text = model.degree ?? '';
      startDateController.text = model.startDate ?? '';
      endDateController.text = model.endDate ?? '';
      summaryController.text = model.summary ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    updateText();
    return Column(
      children: [
        cardDesign(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                text('College/University', controller: collegeController),
                text('Degree Tittle', controller: degreeController),
                Row(
                  children: [
                    Expanded(
                        child: text(
                      'Start Date',
                      controller: startDateController,
                    )),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: text(
                      'End date',
                      controller: endDateController,
                    )),
                  ],
                ),
                text('Summary',
                    controller: summaryController,
                    lines: 3,
                    input: TextInputType.multiline),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
