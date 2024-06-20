import 'package:flutter/material.dart';
import 'global.dart';

class Editpage extends StatefulWidget {
  const Editpage({super.key});

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.blue),
        backgroundColor: Colors.blue,
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text(
          'Edit Invoice',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //todo ----------------->  Name
            TextFormField(
              textInputAction:
              TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field Must be Required';
                }
              },
              controller:txtName,
              decoration: InputDecoration(
                enabledBorder:
                OutlineInputBorder(
                    borderRadius:
                    BorderRadius
                        .circular(10),
                    borderSide: BorderSide(
                        width: 1,
                        color: Color(
                            0xffb0b0b0))),
                focusedBorder:
                OutlineInputBorder(
                    borderRadius:
                    BorderRadius
                        .circular(10),
                    borderSide: BorderSide(
                        width: 2,
                        color: Color(
                            0xffb0b0b0))),
                label: Text('Customer Name'),
              ),
            ),
            SizedBox(height: 15),
            //todo ----------------->  Product
            TextFormField(
              textInputAction:
              TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field Must be Required';
                }
              },
              controller:txtProduct,
              decoration: InputDecoration(
                enabledBorder:
                OutlineInputBorder(
                    borderRadius:
                    BorderRadius
                        .circular(10),
                    borderSide: BorderSide(
                        width: 1,
                        color: Color(
                            0xffb0b0b0))),
                focusedBorder:
                OutlineInputBorder(
                    borderRadius:
                    BorderRadius
                        .circular(10),
                    borderSide: BorderSide(
                        width: 2,
                        color: Color(
                            0xffb0b0b0))),
                label: Text('Product Name'),
              ),
            ),
            //todo ----------------->  Price
            SizedBox(height: 15),
            TextFormField(
              textInputAction:
              TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field Must be Required';
                }
                return null;
              },
              controller:txtPrice,
              decoration: InputDecoration(
                enabledBorder:
                OutlineInputBorder(
                    borderRadius:
                    BorderRadius
                        .circular(10),
                    borderSide: BorderSide(
                        width: 1,
                        color: Color(
                            0xffb0b0b0))),
                focusedBorder:
                OutlineInputBorder(
                    borderRadius:
                    BorderRadius
                        .circular(10),
                    borderSide: BorderSide(
                        width: 2,
                        color: Color(
                            0xffb0b0b0))),
                label: Text('Product Price'),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  if (formKey.currentState!
                      .validate()) {
                    ctrlList[selectedIndex]['name'].text = txtName.text;
                    ctrlList[selectedIndex]['product'].text = txtProduct.text;
                    ctrlList[selectedIndex]['price'].text = txtPrice.text;
                    Navigator.of(context).pushNamed('/');
                  }
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
