import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notex/pages/english.dart';
import 'package:notex/pages/nepali.dart';
import 'package:notex/pages/social.dart';
import 'package:notex/sreens/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}

class MyHomePage extends StatefulWidget {
  final VoidCallback onToggleDarkMode;
  const MyHomePage({super.key, required this.onToggleDarkMode});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void>? _launched;
  @override
  Widget build(BuildContext context) {
    final Uri toTelegram =
        Uri(scheme: 'https', host: 't.me', path: 'class10shikxak');
    final Uri moreNote = Uri(scheme: 'https', host: 'nexucorner.com', path: '');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class-10 Notes'),
        elevation: 0,
      ),
      drawer: MyDrawer(
        onToggleDarkMode: widget.onToggleDarkMode,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const Gap(25),
              GestureDetector(
                onTap: () => setState(() {
                  _launched = _launchInBrowser(toTelegram);
                }),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.purple.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    'Tap here to join our telegram discussion group to ask your questions or answer others all over Nepal.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  )),
                ),
              ),
              const Gap(40),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Image(
                  // color: Colors.black87,
                  image: AssetImage('assets/images/logo.jpg'),
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
              const Gap(40),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.purple),
                    borderRadius: BorderRadius.circular(10)),
                height: MediaQuery.of(context).size.width * 0.85,
                width: MediaQuery.of(context).size.width * 0.9,
                child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EnglishPage(
                                    onToggleDarkMode: widget.onToggleDarkMode,
                                  )),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.purple.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              FontAwesomeIcons.book,
                              size: 40,
                            ),
                          ),
                          const Gap(10),
                          Text(
                            'English',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SocialPage(
                                    onToggleDarkMode: widget.onToggleDarkMode,
                                  )),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.purple.shade300,
                            ),
                            child: const Icon(
                              FontAwesomeIcons.users,
                              size: 40,
                            ),
                          ),
                          const Gap(10),
                          Text(
                            'Social',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NepaliPage(
                                    onToggleDarkMode: widget.onToggleDarkMode,
                                  )),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.purple.shade300,
                            ),
                            child: const Icon(
                              FontAwesomeIcons.n,
                              size: 40,
                            ),
                          ),
                          const Gap(10),
                          Text(
                            'नेपाली',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(40),
              GestureDetector(
                onTap: () => setState(() {
                  _launched = _launchInBrowser(moreNote);
                }),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    'More Notes',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.purple.shade600, fontSize: 16),
                  )),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
