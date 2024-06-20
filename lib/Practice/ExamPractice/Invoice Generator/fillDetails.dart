import 'package:flutter/material.dart';
import 'package:practice_of_lecture/Practice/ExamPractice/Invoice%20Generator/global.dart';

class FillDetails extends StatefulWidget {
  const FillDetails({super.key});

  @override
  State<FillDetails> createState() => _FillDetailsState();
}

class _FillDetailsState extends State<FillDetails> {
  void initState(){
    setState(() {
      txtName = TextEditingController();
      txtProduct = TextEditingController();
      txtPrice = TextEditingController();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          backgroundColor: Colors.blue,
          toolbarHeight: 70,
          centerTitle: true,
          title: const Text(
            'Fill Details',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: Column(
              children: [
                //todo ----------------->  Name
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field Must be Required';
                    }
                  },
                  controller: txtName,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xffb0b0b0))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 2, color: Color(0xffb0b0b0))),
                    label: Text('Customer Name'),
                  ),
                ),
                SizedBox(height: 15),
                //todo ----------------->  Product
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field Must be Required';
                    }
                  },
                  controller: txtProduct,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xffb0b0b0))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 2, color: Color(0xffb0b0b0))),
                    label: Text('Product Name'),
                  ),
                ),
                //todo ----------------->  Price
                SizedBox(height: 15),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field Must be Required';
                    }
                  },
                  controller: txtPrice,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xffb0b0b0))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 2, color: Color(0xffb0b0b0))),
                    label: Text('Product Price'),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ctrlList.add({
                          'name': txtName,
                          'product': txtProduct,
                          'price': txtPrice
                        });
                        Navigator.of(context).pushNamed('/');
                      }
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
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
