import 'package:flutter/material.dart';

import '../../../models/azkar_model.dart';
import '../../../shared/constants/dimensions.dart';

class AzkarDetailsScreen extends StatelessWidget {
  final String appBarTitle;
  const AzkarDetailsScreen({Key? key, required this.appBarTitle,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var morningZekr = morningZekrList;
    var nightZekr = nightZekrList;
    var prayZekr = prayZekrList;
    var mosqueZekr = mosqueZekrList;
    var sleepZekr = sleepZekrList;
    var wakeupZekr = wakeupZekrList;

    // Check if index is equal to item then choose the length of current index
    int zekrItemCount()
    {
      if(appBarTitle == 'أذكار الصباح')
      {
        return morningZekr.length;
      }else if(appBarTitle == 'أذكار المساء')
      {
        return nightZekr.length;
      }else if(appBarTitle == 'أذكار بعد الصلاة')
      {
        return prayZekr.length;
      }else if(appBarTitle == 'أذكار المسجد')
      {
        return mosqueZekr.length;
      }else if(appBarTitle == 'أذكار النوم')
      {
        return sleepZekr.length;
      }else
      {
        return wakeupZekr.length;
      }
    }

    // Check if appBarTitle is Equal to current index then choose the list[name] of current index
    String zekrItem(int index)
    {
      if(appBarTitle == 'أذكار الصباح')
      {
        return morningZekr[index]['zekr']!;
      }else if(appBarTitle == 'أذكار المساء')
      {
        return nightZekr[index]['zekr']!;
      }else if(appBarTitle == 'أذكار بعد الصلاة')
      {
        return prayZekr[index]['zekr']!;
      }else if(appBarTitle == 'أذكار المسجد')
      {
        return mosqueZekr[index]['zekr']!;
      }else if(appBarTitle == 'أذكار النوم')
      {
        return sleepZekr[index]['zekr']!;
      }else
      {
        return wakeupZekr[index]['zekr']!;
      }
    }

    // Check if appBarTitle is Equal to current index then choose the list[times] of current index
    String zekrTimesItem(int index)
    {
      if(appBarTitle == 'أذكار الصباح')
      {
        return morningZekr[index]['times']!;
      }else if(appBarTitle == 'أذكار المساء')
      {
        return nightZekr[index]['times']!;
      }else if(appBarTitle == 'أذكار بعد الصلاة')
      {
        return prayZekr[index]['times']!;
      }else if(appBarTitle == 'أذكار المسجد')
      {
        return mosqueZekr[index]['times']!;
      }else if(appBarTitle == 'أذكار النوم')
      {
        return sleepZekr[index]['times']!;
      }else
      {
        return wakeupZekr[index]['times']!;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.font26),),
      ),
      body: ListView.builder(
        itemCount: zekrItemCount(),
          itemBuilder: (context, index)
      {
        return _buildZekrContainerItem(
            zekr: zekrItem(index),
            times: zekrTimesItem(index),
        );
      },
      ),
    );
  }

  Widget _buildZekrContainerItem(
  {
    required String zekr,
    required String times,
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
          Text(
            zekr,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: Dimensions.font20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                top: Dimensions.height15,
                bottom: Dimensions.height15,
                left: Dimensions.width30,
                right: Dimensions.width30),
            margin: EdgeInsets.only(
              top: Dimensions.height20*2,
              bottom: Dimensions.height10,
              left: Dimensions.width10*7,
              right: Dimensions.width10*7,
            ),
            height: Dimensions.height10 * 6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius20),
            ),
            child: Text(
              'التكرار :  ${times}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Dimensions.font20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
