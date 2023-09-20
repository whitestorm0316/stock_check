import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void _pickFile() async {
    // opens storage to pick files and the picked file or files
    // are assigned into result and if no file is chosen result is null.
    // you can also toggle "allowMultiple" true or false depending on your need
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    // if no file is picked
    if (result == null) return;

    // we get the file from result object
    final file = result.files.first;

    print(file.path);
    _parseFile(file);
  }

  void _parseFile(PlatformFile file) {
    var bytes = File.fromUri(Uri(path: file.path)).readAsBytesSync();
    var decoder = SpreadsheetDecoder.decodeBytes(bytes);
    stderr.writeln((decoder.tables).keys);
    debugPrint('debug print');
    debugPrint((decoder.tables).keys.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: Center(
          child: MaterialButton(
            onPressed: () {
              _pickFile();
            },
            child: Text(
              'Pick and open file',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

void _pickFile() async {
  // opens storage to pick files and the picked file or files
  // are assigned into result and if no file is chosen result is null.
  // you can also toggle "allowMultiple" true or false depending on your need
  final result = await FilePicker.platform.pickFiles(allowMultiple: true);

  // if no file is picked
  if (result == null) return;

  // we get the file from result object
  final file = result.files.first;

  _openFile(file);
}

void _openFile(PlatformFile file) {
  OpenFile.open(file.path);
}
