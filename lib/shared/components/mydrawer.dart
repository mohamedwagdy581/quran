import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../modules/contact_us/contact_us_screen.dart';
import '../../modules/settings/settings_screen.dart';
import '../constants/constants.dart';
import '../constants/dimensions.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                CircleAvatar(
                  radius: Dimensions.radius30+Dimensions.radius20,
                  backgroundColor: Color.fromARGB(255, 221, 250, 236),
                  child: Container(
                    child: Image.asset(
                        'assets/images/quran.png',
                      fit: BoxFit.contain,
                      height: Dimensions.height45*2-5,
                    ),
                  ),

                ),
                SizedBox(height: Dimensions.height5,),
                Text(
                  'القرآن الكريم',
                  style: TextStyle(
                    fontSize: Dimensions.font20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          customListTile(
            onTap: ()
            {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
            },
            icon: Icons.settings,
            text: 'الإعدادات',
          ),
          customListTile(
            onTap: () 
            {
              Share.share(
                '''*Quran app*\n
                This App Developed by Mohamed Wagdy:\n
                Gmail: mohamedwagdy4153@gmail.com \n
                github: https://github.com/mohamedwagdy581 ''',
              );
              Navigator.pop(context);
            },
            icon: Icons.share,
            text: 'شارك',
            color: Colors.blue,
          ),
          customListTile(
            onTap: () async
            {
              if(!await launchUrl(quranAppUrl, mode: LaunchMode.externalApplication))
              {
                throw 'Could not Launch $quranAppUrl';
              }
            },
            icon: Icons.rate_review,
            text: 'تقيمم',
            color: Colors.red,
          ),
          customListTile(
            onTap: ()
            {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsScreen()));
            },
            icon: Icons.info,
            text: 'تواصل معنا',
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget customListTile({
    required VoidCallback onTap,
    required IconData icon,
    required String text,
    Color? color
  }) =>
      Padding(
        padding: EdgeInsets.all(Dimensions.height10),
        child: ListTile(
          onTap: onTap,
          leading: Icon(
            icon,
            color: color,
            size: Dimensions.iconSize26,
          ),
          title: Text(
            text,
            style: TextStyle(
              fontSize: Dimensions.font20,
            ),
          ),
        ),
      );
}
