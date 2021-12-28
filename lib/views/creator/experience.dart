import 'package:flutter/material.dart';
import 'package:resume_builder/models/experience_model.dart';
import '../../database/repo.dart';
import '../widgets.dart';
class Experience extends StatefulWidget {
  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
    List<ExperienceItem> listText = [];
  List<ExperienceModel> modelList = AppRepo.experienceModel;
  @override
  initState(){
     updateList();
    super.initState();
  }

  updateList(){
    if(modelList!=null){
      modelList.forEach((element) {
        listText.add(ExperienceItem(model: element,) );
        
      });
    }else{
      addNew();
    }

  }

  

  saveText(){
    AppRepo.experienceModel= [];
    listText.forEach((element) {
     final experienceModel = ExperienceModel(
        company: element.companyController.text,
        role: element.roleController.text,
        startDate: element.startDateController.text,
        endDate: element.endDateController.text,
        summary: element.summaryController.text,
      );
      AppRepo.experienceModel.add(experienceModel);

      print(AppRepo.experienceModel);
    });
  }

  addNew()=> setState(() => listText.add(ExperienceItem()));
  remove(int index)=> setState(() => listText.removeAt(index));
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experience'),
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 10,),
           ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: listText.length,
                itemBuilder: (BuildContext context, int index){
                return   Dismissible(
                  key: UniqueKey(), 
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction){
                    remove(index);
                  },
                  child: listText[index]);

              }),
              SizedBox(height: 10,),
              footerButtons(
                onAddTap: addNew, onSaveAdd: saveText
              ),
          ],),
        ),
      ),
    );
  }
}


class ExperienceItem extends StatelessWidget{
  final ExperienceModel model;
  ExperienceItem({this.model});

    final TextEditingController companyController = new TextEditingController();
    final TextEditingController roleController = new TextEditingController();
    final TextEditingController startDateController = new TextEditingController();
    final TextEditingController endDateController = new TextEditingController();
    final TextEditingController summaryController = new TextEditingController();

     updateText(){
      if(model!=null){
        companyController.text = model.company??'';
      roleController.text = model.role??'';
      startDateController.text = model.startDate??'';
      endDateController.text = model.endDate??'';
      summaryController.text= model.summary??'';

      }
      
    }
    @override
    Widget build(BuildContext context) {
      updateText();
      return   Column(
                children: [
                   cardDesign(
            child:  Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Column(
                     children: [
                       text('Company',controller: companyController),
                         text('Role',controller: roleController ),
                     Row(
                       children: [
                         Expanded(child: text('Start Date',controller: startDateController)),
                         SizedBox(width: 5,),
                        Expanded(child: text('End date',controller: endDateController)),
                       ],
                     ),
                    
                     text('Summary',controller: summaryController , lines: 3, input: TextInputType.multiline),

                      SizedBox(height: 10,),

                     ],
                   ),
                 ),
          ),
            
                        SizedBox(height: 15,),
                ],
              );
    }

}