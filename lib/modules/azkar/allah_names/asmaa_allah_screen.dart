import 'package:flutter/material.dart';

import '../../../models/allah_names_model.dart';
import '../../../shared/constants/dimensions.dart';

class AllahNamesScreen extends StatelessWidget {
  const AllahNamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var allahNames = allahNamesList;
    var intro = introduction;
    return Scaffold(
      appBar: AppBar(
        title: Text('أسماء ٱللَّهُ الحسنى', style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.font26),),
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.only(top: Dimensions.height20 , left: Dimensions.width30, right: Dimensions.width30,),
            margin: EdgeInsets.only(top: Dimensions.height30 , left: Dimensions.width30, right: Dimensions.width30,),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(Dimensions.radius20),
            ),
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height10,
                bottom: Dimensions.height30,
                left: Dimensions.width10,
                right: Dimensions.width10,
              ),
              child: Text(
                intro,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: Dimensions.font20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: allahNames.length,
            itemBuilder: (context, index)
            {
              return _buildAsmaaAllahContainerItem(
                name: allahNames[index]['name']!,
                details: allahNames[index]['details']!,
              );
            },
          ),
        ],
      ),
    );
  }
  Widget _buildAsmaaAllahContainerItem(
      {
        required String name,
        required String details,
      })
  {
    return Container(
      padding: EdgeInsets.only(top: Dimensions.height20 , left: Dimensions.width30, right: Dimensions.width30,),
      margin: EdgeInsets.only(top: Dimensions.height30 , left: Dimensions.width30, right: Dimensions.width30,),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30),
            margin: EdgeInsets.only(
              top: Dimensions.height10,
              bottom: Dimensions.height30,
              left: Dimensions.width10*7,
              right: Dimensions.width10*7,
            ),
            height: Dimensions.height10 * 6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius20),
            ),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Dimensions.font26,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: Dimensions.height10,
              bottom: Dimensions.height30,
              left: Dimensions.width10,
              right: Dimensions.width10,
            ),
            child: Text(
              details,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: Dimensions.font26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
