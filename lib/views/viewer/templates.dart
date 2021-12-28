import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../database/repo.dart';
import '../widgets.dart';

class Temp1 extends pw.StatelessWidget {
  pw.Font barlow, barlowRegular;
  Temp1(this.barlow, this.barlowRegular);
  PdfColor color = PdfColor.fromHex('166ab8');
  PdfColor borderColor = PdfColor.fromHex('6B6B6B');
  PdfColor textColor = PdfColor.fromHex('444440');

  double nameSize = 22,
      textSize = 16,
      headerSize = 14,
      roleSize = 12,
      headerspacing = 4,
      letterSpacing = 2;
  double imageWidth = 120, imageHeight = 120;

  @override
  pw.Widget build(pw.Context context) {
    print(AppRepo.experienceModel);
    final width = context.page.pageFormat.availableWidth;
    return pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
      pw.Container(
        width: 40,
        height: double.infinity,
        color: color,
      ),
      pw.Padding(
          padding: pw.EdgeInsets.symmetric(horizontal: 50, vertical: 60),
          child: pw.Container(
            width: width - 70,
            child: pw
                .Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
              pw.Expanded(
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Center(
                              child: pw.Container(
                                  width: imageWidth,
                                  height: imageWidth,
                                  color: color,
                                  child: AppRepo.imagePath != null
                                      ? pw.Image(
                                          pw.MemoryImage(File(AppRepo.imagePath)
                                              .readAsBytesSync()),
                                          fit: pw.BoxFit.cover)
                                      : null),
                            ),
                            pw.SizedBox(height: 20),
                            pw.Text(
                              toUpperCase(AppRepo.fullName ?? 'No Name'),
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                  fontSize: nameSize,
                                  font: barlow,
                                  letterSpacing: letterSpacing,
                                  color: color,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                            pw.SizedBox(height: 5),
                            pw.Text(
                              toUpperCase('${AppRepo.profession}'),
                              style: pw.TextStyle(
                                fontSize: roleSize,
                                font: barlow,
                                letterSpacing: letterSpacing,
                              ),
                            ),
                          ]),
                      visibility(
                        condition: AppRepo.about != null,
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.SizedBox(height: 30),
                              header('CAREER GOALS'),
                              pw.SizedBox(height: 10),
                              text('${AppRepo.about}'),
                            ]),
                      ),
                      visibility(
                        condition: AppRepo.skillsModel != null,
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.SizedBox(height: 30),
                              header('MAIN INTRESTS'),
                              pw.SizedBox(height: 10),
                              pw.ListView(
                                  children: AppRepo.skillsModel
                                      .map((e) => textIcon(e.title,
                                          pw.IconData(Icons.check.codePoint)))
                                      .toList()),
                            ]),
                      ),
                      visibility(
                        condition: AppRepo.phoneNumber != null ||
                            AppRepo.website != null ||
                            AppRepo.email != null ||
                            AppRepo.address != null,
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.SizedBox(height: 30),
                              header('REACH ME AT'),
                              pw.ListView(
                                children: [
                                  textIcon(AppRepo.phoneNumber,
                                      Icons.phone.codePoint),
                                  textIcon(AppRepo.website,
                                      Icons.computer.codePoint),
                                  textIcon(
                                      AppRepo.email, Icons.email.codePoint),
                                  textIcon(AppRepo.address,
                                      Icons.location_city.codePoint),
                                ],
                              ),
                              pw.SizedBox(height: 10),
                              visibility(
                                condition: AppRepo.referenceModel != null,
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.SizedBox(height: 30),
                                      header('REFEREES'),
                                      pw.SizedBox(height: 10),
                                      pw.ListView(
                                          children: AppRepo.referenceModel
                                              .map((e) => pw.Column(
                                                      crossAxisAlignment: pw
                                                          .CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        pw.Text(e.name,
                                                            style: pw.TextStyle(
                                                                fontSize:
                                                                    textSize,
                                                                font: barlow,
                                                                color:
                                                                    textColor)),
                                                        text('${e.company}'),
                                                        text('${e.phone}'),
                                                        text(e.email),
                                                      ]))
                                              .toList()),
                                    ]),
                              ),
                            ]),
                      ),
                    ]),
              ),
              pw.SizedBox(width: 35),
              pw.Expanded(
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      visibility(
                        condition: AppRepo.educationModel != null,
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.SizedBox(height: 30),
                              header('ACADEMIC HISTORY'),
                              pw.SizedBox(height: 10),
                              pw.ListView(
                                  children: AppRepo.educationModel
                                      .map((e) => pw.Column(
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.start,
                                              children: [
                                                pw.Text(e.college,
                                                    style: pw.TextStyle(
                                                        fontSize: textSize,
                                                        font: barlow,
                                                        color: textColor)),
                                                text(
                                                    '${e.degree}| ${e.startDate} - ${e.endDate}'),
                                                text(e.summary),
                                              ]))
                                      .toList()),
                            ]),
                      ),
                      pw.SizedBox(height: 30),
                      visibility(
                        condition: AppRepo.experienceModel != null,
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.SizedBox(height: 30),
                              header('CAREER HISTORY'),
                              pw.SizedBox(height: 10),
                              pw.ListView(
                                  children: AppRepo.experienceModel
                                      .map((e) => pw.Column(
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.start,
                                              children: [
                                                pw.Text(e.role,
                                                    style: pw.TextStyle(
                                                        fontSize: textSize,
                                                        font: barlow,
                                                        color: textColor)),
                                                text(
                                                    '${e.company}| ${e.startDate} - ${e.endDate}'),
                                                text(e.summary),
                                              ]))
                                      .toList()),
                            ]),
                      ),
                      pw.SizedBox(height: 30),
                      visibility(
                        condition: AppRepo.achievements != null,
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.SizedBox(height: 30),
                              header('ACHIEVEMENTS'),
                              pw.SizedBox(height: 10),
                              text('${AppRepo.achievements}'),
                            ]),
                      ),
                    ]),
              ),
            ]),
          ))
    ]);
  }

  pw.Widget header(String text) {
    return pw.Container(
      decoration: pw.BoxDecoration(
          border: pw.Border(
              top: pw.BorderSide(color: borderColor),
              bottom: pw.BorderSide(color: borderColor))),
      child: pw.Padding(
        padding: pw.EdgeInsets.symmetric(vertical: 5),
        child: pw.Row(children: [
          pw.Text(
            toUpperCase(text),
            style: pw.TextStyle(
                fontSize: headerSize,
                font: barlow,
                color: color,
                fontWeight: pw.FontWeight.bold),
          ),
          pw.Spacer(),
        ]),
      ),
    );
  }

  pw.Widget text(String text) {
    return pw.Text(
      text,
      textAlign: pw.TextAlign.left,
      style: pw.TextStyle(
          fontSize: textSize, font: barlowRegular, color: textColor),
    );
  }

  updateFont() {}

  pw.Widget textIcon(String text, icon) {
    return visibility(
        condition: text != null,
        child: pw.Row(children: [
          //TODO:ADD icons from material Icons
          // pw.Icon( pw.IconData(icon)),
          pw.Text(
            text,
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
                fontSize: textSize, font: barlowRegular, color: textColor),
          )
        ]));
  }
}

