import 'package:flutter/material.dart';
import 'global.dart';
import 'idcard.dart';

class ShowCard extends StatefulWidget {
  const ShowCard({super.key});

  @override
  State<ShowCard> createState() => _ShowCardState();
}

class _ShowCardState extends State<ShowCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
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
            padding: const EdgeInsets.fromLTRB(12, 18, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundImage:
                        (fileImage != null) ? FileImage(fileImage!) : null,
                    radius: 70,
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Row(
                    children: [
                      Text(
                        'Name       : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 190,
                        child: Text(
                          '${txtName.text}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 72),
                  child: Row(
                    children: [
                      Text(
                        'Gender     : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 190,
                        child: Text(
                          gender,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 72),
                  child: Row(
                    children: [
                      Text(
                        'Birthdate : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 190,
                        child: Text(
                          '${txtBirthdate.text}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address   : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 190,
                        child: Text(
                          '${txtAddress.text}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 72),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'hobby       : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 190,
                        child: Text(
                          hobby,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
