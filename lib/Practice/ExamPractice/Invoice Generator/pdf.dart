import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import 'global.dart';

class Pdf extends StatefulWidget {
  const Pdf({super.key});

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          },icon: Icon(Icons.arrow_back), color: Colors.white),
          backgroundColor: Colors.blue,
          toolbarHeight: 70,
          centerTitle: true,
          title: const Text(
            'Invoice Generator App',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: PdfPreview(
          build: (format) => generatePdf(),
        ),
      ),
    );
  }
}

Future<Uint8List> generatePdf() {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        children: [
          pw.Table(
            border: pw.TableBorder.all(color: PdfColors.black, width: 2),
            defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
            columnWidths: {
              0: const pw.FixedColumnWidth(110),
              1: const pw.FixedColumnWidth(60),
              2: const pw.FixedColumnWidth(60),
            },
            children: [
              pw.TableRow(
                children: [
                  pw.Padding(
                      padding: pw.EdgeInsets.all(16),
                      child: pw.Text('Customer Name',
                          style: pw.TextStyle(fontSize: 23))),
                  pw.Padding(
                      padding: pw.EdgeInsets.all(16),
                      child: pw.Text('Product Name',
                          style: pw.TextStyle(fontSize: 23))),
                  pw.Padding(
                      padding: pw.EdgeInsets.all(16),
                      child: pw.Text('Product Price',
                          style: pw.TextStyle(fontSize: 23))),
                ],
              ),
              ...List.generate(
                  ctrlList.length,
                      (index) => pw.TableRow(
                        children: [
                          pw.Padding(
                            padding: pw.EdgeInsets.all(10),
                            child: pw.Text(ctrlList[index]['name'].text,style: pw.TextStyle(fontSize: 17))
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.all(10),
                            child: pw.Text(ctrlList[index]['product'].text,style: pw.TextStyle(fontSize: 17)),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.all(10),
                            child: pw.Text(ctrlList[index]['price'].text,style: pw.TextStyle(fontSize: 17))
                          ),
                        ],
                      )),
            ],
          ),
        ],
      ),
    ),
  );
  return pdf.save();
}
