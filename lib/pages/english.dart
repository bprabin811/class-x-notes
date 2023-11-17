import 'package:flutter/material.dart';
import 'package:notex/utils/chapter_content.dart';

class EnglishPage extends StatefulWidget {
  final VoidCallback onToggleDarkMode;
  const EnglishPage({super.key, required this.onToggleDarkMode});

  @override
  State<EnglishPage> createState() => _EnglishPageState();
}

class _EnglishPageState extends State<EnglishPage> {
  bool isDarkMode = false;
  List englishChapters = [
    'Unit 1: Current Affairs and Issues',
    'Unit 2: Festivals and Celebrations',
    'Unit 3: Health and Wellness',
    'Unit 4: Work and Leisure',
    'Unit 5: Science and Experiment',
    'Unit 6: Food and Cuisine',
    'Unit 7: Cyber Security',
    'Unit 8: Hobbies and Interests',
    'Unit 9: History and Culture',
    'Unit 10: Games and Sports',
    'Unit 11: Ethics and Morality',
    'Unit 12: Nature and Development',
    'Unit 13: Population and Migration',
    'Unit 14: Travel and Adventure',
    'Unit 15: People and Places',
    'Unit 16: Success and Celebration',
    'Unit 17: Countries and Towns',
    'Unit 18: Media and Entertainment'
  ];
  // List chapterContent = [
  // ];

  static const chapterContent = 'The content will be uploaded soon!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('English'),
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
          itemCount: englishChapters.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyChapterContent(
                              chapterName: englishChapters[index],
                              // chapterContent: chapterContent[index],
                              chapterContent: chapterContent,
                            )),
                  );
                },
                child: Card(
                  elevation: 1,
                  child: ListTile(
                    title: Text(
                      englishChapters[index],
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
