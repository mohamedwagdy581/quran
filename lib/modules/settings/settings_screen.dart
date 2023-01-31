import 'package:flutter/material.dart';

import '../../shared/constants/constants.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
          ),
          backgroundColor: const Color.fromARGB(255, 56, 115, 59),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Arabic Font Size Text
                  const Text(
                    'Arabic Font Size:',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Slider for Arabic Font Size
                  Slider(
                    value: arabicFontSize,
                    min: 20.0,
                    max: 40.0,
                    onChanged: (value) {
                      setState(() {
                        arabicFontSize = value;
                      });
                    },
                  ),

                  // Text After Change Slider
                  Text(
                    "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: arabicFontSize,
                      fontFamily: 'quran',
                    ),
                  ),

                  // Divider Between Arabic Font and Mushaf Font
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    child: Divider(),
                  ),

                  // Mushaf Font Size Text
                  const Text(
                    'Moshaf Mode Font Size:',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Slider for Mushaf Mode Font Size
                  Slider(
                    value: mushafFontSize,
                    min: 20,
                    max: 50,
                    onChanged: (value) {
                      setState(() {
                        mushafFontSize = value;
                      });
                    },
                  ),

                  // Text After Change Slider
                  Text(
                    "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: mushafFontSize,
                      fontFamily: 'quran',
                    ),
                  ),

                  // SizedBox Between Settings and Buttons
                  const SizedBox(
                    height: 20.0,
                  ),

                  // Save and Reset Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Reset Button
                      ElevatedButton(
                        onPressed: ()
                        {
                          setState(() {
                            arabicFontSize = 28.0;
                            mushafFontSize = 40.0;
                          });
                          saveSettings();
                        },
                        child: const Text(
                          'Reset',
                        ),
                      ),

                      // Save Button
                      ElevatedButton(
                        onPressed: ()
                        {
                          saveSettings();
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Save',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
