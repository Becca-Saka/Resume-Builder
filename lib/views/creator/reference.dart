import 'package:flutter/material.dart';
import 'package:resume_builder/models/reference_model.dart';
import '../../database/repo.dart';
import '../widgets.dart';

class Reference extends StatefulWidget {
  @override
  _ReferenceState createState() => _ReferenceState();
}

class _ReferenceState extends State<Reference> {
  List<ReferenceItem> listText = [];
  List<ReferenceModel> modelList = AppRepo.referenceModel;
  
  @override
  initState(){
    updateList();
    super.initState();
  }

  updateList(){
    if(modelList!=null){
      modelList.forEach((element) {
        listText.add(ReferenceItem(model: element,) );
        
      });
    }else{
      addNew();
    }

  }


  

  saveText(){
    AppRepo.referenceModel= [];
    listText.forEach((element) {
     final referenceModel = ReferenceModel(
       email: element.emailController.text,
       name: element.nameController.text,
       company: element.companyController.text,
       role: element.roleController.text,
       phone: element.phoneController.text,
      );
      AppRepo.referenceModel.add(referenceModel);

      print(AppRepo.referenceModel);
    });
  }

  addNew()=> setState(() => listText.add(ReferenceItem()));
  remove(int index)=> setState(() => listText.removeAt(index));
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reference'),
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 10,),
             ReorderableListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: _getReorderableListItems(),
                onReorder: _updateItems,
              ),
            SizedBox(height: 10,),
              footerButtons(
                onAddTap: addNew, onSaveAdd: saveText
              ),
          ],),
        ),
      ),
    );
  }
   List<Widget> _getReorderableListItems() => listText
      .asMap()
      .map((i, item) => MapEntry(i, _buildExperienceList(item, i)))
      .values
      .toList();

  Dismissible _buildExperienceList(ReferenceItem item, int index) {
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

class ReferenceItem extends StatelessWidget{
final  ReferenceModel model;
  ReferenceItem({this.model});
    final TextEditingController nameController = new TextEditingController();
    final TextEditingController roleController = new TextEditingController();
    final TextEditingController companyController = new TextEditingController();
    final TextEditingController emailController = new TextEditingController();
    final TextEditingController phoneController = new TextEditingController();
      updateText(){
      if(model!=null){
        nameController.text = model.name??'';
      roleController.text = model.role??'';
      companyController.text = model.company??'';
      emailController.text = model.email??'';
      phoneController.text= model.phone??'';

      }
      
    }
    @override
    Widget build(BuildContext context) {
      return   Column(
                children: [
                  cardDesign(
                  child:  Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Column(
                           children: [
                            text('Referee\'s name', controller: nameController ),
                           text('Job Title', controller: roleController),
                            text('Company', controller: companyController),
                             text('Email', controller: emailController, input: TextInputType.emailAddress),
                       text('Phone number', controller: phoneController,input: TextInputType.phone),

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
