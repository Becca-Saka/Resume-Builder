import 'package:flutter/material.dart';
import 'package:resume_builder/models/skils_model.dart';
import '../../database/repo.dart';
import '../widgets.dart';

class Skills extends StatefulWidget {
  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  List<SkillsItem> listText = [];
  List<SkillsModel> modelList = AppRepo.skillsModel;

  @override
  initState() {
    updateList();
    super.initState();
  }

  updateList() {
    listText = [];
    if (modelList != null) {
      modelList.forEach((element) {
        listText.add(SkillsItem(
          model: element,
        ));
      });
    } else {
      addNew();
    }
  }

  saveText() {
    listText.forEach((element) {
      final skillsModel = SkillsModel(
        title: element.titleController.text,
        level: element.selectedLevel,
      );
      AppRepo.skillsModel.add(skillsModel);

      print(AppRepo.skillsModel);
    });
  }

  addNew() => setState(() => listText.add(SkillsItem()));
  remove(int index) => setState(() => listText.removeAt(index));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skills'),
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
      .map((i, item) => MapEntry(i, _buildSkillList(item, i)))
      .values
      .toList();

  Dismissible _buildSkillList(SkillsItem item, int index) {
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

class SkillsItem extends StatelessWidget {
  final SkillsModel model;
  SkillsItem({this.model});
  final TextEditingController titleController = new TextEditingController();
  final skillLevel = ['Beginner', 'Intermidiate', 'Expert'];
  String selectedLevel = 'Beginner';

  updateText() {
    if (model != null) {
      titleController.text = model.title ?? '';
      selectedLevel = model.level;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text('Skill title', controller: titleController),
                SizedBox(
                  height: 15,
                ),
                Text('Proffeciency level'),
                SizedBox(
                  height: 15,
                ),
                StatefulBuilder(builder: (BuildContext context, setState) {
                  return DropdownButton(
                    value: selectedLevel,
                    isExpanded: true,
                    items: skillLevel.map((String val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedLevel = value;
                      });
                    },
                  );
                }),
                SizedBox(
                  height: 15,
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
