import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:folio_front/data/model/folio_response_model.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';


import 'dart:html' as html;

class PdfUtil {
  static Future<void> generate(ResumeResponseDTO resume) async {

    PdfDocument pdf = PdfDocument();
    PdfPage page = pdf.pages.add();


    //resume 내부 내용을 리니어하게 작성 - 한국어 폰트 적용

    page.graphics.drawString(
        resume.resumeName,  PdfCjkStandardFont(PdfCjkFontFamily.hanyangSystemsShinMyeongJoMedium, 20),
        bounds: const Rect.fromLTWH(0, 0, 500, 50));
    page.graphics.drawString(
        resume.resumeSubtitle,  PdfCjkStandardFont(PdfCjkFontFamily.hanyangSystemsShinMyeongJoMedium, 14),
        bounds: const Rect.fromLTWH(0, 20, 500, 200));

    page.graphics.drawString(
        "개인 정보 ",  PdfCjkStandardFont(PdfCjkFontFamily.hanyangSystemsShinMyeongJoMedium, 20),
        bounds: const Rect.fromLTWH(0, 100, 500, 50));

    page.graphics.drawString(
        resume.resumeUserName,  PdfCjkStandardFont(PdfCjkFontFamily.hanyangSystemsShinMyeongJoMedium, 14),
        bounds: const Rect.fromLTWH(0, 140, 100, 200));

    page.graphics.drawString(
        resume.resumeUserEmail,  PdfCjkStandardFont(PdfCjkFontFamily.hanyangSystemsShinMyeongJoMedium, 14),
        bounds: const Rect.fromLTWH(200, 140, 500, 200));

    page.graphics.drawString(
        resume.resumeUserPhone,  PdfCjkStandardFont(PdfCjkFontFamily.hanyangSystemsShinMyeongJoMedium, 14),
        bounds: const Rect.fromLTWH(0, 160, 500, 200));

    page.graphics.drawString(
        resume.resumeUserYear,  PdfCjkStandardFont(PdfCjkFontFamily.hanyangSystemsShinMyeongJoMedium, 14),
        bounds: const Rect.fromLTWH(100, 140, 100, 200));

    page.graphics.drawString(
        resume.resumeUserSelf,  PdfCjkStandardFont(PdfCjkFontFamily.hanyangSystemsShinMyeongJoMedium, 14),
        bounds: const Rect.fromLTWH(0, 180, 500, 200));







    /// PDF 저장

    var savedFile = await pdf.save();
    List<int> fileInts = List.from(savedFile);

    html.AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
      ..setAttribute("download", "${resume.resumeName}.pdf")
      ..click();
  }



}
