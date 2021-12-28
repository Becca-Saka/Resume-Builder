import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'templates.dart';


class Preview extends StatefulWidget {
  final int index;
  Preview(this.index);

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  pw.Font ttf,
      lora,
      headerFont,
      barlow,
      barlowRegular,
      lato,
      aleo,
      monsarat,
      monsaratLight,
      hkLight,
      hk;
  int index;
  pw.Document pdf;
      

  @override
  void initState() {
    index = widget.index;
    loadFont();
    super.initState();
  }


  pw.Widget templateText(String text, double size, {pw.Font font}) {
    return pw.Text(
      text,
      style: pw.TextStyle(
        fontSize: size,
        font: font,
      ),
    );
  }

  Future<bool> checkPermission() async {
    return Permission.storage.isGranted;
  }

  Future<PermissionStatus> requestPermision() async {
    return Permission.storage.request();
  }


  savePdf() async {
    final directoryName = 'Resume Builder';
    DateTime dateTime = DateTime.now();
    if (!(await checkPermission())) await requestPermision();
    String path = '/storage/emulated/0/$directoryName';
    final dir = Directory(path);
    if (!dir.existsSync()) {
      await dir.create(recursive: true);
    }
    final String filePath = '$path/Res${dateTime.microsecond}.pdf';
    print(filePath);
    File(filePath).writeAsBytesSync(await pdf.save());
    print('Done');
  }

  loadFont() async {
    try {
      ttf = pw.Font.ttf(await rootBundle
          .load("assets/fonts/GlacialIndifference-Regular.ttf"));
      lora = pw.Font.ttf(await rootBundle.load("assets/fonts/Lora-Medium.ttf"));
      headerFont = pw.Font.ttf(
          await rootBundle.load("assets/fonts/GlacialIndifference-Bold.ttf"));
      barlow =
          pw.Font.ttf(await rootBundle.load("assets/fonts/Barlow-Medium.ttf"));
      barlowRegular =
          pw.Font.ttf(await rootBundle.load("assets/fonts/Barlow-Regular.ttf"));
      aleo = pw.Font.ttf(await rootBundle.load("assets/fonts/Aleo-Bold.ttf"));
      lato = pw.Font.ttf(await rootBundle.load("assets/fonts/Lato-Light.ttf"));
      monsarat = pw.Font.ttf(
          await rootBundle.load("assets/fonts/Montserrat-Medium.ttf"));
      monsaratLight = pw.Font.ttf(
          await rootBundle.load("assets/fonts/Montserrat-Regular.ttf"));
      hk =
          pw.Font.ttf(await rootBundle.load("assets/fonts/HkGrotesk-Bold.ttf"));
      hkLight = pw.Font.ttf(
          await rootBundle.load("assets/fonts/HkGrotesk-Light.ttf"));
    } catch (e) {
      print(e);
    }
  }

  Widget viewPDF() {
    pdf = pw.Document();
   

    pdf.addPage(pw.Page(
        margin: pw.EdgeInsets.zero,
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          switch (index) {
            case 1:
              return Temp1(
                barlow,
                barlowRegular,
              );
              break;
            case 2:
              return Temp2(
                hk,
                lora,
              );
              break;
            case 3:
              return Temp3(lato, aleo);
              break;
            case 4:
              return Temp4(monsarat, monsaratLight);
              break;
            case 5:
              return Temp5(hk, hkLight);
              break;
            case 6:
              return Temp6(ttf, lora, headerFont);
              break;
          }
          return Temp1(barlow, barlowRegular);
        }));
    print(pdf.document.pdfPageList.pages.length);

    return PdfPreview(
      useActions: false,
      build: (format) => pdf.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: savePdf,
          ),
        ],
      ),
      body: viewPDF(),
    );
  }
}