class Temp2 extends pw.StatelessWidget {

  pw.Font hk, barlowRegular;
  Temp2(this.hk, this.barlowRegular);
  PdfColor color = PdfColor.fromHex('000000');
  PdfColor borderColor = PdfColor.fromHex('6B6B6B');
  PdfColor textColor = PdfColor.fromHex('444440');

  double nameSize = 24,
      textSize = 16,
      headerSize = 18,
      roleSize = 18,
      headerspacing = 4,
      letterSpacing = 2;
  double imageWidth = 120, imageHeight = 120;

  @override
  pw.Widget build(pw.Context context) {
    final width = context.page.pageFormat.availableWidth;
    final boxWidth = width / 2.5;
    return pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
      pw.Container(
          width: boxWidth,
          height: double.infinity,
          color: color,
          child: pw.Padding(
              padding: pw.EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Transform.rotate(
                      angle: pi / 2,
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.SizedBox(height: 20),
                            pw.Text(
                              toUpperCase(AppRepo.fullName ?? 'No name'),
                              style: pw.TextStyle(
                                  fontSize: nameSize,
                                  font: hk,
                                  letterSpacing: letterSpacing,
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Text(
                              toUpperCase('${AppRepo.profession}'),
                              style: pw.TextStyle(
                                fontSize: roleSize,
                                font: hk,
                                color: PdfColors.white,
                                letterSpacing: letterSpacing,
                              ),
                            ),
                          ]),
                    ),
                    pw.Spacer(),
                    visibility(
                        condition: AppRepo.phoneNumber != null ||
                            AppRepo.website != null ||
                            AppRepo.email != null ||
                            AppRepo.address != null,
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              headerBlack('CONTACT'),
                              pw.SizedBox(height: 20),
                              textBlack(AppRepo.phoneNumber),
                              textBlack(AppRepo.website),
                              textBlack(AppRepo.email),
                              textBlack(AppRepo.address),
                              pw.SizedBox(height: 10),
                            ])),
                    visibility(
                      condition: AppRepo.referenceModel != null,
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.SizedBox(height: 30),
                            headerBlack('REFEREES'),
                            pw.SizedBox(height: 10),
                            pw.ListView(
                                children: AppRepo.referenceModel
                                    .map((e) => pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            children: [
                                              pw.Text(e.name,
                                                  style: pw.TextStyle(
                                                      fontSize: textSize,
                                                      font: hk,
                                                      color: PdfColors.white)),
                                              textBlack('${e.company}'),
                                              textBlack('${e.phone}'),
                                              textBlack('${e.email}'),
                                            ]))
                                    .toList()),
                          ]),
                    ),
                  ]))),
      pw.Padding(
        padding: pw.EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        child: pw.Container(
          width: width - boxWidth,
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                visibility(
                  condition: AppRepo.about != null,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 30),
                        header('ABOUT ME'),
                        pw.SizedBox(height: 10),
                        text('${AppRepo.about}'),
                      ]),
                ),
                visibility(
                  condition: AppRepo.educationModel != null,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 30),
                        header('EDUCATION'),
                        pw.SizedBox(height: 10),
                        pw.ListView(
                            children: AppRepo.educationModel
                                .map((e) => pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Text(toUpperCase(e.college),
                                              style: pw.TextStyle(
                                                  fontSize: textSize,
                                                  font: hk,
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  color: textColor)),
                                          text(
                                              '${e.degree} | ${e.startDate} - ${e.endDate}'),
                                          text(e.summary),
                                        ]))
                                .toList()),
                      ]),
                ),
                visibility(
                  condition: AppRepo.experienceModel != null,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 30),
                        header('EXPERIENCE'),
                        pw.SizedBox(height: 10),
                        pw.ListView(
                            children: AppRepo.experienceModel
                                .map((e) => pw.Row(
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Text(
                                              '${e.startDate} - ${e.endDate}',
                                              style: pw.TextStyle(
                                                  fontSize: textSize,
                                                  font: hk,
                                                  fontWeight:
                                                      pw.FontWeight.bold,
                                                  color: textColor)),
                                          pw.SizedBox(width: 25),
                                          pw.Column(
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.start,
                                              children: [
                                                pw.Text(e.role,
                                                    style: pw.TextStyle(
                                                        fontSize: textSize,
                                                        font: hk,
                                                        fontWeight:
                                                            pw.FontWeight.bold,
                                                        color: textColor)),
                                                text('${e.company}'),
                                                text(e.summary),
                                              ])
                                        ]))
                                .toList()),
                      ]),
                ),
                visibility(
                  condition: AppRepo.achievements != null,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 30),
                        header('ACHIEVEMENTS'),
                        pw.SizedBox(height: 10),
                        text('${AppRepo.achievements}'),
                      ]),
                ),
                visibility(
                  condition: AppRepo.skillsModel != null,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 30),
                        header('SKILLS'),
                        pw.SizedBox(height: 10),
                        pw.ListView(
                            children: AppRepo.skillsModel
                                .map((e) => textIcon(e.title, e.level))
                                .toList()),
                      ]),
                ),
              ]),
        ),
      ),
    ]);
  }

  pw.Widget header(String text) {
    return pw.Text(
      text,
      style: pw.TextStyle(
          font: hk, fontSize: headerSize, fontWeight: pw.FontWeight.bold),
    );
  }

  pw.Widget headerBlack(String text) {
    return pw.Text(
      text,
      style: pw.TextStyle(
          color: PdfColors.white,
          font: hk,
          fontSize: headerSize,
          fontWeight: pw.FontWeight.bold),
    );
  }

  pw.Widget textBlack(String text) {
    return pw.Padding(
        padding: pw.EdgeInsets.symmetric(vertical: 1),
        child: pw.Text(
          text,
          textAlign: pw.TextAlign.left,
          style: pw.TextStyle(
            fontSize: textSize,
            font: barlowRegular,
            color: PdfColors.white,
          ),
        ));
  }

  pw.Widget text(String text) {
    return pw.Text(
      text,
      textAlign: pw.TextAlign.left,
      style: pw.TextStyle(
          fontSize: textSize, font: barlowRegular, color: textColor),
    );
  }

  pw.Widget textIcon(String text, level) {
    return visibility(
        condition: text != null,
        child: pw.Row(children: [
          pw.Text(
            text,
            textAlign: pw.TextAlign.left,
            style: pw.TextStyle(
                fontSize: textSize, font: barlowRegular, color: textColor),
          ),
          skillsRate(color, level),
        ]));
  }
}

