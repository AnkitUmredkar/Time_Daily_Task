import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practice_of_lecture/Practice/ExamPractice/Invoice%20Generator/global.dart';

class InvoiceHomePage extends StatefulWidget {
  const InvoiceHomePage({super.key});

  @override
  State<InvoiceHomePage> createState() => _InvoiceHomePageState();
}

class _InvoiceHomePageState extends State<InvoiceHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back, color: Colors.blue),
          backgroundColor: Colors.blue,
          toolbarHeight: 70,
          centerTitle: true,
          title: const Text(
            'Invoice Generator App',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Filter your expence',
                        style: TextStyle(fontSize: 24),
                      ),
                      //todo -----------------> Filter
                      RangeSlider(
                          min: 0,
                          max: 1000,
                          divisions: 50,
                          activeColor: Colors.blue,
                          labels: RangeLabels(startValue.toInt().toString(),
                              endValue.toInt().toString()),
                          values: RangeValues(startValue, endValue),
                          onChanged: (value) {
                            setState(() {
                              startValue = value.start;
                              endValue = value.end;
                            });
                          }),
                      //todo -----------------> List
                      RepaintBoundary(
                        key: imgKey,
                        child: Container(
                          child: Column(
                            children: [
                              ...List.generate(
                                ctrlList.length,
                                (index) => (double.parse(
                                                ctrlList[index]
                                                        ['price']
                                                    .text) >=
                                            startValue &&
                                        double.parse(
                                                ctrlList[index]
                                                        ['price']
                                                    .text) <=
                                            endValue)
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                            Container(
                                              width: 295,
                                              child: ListTile(
                                                  title: Text(
                                                    ctrlList[index]['name']
                                                        .text,
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                  subtitle: Text(
                                                      ctrlList[index]['product']
                                                          .text,
                                                      style: TextStyle(
                                                          fontSize: 18)),
                                                  trailing: Text(
                                                      ctrlList[index]['price']
                                                          .text,
                                                      style: TextStyle(
                                                          fontSize: 18))),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                //todo-----------------> Edit Button
                                                IconButton(
                                                    onPressed: () {
                                                      selectedIndex = index;
                                                      txtName.text = ctrlList[
                                                                  selectedIndex]
                                                              ['name']
                                                          .text;
                                                      txtProduct
                                                          .text = ctrlList[
                                                                  selectedIndex]
                                                              ['product']
                                                          .text;
                                                      txtPrice.text = ctrlList[
                                                                  selectedIndex]
                                                              ['price']
                                                          .text;
                                                      Navigator.of(context)
                                                          .pushNamed(
                                                              '/editDetails');
                                                    },
                                                    icon: Icon(Icons.edit)),
                                                //todo-----------------> Delete Button
                                                IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        ctrlList
                                                            .removeAt(index);
                                                      });
                                                    },
                                                    icon: Icon(Icons.delete)),
                                              ],
                                            ),
                                          ])
                                    : SizedBox(),
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed('/pdf');
              },
              child: Icon(
                Icons.picture_as_pdf_outlined,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 14,
            ),
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () async {
                RenderRepaintBoundary boundary = imgKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
                ui.Image image = await boundary.toImage();
                ByteData byteData = await (image.toByteData);




















                // RenderRepaintBoundary boundary = imgKey.currentContext!
                //     .findRenderObject() as RenderRepaintBoundary;
                // ui.Image image = await boundary.toImage();
                // ByteData? byteData =
                //     await (image.toByteData(format: ui.ImageByteFormat.png));
                // Uint8List img = byteData!.buffer.asUint8List();
                // ImageGallerySaver.saveImage(img);
                Fluttertoast.showToast(
                  msg: 'Image Saved Successfully',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16,
                );
              },
              child: Icon(
                Icons.download,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 14,
            ),
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed('/fillDetails');
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int count = 0;
