import 'package:flutter/material.dart';

import '../../../shared/constants/dimensions.dart';
import '../azkar_details/azkar_details_screen.dart';

class AzkarMuslimScreen extends StatelessWidget {
  const AzkarMuslimScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var azkarList = [
      {
        'name': 'أذكار الصباح',
      },
      {
        'name': 'أذكار المساء',
      },
      {
        'name': 'أذكار بعد الصلاة',
      },
      {
        'name': 'أذكار المسجد',
      },
      {
        'name': 'أذكار النوم',
      },
      {
        'name': 'أذكار الإستيقاظ',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'أذكار المسلم',
          style: TextStyle(
              fontSize: Dimensions.font26,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Dimensions.height30 * 4,
            child: Stack(
              children: [
                SizedBox(
                  height: Dimensions.height20 * 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(Dimensions.radius20),
                        bottomRight: Radius.circular(Dimensions.radius20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: Dimensions.screenHeight / 35,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.width30, right: Dimensions.width30),
                    child: Container(
                      height: Dimensions.height20 * 4,
                      width: Dimensions.width45 * 8,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(Dimensions.width10),
                        child: Text(
                          'الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُم بِذِكْرِ اللَّهِ ۗ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
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
            child: ListView.builder(
              itemCount: azkarList.length,
              itemBuilder: (context, index) {
                return _buildAzkarItem(
                  onTap: () {
                    var prodName = azkarList[index]['name'];
                    if (prodName == 'أذكار الصباح') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AzkarDetailsScreen(
                                appBarTitle: prodName!,
                              ),
                          ),
                      );
                    } else if (prodName == 'أذكار المساء') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AzkarDetailsScreen(
                            appBarTitle: prodName!,
                          ),
                        ),
                      );
                    } else if (prodName == 'أذكار بعد الصلاة') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AzkarDetailsScreen(
                            appBarTitle: prodName!,
                          ),
                        ),
                      );
                    } else if (prodName == 'أذكار المسجد') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AzkarDetailsScreen(
                            appBarTitle: prodName!,

                          ),
                        ),
                      );
                    } else if (prodName == 'أذكار النوم') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AzkarDetailsScreen(
                            appBarTitle: prodName!,
                          ),
                        ),
                      );
                    } else if (prodName == 'أذكار الإستيقاظ') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AzkarDetailsScreen(
                            appBarTitle: prodName!,
                          ),
                        ),
                      );
                    }
                  },
                  title: azkarList[index]['name']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAzkarItem({
    required VoidCallback onTap,
    required String title,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
            top: Dimensions.height15,
            bottom: Dimensions.height15,
            left: Dimensions.width45,
            right: Dimensions.width45),
        margin: EdgeInsets.only(
            top: Dimensions.height20*2,
            left: Dimensions.width10*5,
            right: Dimensions.width10*5,
        ),
        height: Dimensions.height10 * 6,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(Dimensions.radius20),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Dimensions.font16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
