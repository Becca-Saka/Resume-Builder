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
    name = TextEditingController();
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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 35.0),
              child: Center(
                child: GestureDetector(
                  onTap: pickImage,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage: imagePath != null
                            ? FileImage(File(imagePath))
                            : null,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.grey[200].withOpacity(0.2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            customTextField('Full Name', name),
            customTextField('Profession', proff),
            customTextField('Phone Number', numb, input: TextInputType.number),
            customTextField('Email Address', email,
                input: TextInputType.emailAddress),
            customTextField('Address', address,
                input: TextInputType.streetAddress),
            customTextField('Website', web, input: TextInputType.url),
            customTextField('About you', about,
                lines: 3, input: TextInputType.multiline),
            SizedBox(
              height: 20,
            ),
            singlefooterButtons(onSaveTap: onSave),
          ],
        ),
      ),
    );
  }

  Widget customTextField(String hint, TextEditingController controller,
      {TextInputType input, int lines=1 }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(hint, controller: controller, lines: lines, input: input),
        SizedBox(
          height: 18,
        ),
      ],
    );
  }

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imagePath = _image.path;
      }
    });
  }

  updateDetails() {
    name.text = AppRepo.fullName ?? '';
    numb.text = AppRepo.phoneNumber ?? '';
    email.text = AppRepo.email ?? '';
    address.text = AppRepo.address ?? '';
    proff.text = AppRepo.profession ?? '';
    about.text = AppRepo.about ?? '';
    web.text = AppRepo.website ?? '';
    imagePath = AppRepo.imagePath;
  }

  void onSave() {
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
