import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MyChapterContent extends StatefulWidget {
  final String chapterName;
  final String chapterContent;

  const MyChapterContent({
    Key? key,
    required this.chapterName,
    required this.chapterContent,
  }) : super(key: key);

  @override
  _MyChapterContentState createState() => _MyChapterContentState();
}

class _MyChapterContentState extends State<MyChapterContent> {
  late bool _isLoading;
  late String _filePath;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _initPdfFile();
  }

  Future<void> _initPdfFile() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      _filePath = '${dir.path}/${widget.chapterName}.pdf';

      final file = File(_filePath);
      if (!file.existsSync()) {
        // File does not exist, initiate the download process here if needed
        // You can use the previously implemented download logic here
        // Example: await downloadAndSavePDF(widget.chapterContent, widget.chapterName);
      }

      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      print('Error initializing PDF: $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chapterName),
        elevation: 0,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator()) // Show a loading indicator while checking or downloading the file
          : _buildPdfViewer(),
    );
  }

  Widget _buildPdfViewer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SfPdfViewer.file(
        File(_filePath),
        // Other PDF viewer properties can be configured here
        // For example:
        // pageSpacing: 4.0,
        // pageTransition: PdfPageTransition.scrollContinuous,
      ),
    );
  }
}
