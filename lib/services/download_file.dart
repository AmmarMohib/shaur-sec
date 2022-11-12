// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:universal_html/html.dart' as html;

abstract class DownloadService {
  Future<void> download({required String url, required String name});
}

class WebDownloadService implements DownloadService {
  @override
  Future<void> download({required String url, required String name}) async {
    html.window.open(url, "_blank");
  }
}

class MobileDownloadService implements DownloadService {
  @override
  Future<void> download({required String url, required String name}) async {
    // bool hasPermission = await _requestWritePermission();
    // if (!hasPermission) return;

    Dio dio = Dio();
    var dir = await getApplicationDocumentsDirectory();

    // You should put the name you want for the file here.
    // Take in account the extension.
    String fileName = name;
    // if () {
    //   print("the file exists");
    // } else {
    //   print("the file does not exists");
    // }
    bool existance = false;
     var a = await  File("${dir.path}/$fileName").exists().then((value) => existance = value);
    if (existance == true) {
      OpenFile.open("${dir.path}/$fileName");
    } else if(existance == false) {
      Fluttertoast.showToast(
          msg: 'downloading file, first time please wait',
          fontSize: 20,
          backgroundColor: Color.fromRGBO(0, 124, 195, 1.0));
      var a = "${dir.path}/$fileName";
      await dio.download(url, a);
      OpenFile.open("${dir.path}/$fileName");
    }
    // var a = "${dir.path}/$fileName";
    // await dio.download(url, a);
    // print("data ==== " + a);
    // OpenFile.open("${dir.path}/$fileName");
  }

  // Future<bool> _requestWritePermission() async {
  //   // await Permission.storage.request();
  //   // return await Permission.storage.request().isGranted;
  // }
}