class Temp3 extends pw.StatelessWidget {
  pw.Font lato, aleo;
  Temp3(this.lato, this.aleo);
  PdfColor color = PdfColor.fromHex('e1d8cf');
  PdfColor headerColor = PdfColor.fromHex('373741');
  PdfColor textColor = PdfColor.fromHex('444440');

  double nameSize = 28,
      textSize = 16,
      headerSize = 14,
      roleSize = 16,
      letterSpacing = 2;
  double imageWidth = 180, imageHeight = 180;

  pw.Widget header(String text) {
    return pw.Container(
      width: double.infinity,
      color: headerColor,
      child: pw.Padding(
        padding: pw.EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: pw.Text(
          toUpperCase(text),
          style: pw.TextStyle(
              fontSize: headerSize,
              font: aleo,
              color: color,
              fontWeight: pw.FontWeight.bold),
        ),
      ),
    );
  }

  pw.Widget text(String text) {
    return pw.Text(
      text,
      style: pw.TextStyle(fontSize: textSize, font: lato, color: textColor),
    );
  }

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
      pw.Expanded(
        child: pw.Container(
          color: color,
          child: pw.Padding(
            padding: pw.EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(height: 60),
                  pw.Center(
                      child: AppRepo.imagePath != null
                          ? pw.ClipRRect(
                              horizontalRadius: 90,
                              verticalRadius: 90,
                              child: pw.Image(
                                pw.MemoryImage(
                                    File(AppRepo.imagePath).readAsBytesSync()),
                                fit: pw.BoxFit.cover,
                                width: imageWidth,
                                height: imageWidth,
                              ),
                            )
                          : pw.Container(
                              width: imageWidth,
                              height: imageWidth,
                              decoration: pw.BoxDecoration(
                                  color: headerColor,
                                  borderRadius: pw.BorderRadius.circular(90)),
                            )),
                  pw.SizedBox(height: 30),
                  visibility(
                    condition: AppRepo.about != null,
                    child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(height: 30),
                          header('PERSONAL BACKGROUND'),
                          pw.SizedBox(height: 10),
                          text('${AppRepo.about}'),
                        ]),
                  ),
                  pw.SizedBox(height: 30),
                  visibility(
                    condition: AppRepo.achievements != null,
                    child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(height: 30),
                          header('ACHIVEMENTS'),
                          pw.SizedBox(height: 10),
                          text('${AppRepo.achievements}'),
                        ]),
                  ),
                  pw.SizedBox(height: 30),
                  visibility(
                      condition: AppRepo.phoneNumber != null ||
                          AppRepo.website != null ||
                          AppRepo.email != null ||
                          AppRepo.address != null,
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.SizedBox(height: 30),
                            header('GET IN TOUCH WITH ME'),
                            pw.SizedBox(height: 10),
                            pw.ListView(
                              children: [
                                textIcon(
                                    AppRepo.phoneNumber, Icons.phone.codePoint),
                                textIcon(
                                    AppRepo.website, Icons.computer.codePoint),
                                textIcon(AppRepo.email, Icons.email.codePoint),
                                textIcon(AppRepo.address,
                                    Icons.location_city.codePoint),
                              ],
                            ),
                          ])),
                ]),
          ),
        ),
      ),
      pw.Expanded(
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.SizedBox(height: 15),
            pw.Container(
              width: double.infinity,
              height: imageHeight,
              color: headerColor,
              child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      toUpperCase('${AppRepo.fullName}'),
                      textAlign: pw.TextAlign.center,
                      style: pw.TextStyle(
                          fontSize: nameSize,
                          font: aleo,
                          letterSpacing: letterSpacing,
                          color: color,
                          fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      '${AppRepo.profession}',
                      style: pw.TextStyle(
                          fontSize: roleSize,
                          color: color,
                          font: lato,
                          fontWeight: pw.FontWeight.bold),
                    ),
                  ]),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 10),
                    visibility(
                      condition: AppRepo.experienceModel != null,
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.SizedBox(height: 30),
                            header('WORK EXPERIENCE'),
                            pw.SizedBox(height: 10),
                            pw.ListView(
                                children: AppRepo.experienceModel
                                    .map((e) => pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            children: [
                                              pw.Text(e.role,
                                                  style: pw.TextStyle(
                                                      fontSize: textSize,
                                                      font: aleo,
                                                      fontWeight:
                                                          pw.FontWeight.bold,
                                                      color: textColor)),
                                              text(
                                                  '${e.company}| ${e.startDate} - ${e.endDate}'),
                                              text(e.summary),
                                            ]))
                                    .toList()),
                          ]),
                    ),
                    pw.SizedBox(height: 30),
                    visibility(
                      condition: AppRepo.educationModel != null,
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.SizedBox(height: 30),
                            header('PREVIOUS EDUCATION'),
                            pw.SizedBox(height: 10),
                            pw.ListView(
                                children: AppRepo.educationModel
                                    .map((e) => pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            children: [
                                              pw.Text(e.college,
                                                  style: pw.TextStyle(
                                                      fontSize: textSize,
                                                      font: aleo,
                                                      fontWeight:
                                                          pw.FontWeight.bold,
                                                      color: textColor)),
                                              text(
                                                  '${e.degree}| ${e.startDate} - ${e.endDate}'),
                                              text(e.summary),
                                            ]))
                                    .toList()),
                          ]),
                    ),
                    pw.SizedBox(height: 30),
                    visibility(
                      condition: AppRepo.referenceModel != null,
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.SizedBox(height: 30),
                            header('REFEREES'),
                            pw.SizedBox(height: 10),
                            pw.ListView(
                                children: AppRepo.referenceModel
                                    .map((e) => pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            children: [
                                              pw.Text(e.name,
                                                  style: pw.TextStyle(
                                                      fontSize: textSize,
                                                      font: aleo,
                                                      fontWeight:
                                                          pw.FontWeight.bold,
                                                      color: textColor)),
                                              text('${e.company}'),
                                              text('${e.phone}'),
                                              text(e.email),
                                            ]))
                                    .toList()),
                          ]),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    ]);
  }

  pw.Widget textIcon(String text, icon) {
    return visibility(
        condition: text != null,
        child: pw.Row(children: [
          //TODO:ADD icons from material Icons
          // pw.Icon( pw.IconData(icon)),
          pw.Text(
            text,
            textAlign: pw.TextAlign.left,
            style:
                pw.TextStyle(fontSize: textSize, font: aleo, color: textColor),
          )
        ]));
  }
}

