
// import 'package:flutter/material.dart';
// import 'package:resume_builder/models/projects_model.dart';
// import '../../database/repo.dart';
// import '../widgets.dart';

// class Projects extends StatefulWidget {
//   @override
//   _ProjectsState createState() => _ProjectsState();
// }

// class _ProjectsState extends State<Projects> {
//   List<ProjectsItem> listText = [];
//  List<ProjectsModel> modelList = AppRepo.projectsModel;
  
//   @override
//   initState(){
//     updateList();
//     super.initState();
//   }

//   updateList(){
//     if(modelList!=null){
//       modelList.forEach((element) {
//         listText.add(ProjectsItem(model: element,) );
        
//       });
//     }else{
//       addNew();
//     }

//   }

  

  

//   saveText(){
//     AppRepo.projectsModel=[];
//     listText.forEach((element) {
//      final projectsModel = ProjectsModel(
//         title: element.titleController.text,
//         startDate: element.startDateController.text,
//         endDate: element.endDateController.text,
//         summary: element.summaryController.text,
//       );
//       AppRepo.projectsModel.add(projectsModel);

//       print(AppRepo.projectsModel);
//     });
//   }

//   addNew()=> setState(() => listText.add(ProjectsItem()));
//   remove(int index)=> setState(() => listText.removeAt(index));
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Projects'),
       
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child:  SingleChildScrollView(
//           child: Column(children: [
//             SizedBox(height: 10,),
//              ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: listText.length,
//               itemBuilder: (BuildContext context, int index){
//               return   Dismissible(
//                 key: UniqueKey(), 
//                 background: Container(
//                   color: Colors.red,
//                 ),
//                 onDismissed: (direction){
//                   remove(index);
//                 },
//                 child: listText[index]);

//             }),
//               SizedBox(height: 10,),
//               footerButtons(
//                 onAddTap: addNew, onSaveAdd: saveText
//               ),
//           ],),
//         ),
//       ),
//     );
//   }
// }

// class ProjectsItem extends StatelessWidget{
//   final ProjectsModel model;
//   ProjectsItem({this.model});

//     final TextEditingController titleController = new TextEditingController();
//     final TextEditingController startDateController = new TextEditingController();
//     final TextEditingController endDateController = new TextEditingController();
//     final TextEditingController summaryController = new TextEditingController();

//       updateText(){
//       if(model!=null){
//         titleController.text = model.title??'';
//       startDateController.text = model.startDate??'';
//       endDateController.text = model.endDate??'';
//       summaryController.text= model.summary??'';

//       }
      
//     }


//     @override
//     Widget build(BuildContext context) {
//       updateText();
//       return   Column(
//                 children: [
//                 cardDesign(
//             child:  Padding(
//                    padding: const EdgeInsets.all(10.0),
//                    child: Column(
//                      children: [
//                        text('Title', controller: titleController),
//                      Row(
//                        children: [
//                          Expanded(child: text('Start Date',controller: startDateController, input: TextInputType.datetime)),
//                          SizedBox(width: 5,),
//                         Expanded(child: text('End date',controller: endDateController,  input: TextInputType.datetime)),
//                        ],
//                      ),
                    
//                      text('Description', controller: summaryController, lines: 3, input: TextInputType.multiline),

//                       SizedBox(height: 10,),

//                      ],
//                    ),
//                  ),
//           ),
//                         SizedBox(height: 15,),
//                 ],
//               );
//     }

// }