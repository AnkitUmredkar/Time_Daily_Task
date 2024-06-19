import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_of_lecture/Practice/ExamPractice/ID%20Card/global.dart';

ImagePicker imagePicker = ImagePicker();
File? fileImage;
XFile? xFilImage;

class Idcard extends StatefulWidget {
  const Idcard({super.key});

  @override
  State<Idcard> createState() => _IdcardState();
}

class _IdcardState extends State<Idcard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          toolbarHeight: 70,
          centerTitle: true,
          title: const Text(
            'Id Card For Exam',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Registration Form',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 200,
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () async{
                                        xFilImage =
                                        await imagePicker.pickImage(
                                            source: ImageSource.gallery);
                                        fileImage = File(xFilImage!.path);
                                      setState(() {});
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.photo),
                                      title: Text('Gallery'),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async{
                                        xFilImage =
                                            await imagePicker.pickImage(
                                            source: ImageSource.camera);
                                        fileImage = File(xFilImage!.path);
                                        setState(() {});
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.camera),
                                      title: Text('Camera'),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if(fileImage != null){
                                        fileImage = null;
                                      }
                                      setState(() {});
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.close),
                                      title: Text('Remove photo'),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: CircleAvatar(
                      backgroundImage:
                          (fileImage != null) ? FileImage(fileImage!) : null,
                      radius: 70,
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: txtName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xffd1d1d1),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Color(0xffb0b0b0),
                          )),
                      label: const Text('Student Name'),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: txtAddress,
                    maxLines: 2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xffd1d1d1),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Color(0xffb0b0b0),
                          )),
                      hintText: 'Enter Address',
                      hintStyle: const TextStyle(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // todo ---------------------------> Birth date
                  GestureDetector(
                    onTap: () {
                      setState(() async {
                        DateTime? datePicked = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: DateTime.now(),
                            lastDate: DateTime.now());
                        if (datePicked != null) {
                          String date =
                              '${datePicked.day}/${datePicked.month}/${datePicked.year}';
                          txtBirthdate.text = date;
                        }
                      });
                    },
                    child: AbsorbPointer(
                      absorbing: true,
                      child: TextFormField(
                        controller: txtBirthdate,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xffd1d1d1),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xffb0b0b0),
                              )),
                          hintText: 'Enter Birthdate',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  // todo ---------------------------> Gender
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child:
                            Text('Gender : ', style: TextStyle(fontSize: 18)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio(
                                    value: 'Male',
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value!;
                                      });
                                    }),
                                const Text('Male',
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: 'FeMale',
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value!;
                                      });
                                    }),
                                const Text('FeMale',
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: 'Other',
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value!;
                                      });
                                    }),
                                const Text('Other',
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  // todo ---------------------------> Hobbies
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child:
                            Text('Hobbies : ', style: TextStyle(fontSize: 18)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 62),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value: read,
                                    onChanged: (value) {
                                      setState(() {
                                        read = value!;
                                        if(read && !hobbies.contains('Reading')){
                                          hobbies.add('Reading');
                                        }
                                        else{
                                          hobbies.remove('Reading');
                                        }
                                      });
                                    }),
                                const Text('Reading',
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: play,
                                    onChanged: (value) {
                                      setState(() {
                                        play = value!;
                                        if(read && !hobbies.contains('Playing')){
                                          hobbies.add('Playing');
                                        }
                                        else{
                                          hobbies.remove('Playing');
                                        }
                                      });
                                    }),
                                const Text('Playing',
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: dance,
                                    onChanged: (value) {
                                      setState(() {
                                        dance = value!;
                                        if(read && !hobbies.contains('Dancing')){
                                          hobbies.add('Dancing');
                                        }
                                        else{
                                          hobbies.remove('Dancing');
                                        }
                                      });
                                    }),
                                const Text('Dancing',
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/show');
                      hobby = '';
                      for(int i=0; i<hobbies.length; i++){
                        hobby = hobby + ' ${hobbies[i]}\n';
                      }
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 40),
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue),
                      child: Text(
                        'Generate ID Card',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
