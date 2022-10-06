// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
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
    bool hasPermission = await _requestWritePermission();
    if (!hasPermission) return;

    Dio dio = Dio();
    var dir = await getApplicationDocumentsDirectory();
    print(dir.path);

    // You should put the name you want for the file here.
    // Take in account the extension.
    String fileName = name;
    // if () {
    //   print("the file exists");
    // } else {
    //   print("the file does not exists");
    // }
    var existance;
    print(File("${dir.path}/$fileName")
        .exists()
        .then((value) => print("the file existance == " + value.toString())));
  //  var a = await  File("${dir.path}/$fileName").exists().then((value) => existance = value);
    if (existance = true) {
      print("the file exists");
    OpenFile.open("${dir.path}/$fileName");
    } else {
      print("the file is not available");
      var a = "${dir.path}/$fileName";
    await dio.download(url, a);
    print("data ==== " + a);
    OpenFile.open("${dir.path}/$fileName");

    }
    // var a = "${dir.path}/$fileName";
    // await dio.download(url, a);
    // print("data ==== " + a);
    // OpenFile.open("${dir.path}/$fileName");
  }

  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }
}