class Temp4 extends pw.StatelessWidget {
  pw.Font monsarat, monsaratLight;
  Temp4(this.monsarat, this.monsaratLight);
  PdfColor color = PdfColor.fromHex('263547');
  PdfColor red = PdfColor.fromHex('fd4345');
  PdfColor white = PdfColor.fromHex('fdfdfd');

  double nameSize = 42,
      textSize = 16,
      headerSize = 14,
      roleSize = 16,
      letterSpacing = 2,
      imageWidth = 180,
      imageHeight = 180;

  pw.Widget header(String text, color) {
    return pw.Text(
      toUpperCase(text),
      style: pw.TextStyle(
          fontSize: headerSize,
          font: monsarat,
          color: color,
          fontWeight: pw.FontWeight.bold),
    );
  }

  pw.Widget text(String text, color) {
    return pw.Text(
      text,
      style:
          pw.TextStyle(fontSize: textSize, font: monsaratLight, color: color),
    );
  }

  pw.Widget divider() {
    return pw.SizedBox(
        height: 40,
        child: pw.Center(
          child: pw.Container(
            color: red,
            height: 5,
          ),
        ));
  }

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(children: [
      pw.Container(
        padding: pw.EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        height: imageHeight,
        color: red,
        child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(
                toUpperCase('${AppRepo.fullName}'),
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                    fontSize: nameSize,
                    font: monsarat,
                    letterSpacing: letterSpacing,
                    color: white,
                    fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                toUpperCase('${AppRepo.profession}'),
                style: pw.TextStyle(
                  fontSize: roleSize,
                  letterSpacing: letterSpacing,
                  color: color,
                  font: monsarat,
                ),
              ),
            ]),
      ),
      pw.Expanded(
        child: pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
          pw.Expanded(
            child: pw.Container(
              color: color,
              child: pw.Padding(
                padding: pw.EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      visibility(
                        condition: AppRepo.skillsModel != null,
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.SizedBox(height: 30),
                              header('Skills', red),
                              pw.SizedBox(height: 10),
                              pw.ListView(
                                  children: AppRepo.skillsModel
                                      .map(
                                        (e) => text(e.title, white),
                                      )
                                      .toList()),
                            ]),
                      ),
                      pw.SizedBox(height: 30),
                      visibility(
                        condition: AppRepo.achievements != null,
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              header('ACHIVEMENTS', red),
                              pw.SizedBox(height: 10),
                              text('${AppRepo.achievements}', white)
                            ]),
                      ),
                      pw.SizedBox(height: 30),
                      visibility(
                          condition: AppRepo.phoneNumber != null ||
                              AppRepo.website != null ||
                              AppRepo.email != null ||
                              AppRepo.address != null,
                          child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                header('GET IN TOUCH WITH ME', red),
                                pw.SizedBox(height: 20),
                                text(AppRepo.phoneNumber, white),
                                text(AppRepo.website, white),
                                text(AppRepo.email, white),
                                text(AppRepo.address, white),
                                pw.SizedBox(height: 10),
                              ])),
                    ]),
              ),
            ),
          ),
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Padding(
                  padding: pw.EdgeInsets.only(top: 30, bottom: 30, left: 30),
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        visibility(
                          condition: AppRepo.about != null,
                          child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(height: 30),
                                header('Profile', color),
                                pw.SizedBox(height: 10),
                                text('${AppRepo.about}', color),
                              ]),
                        ),

                        pw.SizedBox(height: 10),
                        divider(),
                        visibility(
                          condition: AppRepo.experienceModel != null,
                          child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(height: 30),
                                header('EXPERIENCE', color),
                                pw.ListView(
                                    children: AppRepo.experienceModel
                                        .map((e) => pw.Column(
                                                crossAxisAlignment:
                                                    pw.CrossAxisAlignment.start,
                                                children: [
                                                  pw.Text(e.role,
                                                      style: pw.TextStyle(
                                                          fontSize: textSize,
                                                          font: monsarat,
                                                          color: color)),
                                                  text(
                                                      '${e.company}| ${e.startDate} - ${e.endDate}',
                                                      color),
                                                  text(e.summary, color),
                                                ]))
                                        .toList()),
                              ]),
                        ),
                        pw.SizedBox(height: 10),
                        divider(),
                        visibility(
                          condition: AppRepo.educationModel != null,
                          child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(height: 30),
                                header('EDUCATION', color),
                                pw.SizedBox(height: 10),
                                pw.ListView(
                                    children: AppRepo.educationModel
                                        .map((e) => pw.Column(
                                                crossAxisAlignment:
                                                    pw.CrossAxisAlignment.start,
                                                children: [
                                                  pw.Text(e.college,
                                                      style: pw.TextStyle(
                                                          fontSize: textSize,
                                                          font: monsarat,
                                                          color: color)),
                                                  text(
                                                      '${e.degree}| ${e.startDate} - ${e.endDate}',
                                                      color),
                                                  text(e.summary, color),
                                                ]))
                                        .toList()),
                              ]),
                        ),]),
                ),
              ],
            ),
          ),
        ]),
      ),
    ]);
  }
}

