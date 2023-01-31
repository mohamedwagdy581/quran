import 'package:flutter/material.dart';

import '../../shared/components/arabic_sura_number.dart';
import '../../shared/components/surah_builder.dart';
import '../../shared/constants/constants.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readJson(),
        builder: (
            BuildContext context,
            AsyncSnapshot snapshot,
            ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return indexCreator(snapshot.data, context);
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: FloatingActionButton(
          tooltip: 'Go to bookmark',
          child: const Icon(Icons.bookmark),
          backgroundColor: Colors.green,
          onPressed: () async {
            fabIsClicked = true;
            if (await readBookmark() == true) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SurahBuilder(
                        arabic: quran[0],
                        sura: bookmarkedSura - 1,
                        suraName: arabicName[bookmarkedSura - 1]['name'],
                        aya: bookmarkedAyah,

                      )));
            }
          },
        ),
      ),
    );
  }
  Container indexCreator(quran, context) {
    return Container(
      color: const Color.fromARGB(255, 221, 250, 236),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          for (int i = 0; i < 114; i++)
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              color: i % 2 == 0
                  ? const Color.fromARGB(255, 253, 247, 230)
                  : const Color.fromARGB(255, 253, 251, 240),
              child: TextButton(
                child: Row(
                  children: [
                    ArabicSuraNumber(i: i),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      arabicName[i]['name'],
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                          fontFamily: 'quran',
                          shadows: [
                            Shadow(
                              offset: Offset(.5, .5),
                              blurRadius: 1.0,
                              color: Color.fromARGB(255, 130, 130, 130),
                            )
                          ]),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                onPressed: () {
                  fabIsClicked = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SurahBuilder(
                          arabic: quran[0],
                          sura: i,
                          suraName: arabicName[i]['name'],
                          aya: 0,
                        )),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

}
