import 'package:flutter/material.dart';

import '../../../shared/constants/dimensions.dart';

class SadakaScreen extends StatelessWidget {
  const SadakaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sadakaList = [
      {
        'f_name': 'فاطمة محمد علي خليل',
        'l_name': 'محمد محمد إبراهيم',
      },
      {
        'f_name': 'عبدالرحمن وليد مقلد',
        'l_name': 'علي كويس ولي الدين',
      },
      {
        'f_name': 'حموده المصري',
        'l_name': 'إبراهيم العوامري',
      },
      {
        'f_name': 'أسامة وجدي موسى',
        'l_name': 'سعيد العوامري',
      },
      {
        'f_name': 'زينب العوامري',
        'l_name': 'سنية عبدالفتاح',
      },
      {
        'f_name': 'السيدة الهادي',
        'l_name': 'محمد شعبان العوامري',
      },
      {
        'f_name': 'أيمن سعد',
        'l_name': 'فتحي عبده',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'صدقة جارية',
          style: TextStyle(
            fontSize: Dimensions.font26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Dimensions.height30 * 6,
            child: Stack(
              children: [
                SizedBox(
                  height: Dimensions.height20 * 4,
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
                    ],
                  ),
                ),
                Positioned(
                  top: Dimensions.screenHeight / 25,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.width30, right: Dimensions.width30),
                    child: Container(
                      height: Dimensions.height20 * 6.5,
                      width: Dimensions.width45 * 8,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(Dimensions.width10),
                        child: Text(
                          'بسم الله الرحمن الرحيم \n  يَا أَيَّتُهَا النَّفْسُ الْمُطْمَئِنَّةُ ارْجِعِي إِلَى رَبِّكِ رَاضِيَةً مَرْضِيَّةً فَادْخُلِي فِي عِبَادِي وَادْخُلِي جَنَّتِي \n صدق الله العظيم',
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
            child: Padding(
              padding: EdgeInsets.only(top: Dimensions.height30),
              child: SizedBox(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    // Here we pass data from the list model
                    return _buildGridItem(
                      firstName: sadakaList[index]['f_name']!,
                      lastName: sadakaList[index]['l_name']!,
                    );
                  },
                  itemCount: sadakaList.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem({
    required String firstName,
    required String lastName,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
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
              firstName,
              style: TextStyle(
                fontSize: Dimensions.font20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
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
              lastName,
              style: TextStyle(
                fontSize: Dimensions.font20,
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