class Temp5 extends pw.StatelessWidget {
  pw.Font hk, monsaratLight;
  Temp5(this.hk, this.monsaratLight);
  PdfColor color = PdfColor.fromHex('ced7df');
  PdfColor textColor = PdfColors.grey600;
  PdfColor divColor = PdfColor.fromHex('eff0f2');

  double nameSize = 38,
      textSize = 16,
      headerSize = 14,
      roleSize = 18,
      letterSpacing = 2,
      imageWidth = 120,
      imageHeight = 120;

  pw.Widget header(String text) {
    return pw.Text(
      toUpperCase(text),
      style: pw.TextStyle(
          fontSize: headerSize,
          font: hk,
          color: textColor,
          fontWeight: pw.FontWeight.bold),
    );
  }

  pw.Widget text(String text) {
    return pw.Text(
      text,
      style: pw.TextStyle(
        fontSize: textSize,
        font: monsaratLight,
      ),
    );
  }

  pw.Widget contentRow(String text, pw.Widget child) {
    return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          header(text),
          pw.SizedBox(
            height: 10,
          ),
          child
        ]);
  }

  pw.Widget divider({width}) {
    return pw.Container(color: divColor, height: 1, width: width);
  }

  @override
  pw.Widget build(pw.Context context) {
    final width = context.page.pageFormat.availableWidth;
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.stretch,
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          pw.Expanded(
              child: pw.Stack(overflow: pw.Overflow.clip, children: [
            pw.Positioned(
              left: 0,
              right: 0,
              child: pw.Container(
                width: width,
                height: 150,
                color: color,
              ),
            ),
            pw.Container(
              height: 300,
              alignment: pw.Alignment.bottomCenter,
              child: pw.Container(
                alignment: pw.Alignment.bottomCenter,
                height: 150,
                width: 150,
                child: pw.ClipRRect(
                    horizontalRadius: 70,
                    verticalRadius: 70,
                    child: AppRepo.imagePath != null
                        ? pw.Image(
                            pw.MemoryImage(
                                File(AppRepo.imagePath).readAsBytesSync()),
                            fit: pw.BoxFit.cover)
                        : null),
              ),
            ),
          ])),
          pw.SizedBox(height: 5),
          pw.Text(
            toUpperCase('${AppRepo.fullName}'),
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              fontSize: nameSize,
              font: hk,
              letterSpacing: letterSpacing,
            ),
          ),
          pw.Text(
            toUpperCase('${AppRepo.profession}'),
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              fontSize: roleSize,
              letterSpacing: letterSpacing,
              color: textColor,
              font: hk,
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Padding(
            padding: pw.EdgeInsets.symmetric(horizontal: 15),
            child: divider(),
          ),
          pw.Container(
              width: width,
              child: pw.Padding(
                padding: pw.EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Expanded(
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              visibility(
                                  condition: AppRepo.about != null,
                                  child: contentRow(
                                      'PROFILE', text(AppRepo.about))),
                              pw.SizedBox(height: 10),
                              visibility(
                                condition: AppRepo.skillsModel != null,
                                child: contentRow(
                                  'Skills',
                                  pw.ListView(
                                      children: AppRepo.skillsModel
                                          .map(
                                            (e) => text(e.title),
                                          )
                                          .toList()),
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              visibility(
                                condition: AppRepo.referenceModel != null,
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.SizedBox(height: 30),
                                      header('CHARACTER REFERENCES'),
                                      pw.SizedBox(height: 10),
                                      pw.ListView(
                                          children: AppRepo.referenceModel
                                              .map((e) => pw.Column(
                                                      crossAxisAlignment: pw
                                                          .CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        pw.Text(e.name,
                                                            style: pw.TextStyle(
                                                                fontSize:
                                                                    textSize,
                                                                font: hk,
                                                                fontWeight: pw
                                                                    .FontWeight
                                                                    .bold,
                                                                color: color)),
                                                        text('${e.company}'),
                                                        text('${e.phone}'),
                                                        text(e.email),
                                                      ]))
                                              .toList()),
                                    ]),
                              ),
                              pw.SizedBox(height: 10),
                              visibility(
                                condition: AppRepo.phoneNumber != null ||
                                    AppRepo.website != null ||
                                    AppRepo.email != null ||
                                    AppRepo.address != null,
                                child: contentRow(
                                    'Contact me',
                                    pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.SizedBox(height: 20),
                                          text(AppRepo.phoneNumber),
                                          text(AppRepo.website),
                                          text(AppRepo.email),
                                          text(AppRepo.address),
                                          pw.SizedBox(height: 10),
                                        ])),
                              ),
                            ]),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Expanded(
                        child: pw.Expanded(
                          child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                visibility(
                                  condition: AppRepo.achievements != null,
                                  child: pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        header(
                                          'ACHIVEMENTS',
                                        ),
                                        pw.SizedBox(height: 10),
                                        text('${AppRepo.achievements}'),
                                      ]),
                                ),
                                pw.SizedBox(height: 10),
                                visibility(
                                    condition: AppRepo.experienceModel != null,
                                    child: contentRow(
                                      'CAREER SUMMARY',
                                      pw.ListView(
                                          children: AppRepo.experienceModel
                                              .map((e) => pw.Column(
                                                      crossAxisAlignment: pw
                                                          .CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        pw.Text(e.role,
                                                            style: pw.TextStyle(
                                                                fontSize:
                                                                    textSize,
                                                                font: hk,
                                                                fontWeight: pw
                                                                    .FontWeight
                                                                    .bold,
                                                                color:
                                                                    textColor)),
                                                        text(
                                                          '${e.company}',
                                                        ),
                                                        text(
                                                          '${e.startDate} - ${e.endDate}',
                                                        ),
                                                        text('${e.summary}'),
                                                      ]))
                                              .toList()),
                                    )),
                                pw.SizedBox(height: 10),
                                visibility(
                                  condition: AppRepo.educationModel != null,
                                  child: contentRow(
                                    'EDUCATIONAL TRAINING',
                                    pw.ListView(
                                        children: AppRepo.educationModel
                                            .map((e) => pw.Column(
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      pw.Text(e.college,
                                                          style: pw.TextStyle(
                                                              fontSize:
                                                                  textSize,
                                                              font: hk,
                                                              color: color)),
                                                      text(
                                                        '${e.degree}| ${e.startDate} - ${e.endDate}',
                                                      ),
                                                      text(
                                                        e.summary,
                                                      ),
                                                    ]))
                                            .toList()),
                                  ),
                                ),
                                divider(),
                              ]),
                        ),
                      ),
                    ]),
              )),
        ]);
  }
}

