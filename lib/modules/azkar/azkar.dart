import 'package:flutter/material.dart';

import '../../shared/constants/dimensions.dart';
import 'allah_names/asmaa_allah_screen.dart';
import 'azkar_muslim/azkar_muslem_screen.dart';
import 'mobasharon/mobasharon_screen.dart';
import 'sadaka/sadaka_screen.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gridCategoryList = [
      {
        'name': 'أسماء ٱللَّهُ الحسنى',
        'picture': 'assets/images/allah.png',
      },
      {
        'name': 'أذكار المسلم',
        'picture': 'assets/images/azkar.png',
      },
      {
        'name': 'العشرة المبشرون بالجنة',
        'picture': 'assets/images/mob.png',
      },
      {
        'name': 'صدقة جارية',
        'picture': 'assets/images/sadaka.png',
      },
    ];
    return Column(
      children: [
        SizedBox(
          height: Dimensions.height30 * 11,
          child: Stack(
            children: [
              SizedBox(
                height: Dimensions.height20 * 10,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20),
                          )),
                    ),
                    Container(
                      height: Dimensions.height20 * 6,
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      padding: EdgeInsets.only(
                          top: Dimensions.height20, right: Dimensions.width20),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.only(left: Dimensions.width45*2 + Dimensions.width30),
                            //alignment: Alignment.centerRight,
                            child: Text(
                              'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
                              style: TextStyle(
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Text(
                            'تَبَارَكَ الَّذِي بِيَدِهِ الْمُلْكُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ',
                            style: TextStyle(
                                fontSize: Dimensions.font20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: Dimensions.screenHeight / 8,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.width30, right: Dimensions.width30),
                  child: Container(
                    height: Dimensions.height20 * 15,
                    width: Dimensions.width45 * 8,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(Dimensions.width10),
                      child: Text(
                        'إِنَّ الْمُسْلِمِينَ وَالْمُسْلِمَاتِ وَالْمُؤْمِنِينَ وَالْمُؤْمِنَاتِ وَالْقَانِتِينَ وَالْقَانِتَاتِ وَالصَّادِقِينَ وَالصَّادِقَاتِ وَالصَّابِرِينَ وَالصَّابِرَاتِ وَالْخَاشِعِينَ وَالْخَاشِعَاتِ وَالْمُتَصَدِّقِينَ وَالْمُتَصَدِّقَاتِ وَالصَّائِمِينَ وَالصَّائِمَاتِ وَالْحَافِظِينَ فُرُوجَهُمْ وَالْحَافِظَاتِ وَالذَّاكِرِينَ اللَّهَ كَثِيرًا وَالذَّاكِرَاتِ أَعَدَّ اللَّهُ لَهُم مَّغْفِرَةً وَأَجْرًا عَظِيمًا',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Dimensions.font20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: Dimensions.height30),
            child: SizedBox(
              child: GridView.builder(
                itemBuilder: (context, index) {
                  // Here we pass data from the list model
                  return _buildGridItem(
                    onTap: () {
                      var prodName = gridCategoryList[index]['name'];
                      if (prodName == 'أسماء ٱللَّهُ الحسنى') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllahNamesScreen()));
                      } else if (prodName == 'أذكار المسلم') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AzkarMuslimScreen()));
                      } else if (prodName == 'العشرة المبشرون بالجنة') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MobasharonScreen()));
                      } else if (prodName == 'صدقة جارية') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SadakaScreen()));
                      }
                    },
                    title: gridCategoryList[index]['name']!,
                    image: gridCategoryList[index]['picture']!,
                  );
                },
                itemCount: gridCategoryList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem({
    required VoidCallback onTap,
    required String title,
    required String image,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: Dimensions.radius20 * 2 - 5,
          backgroundImage: AssetImage(
            image,
          ),
          backgroundColor: Colors.white,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width10,
                right: Dimensions.width10),
            height: Dimensions.height10 * 5,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(Dimensions.radius20),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: Dimensions.font16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
