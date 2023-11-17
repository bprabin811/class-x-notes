import 'package:flutter/material.dart';
import 'package:notex/utils/chapter_content.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class NepaliPage extends StatefulWidget {
  final VoidCallback onToggleDarkMode;
  const NepaliPage({super.key, required this.onToggleDarkMode});

  @override
  State<NepaliPage> createState() => _NepaliPageState();
}

class _NepaliPageState extends State<NepaliPage> {
  bool isDarkMode = false;
  List nepaliChapters = [
    'Chapter 1: उज्यालो यात्रा',
    'Chapter 2: घरझगडा',
    'Chapter 3: चिकित्सा ज्ञान र आयुर्वेद चिकित्सा',
    'Chapter 4: यस्तो कहिलै नहोस्',
    'Chapter 5: लक्ष्मीप्रसाद देवकोटा',
    'Chapter 6: अधिकार ठुलो कि कर्तव्य ठुलो ?',
    'Chapter 7: शत्रु',
    'Chapter 8: नेपाली हाम्रो श्रम र सिप',
    'Chapter 9: मेरो देशको शिक्षा',
    'Chapter 10: व्यावसायिक चिठी',
    'Chapter 11: कर्तव्य',
    'Chapter 12: पाब्लो फिकासो',
    'Chapter 13: पख्नोस्',
    'Chapter 14: घरको माया',
    'Chapter 15: गाउँमाथि एउटा कविता',
    'Chapter 16: आयाम',
    // 'Chapter 17: सुनाइ पाठ',
  ];
  List<String> chapterContent = [
    'https://drive.google.com/uc?export=view&id=1dGkpNOMP0ndVkS2puRC5KnTqm1dWwxZZ',
    'https://drive.google.com/uc?export=view&id=1dXu39fz4MgwbIeZtXd7fDe7OvY3zXHfs',
    'https://drive.google.com/uc?export=view&id=1d_ynyWjfExr3chwRiw2rUS1vu5crDulO',
    'https://drive.google.com/uc?export=view&id=1db27To9prUSwrjDP6MEp0maR8Pm7sIMs',
    'https://drive.google.com/uc?export=view&id=1eCX6A3Ec99V0rD0lhRRFRxkcrtOCoj2v',
    'https://drive.google.com/uc?export=view&id=1eRw-mSuK5ehW80nZTZ46qcB47wB7oMFC',
    'https://drive.google.com/uc?export=view&id=1eXK9Yn8VIwLU6bXv02xD__mqBXI28lZ7',
    'https://drive.google.com/uc?export=view&id=1edK4i7yaV7ntvxuRVSPZ0Wytc0LvswOI',
    'https://drive.google.com/uc?export=view&id=1eeRxDxOyIiRsPtzJl9ZX9f-rB_myBG3H',
    'https://drive.google.com/uc?export=view&id=1dHG4LAdkIfPxlRW6MIc-WiBhJmSd3Uh9',
    'https://drive.google.com/uc?export=view&id=1dK8KZ2dI_wgkG0l1X1-OnInUAbuOCJE2',
    'https://drive.google.com/uc?export=view&id=1dOmnO9XQyDD7Pmpdbr2i4YbJUWRMY8uS',
    'https://drive.google.com/uc?export=view&id=1dOq-bV8yHuM8yu7z1Zudhi5Cg0pCF51L',
    'https://drive.google.com/uc?export=view&id=1dXPQzFibMx3WeaYcOtIpXd3Y64iF1lHP',
    'https://drive.google.com/uc?export=view&id=1dOssRUZuaPn_fmCydL7KnM3eVy5BTrh-',
    'https://drive.google.com/uc?export=view&id=1dVnPw3SR_yQFwcdMEMHnNdkoZZVsP80N'
  ];


   @override
  void initState() {
    super.initState();
    _downloadPDFs();
  }

  Future<void> _downloadPDFs() async {
    for (int i = 0; i < chapterContent.length; i++) {
      await downloadAndSavePDF(chapterContent[i], 'Chapter_$i');
    }
  }

  Future<void> downloadAndSavePDF(String url, String fileName) async {
    Dio dio = Dio();
    try {
      var dir = await getApplicationDocumentsDirectory();
      String filePath = '${dir.path}/$fileName.pdf';

      await dio.download(url, filePath);

      print('Downloaded file to: $filePath');
    } catch (error) {
      print('Error downloading file: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nepali'),
        elevation: 0,
        actions: [
          Switch(
              activeColor: Colors.purple,
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                widget.onToggleDarkMode();
              }),
        ],
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: nepaliChapters.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyChapterContent(
                              chapterName: nepaliChapters[index],
                              // chapterContent: chapterContent[index],
                              chapterContent: chapterContent[index],
                            )),
                  );
                },
                child: Card(
                  elevation: 1,
                  child: ListTile(
                    title: Text(
                      nepaliChapters[index],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