class Temp6 extends pw.StatelessWidget {
  pw.Font ttf, lora, headerFont;
  Temp6(this.ttf, this.lora, this.headerFont,);
  double nameSize = 30,
      textSize = 16,
      headerSize = 18,
      headerspacing = 4,
      letterSpacing = 10;
  PdfColor color = PdfColor.fromHex('#D3EEE1');

  pw.Widget header(String text) {
    return pw.Text(
      text,
      style: pw.TextStyle(
          font: headerFont,
          fontSize: headerSize,
          letterSpacing: headerspacing,
          fontWeight: pw.FontWeight.normal),
    );
  }

  pw.Widget text(String text) {
    return pw.Text(
      text,
      style: pw.TextStyle(
          fontSize: textSize, font: lora, color: PdfColor.fromHex('#222222')),
    );
  }

  @override
  pw.Widget build(pw.Context context) {
    final width = context.page.pageFormat.availableWidth;
    final height = context.page.pageFormat.availableHeight;
    return pw.Padding(
      padding: const pw.EdgeInsets.all(10.0),
      child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              alignment: pw.Alignment.center,
              child: pw.Stack(alignment: pw.Alignment.topCenter, children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.SizedBox(height: 14),
                    pw.Container(width: width, height: 22, color: color),
                  ],
                ),
                pw.Text(
                  toUpperCase(AppRepo.fullName ?? 'No name'),
                  style: pw.TextStyle(
                    letterSpacing: letterSpacing,
                    fontSize: nameSize,
                    font: ttf,
                  ),
                ),
              ]),
            ),
            pw.SizedBox(height: 5.5),
            pw.Center(
              child: pw.Text(
                '* ${AppRepo.profession} *',
                style: pw.TextStyle(
                    fontSize: textSize,
                    font: lora,
                    color: PdfColor.fromHex('#222222')),
              ),
            ),
            pw.SizedBox(height: 32),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Expanded(
                  child: visibility(
                      condition: AppRepo.about != null,
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            header('ABOUT ME'),
                            pw.SizedBox(height: 10),
                            text('${AppRepo.about}'),
                          ])),
                ),
                pw.SizedBox(width: 10),
                pw.Expanded(
                  child: visibility(
                      condition: AppRepo.experienceModel != null,
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            header('EDUCATION'),
                            pw.SizedBox(height: 10),
                            pw.ListView(
                                children: AppRepo.educationModel
                                    .map((e) => pw.Column(
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.start,
                                            children: [
                                              text(
                                                  '${e.startDate} - ${e.endDate} * ${e.college}'),
                                              pw.SizedBox(height: 5.5),
                                            ]))
                                    .toList()),
                          ])),
                ),
              ],
            ),
            pw.SizedBox(height: 32),
            visibility(
              condition: AppRepo.experienceModel != null,
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    header('EXPERIENCE'),
                    pw.SizedBox(height: 10),
                    pw.ListView(
                        children: AppRepo.experienceModel
                            .map((e) => pw.Row(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      '${e.startDate}',
                                      style: pw.TextStyle(
                                          font: ttf,
                                          fontSize: 16,
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.SizedBox(width: 20),
                                    pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      children: [
                                        pw.Text(
                                          '${e.company}',
                                          style: pw.TextStyle(
                                              font: ttf,
                                              fontSize: 16,
                                              fontWeight: pw.FontWeight.bold),
                                        ),
                                        text('${e.role}'),
                                        text('${e.summary}'),
                                      ],
                                    ),
                                  ],
                                ))
                            .toList()),
                  ]),
            ),
            pw.SizedBox(height: 20),
            visibility(
                condition: AppRepo.achievements != null,
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      header('ACHIEVEMENTS'),
                      pw.SizedBox(height: 10),
                      text('${AppRepo.achievements}'),
                    ])),
            pw.SizedBox(height: 20),
            visibility(
                condition: AppRepo.skillsModel != null,
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      header('SKILLS'),
                      pw.SizedBox(height: 10),
                      pw.GridView(
                          crossAxisCount: 2,
                          childAspectRatio: width / (height) / 7,
                          children: AppRepo.skillsModel
                              .map((e) => pw.Padding(
                                    padding: pw.EdgeInsets.only(bottom: 5),
                                    child: pw.Row(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      children: [
                                        text(e.title),
                                        pw.SizedBox(width: 20),
                                        skillsRate(
                                          color,
                                          e.level,
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList()),
                      pw.SizedBox(height: 30),
                      pw.Container(
                        width: double.infinity,
                        color: color,
                        height: 2,
                      ),
                      pw.SizedBox(height: 30),
                      pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            visibility(
                                condition: AppRepo.phoneNumber != null ||
                                    AppRepo.website != null ||
                                    AppRepo.email != null ||
                                    AppRepo.address != null,
                                child: pw.Expanded(
                                    child: pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            pw.MainAxisAlignment.start,
                                        children: [
                                      header('CONTACT'),
                                      pw.SizedBox(height: 20),
                                      text(AppRepo.phoneNumber),
                                      text(AppRepo.website),
                                      text(AppRepo.email),
                                      text(AppRepo.address),
                                    ]))),
                            visibility(
                              condition: AppRepo.referenceModel != null,
                              child: pw.Expanded(
                                  child: pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      children: [
                                    header('REFEREES'),
                                    pw.SizedBox(height: 10),
                                    pw.ListView(
                                        children: AppRepo.referenceModel
                                            .map((e) => pw.Column(
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .start,
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment
                                                        .start,
                                                    children: [
                                                      pw.Text(e.name,
                                                          style: pw.TextStyle(
                                                              fontSize:
                                                                  textSize,
                                                              font: ttf,
                                                              color: PdfColors
                                                                  .white)),
                                                      text('${e.company}'),
                                                      text('${e.phone}'),
                                                      text('${e.email}'),
                                                    ]))
                                            .toList()),
                                  ])),
                            ),
                          ])
                    ]))
          ]),
    );
  }
}
