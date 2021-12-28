import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../database/repo.dart';
import '../widgets.dart';


class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController name, proff, numb, email, address, web, about;
  String imagePath;
  File _image;
  final picker = ImagePicker();
  @override
    void initState() {
      name =TextEditingController();
       proff = TextEditingController();
        numb = TextEditingController();
         email = TextEditingController();
          address = TextEditingController();
           web = TextEditingController();
            about = TextEditingController();
            updateDetails();
      super.initState();
    }
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Personal Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [

          Padding(
            padding: const EdgeInsets.only(top:  15, bottom: 15),
            child: Center(
              child:GestureDetector(
                    onTap: pickImage,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: imagePath!=null? FileImage(File(imagePath)):null,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.grey[200].withOpacity(0.2),
                      ),
                      
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.camera_alt, color: Colors.white,),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
           text('Full Name', controller: name),
            text('Profession', controller: proff),
            text('Phone Number',controller: numb, input: TextInputType.number),
             text('Email Address',controller: email, input: TextInputType.emailAddress),
             text('Address', controller: address, input: TextInputType.streetAddress),
              text('Website', controller: web, input: TextInputType.url),
             text('About you',controller: about, lines: 3, input: TextInputType.multiline),

              SizedBox(height: 20,),
             singlefooterButtons(onSaveTap: onSave),
             
             

          
        ],),
      ),
    );
  }

 Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imagePath = _image.path;
      } else {
        print('No image selected.');
      }
    });
  }
  updateDetails(){
    name.text= AppRepo.fullName??'';
    numb.text = AppRepo.phoneNumber??'';
    email.text =  AppRepo.email??'';
    address.text =AppRepo.address??'';
    proff.text=AppRepo.profession??'';
    about.text=AppRepo.about??'';
    web.text=AppRepo.website??'';
    imagePath = AppRepo.imagePath;

  }

  void onSave(){
    AppRepo.fullName = name.text;
    AppRepo.phoneNumber = numb.text;
    AppRepo.email = email.text;
    AppRepo.address = address.text;
    AppRepo.profession = proff.text;
    AppRepo.about = about.text;
    AppRepo.website = web.text;
    AppRepo.imagePath = imagePath;
  }
}
