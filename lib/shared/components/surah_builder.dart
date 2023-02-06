import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../constants/dimensions.dart';

ItemScrollController itemScrollController = ItemScrollController();
ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

// ignore: must_be_immutable
class SurahBuilder extends StatefulWidget {
  final arabic;
  final sura;
  final suraName;
  int aya;

  SurahBuilder({
    Key? key,
    this.arabic,
    this.sura,
    this.suraName,
    required this.aya,
  }) : super(key: key);

  @override
  State<SurahBuilder> createState() => _SurahBuilderState();
}

class _SurahBuilderState extends State<SurahBuilder> {
  bool view = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => jumpToAya());
    // TODO: implement initState
    super.initState();
  }

  jumpToAya() {
    if (fabIsClicked) {
      itemScrollController.scrollTo(
        index: widget.aya,
        duration: const Duration(
          seconds: 2,
        ),
        curve: Curves.easeInOutCubic,
      );
    }
    fabIsClicked = false;
  }

  saveBookMark(surah, ayah) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('surah', surah);
    await prefs.setInt('ayah', ayah);
  }

  Row verseBuilder(int index, previousVerses) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.arabic[index + previousVerses]['aya_text'],
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: arabicFontSize,
                  fontFamily: arabicFont,
                  color: const Color.fromARGB(196, 0, 0, 0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
            ],
          ),
        ),
      ],
    );
  }

  SafeArea SingleSuraBuilder(LengthOfSura) {
    String fullSura = '';
    int previousVerses = 0;

    if(widget.sura + 1 != 1)
    {
      for(int i = widget.sura - 1; i >= 0; i--)
      {
        previousVerses = previousVerses + noOfVerses[i];
      }
    }

    if(!view)
    {
      for(int i = 0; i < LengthOfSura; i++)
      {
        fullSura += (widget.arabic[i + previousVerses]['aya_text']);
      }
    }
    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 253, 251, 240),
        child: view
            ? ScrollablePositionedList.builder(
            itemCount: LengthOfSura,
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
            itemBuilder: (BuildContext context, int index)
            {
              return Column(
                children: [
                  (index != 0) || (widget.sura != 0) || (widget.sura == 8)
                  ? const Text('')
                      : ReturnBasmal(),
                  Container(
                    color: index % 2 != 0
                    ? const Color.fromARGB(255, 253, 251, 240)
                    : const Color.fromARGB(255, 253, 247, 230),
                    child: PopupMenuButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: verseBuilder(index, previousVerses),
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: ()
                          {
                            saveBookMark(widget.sura + 1, index);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.bookmark_add,
                                color: Color.fromARGB(255, 56, 115, 59),
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              Text(
                                'Share',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
        )
        : ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // First Child
                      widget.sura + 1 != 1 && widget.sura + 1 != 9
                      ? ReturnBasmal()
                      : const Text(''),

                      // Second Child
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          fullSura,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: mushafFontSize,
                            fontFamily: arabicFont,
                            color: const Color.fromARGB(196, 44, 44, 44),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int LengthOfSura = noOfVerses[widget.sura];
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow,),
      home: Scaffold(
        appBar: AppBar(
          leading: Tooltip(
            message: 'Mushaf Mode',
            child: TextButton(
              onPressed: ()
              {
                setState(() {
                  view = !view;
                });
              },
              child: const Icon(Icons.chrome_reader_mode,color: Colors.white,),
            ),
          ),
          centerTitle: true,
          title: Text(
            widget.suraName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Dimensions.font20*2,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'quran',
              shadows: [
                Shadow(
                  color: Color.fromARGB(255, 0, 0, 0),
                  offset: Offset(1, 1),
                  blurRadius: 2.0,
                ),
              ]
            ),
          ),
          backgroundColor: Color.fromARGB(255, 56, 115, 59),
        ),
        body: SingleSuraBuilder(LengthOfSura),
      ),
    );
  }
}

class ReturnBasmal extends StatelessWidget {
  const ReturnBasmal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: 
      [
        Center(
          child: Text(
            'بسم الله الرحمن الرحيم',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontFamily: 'me_quran',
              fontSize: Dimensions.font20+10,
            ),
          ),
        ),
      ],
    );
  }
}

