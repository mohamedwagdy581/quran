import 'package:flutter/material.dart';

import '../../../../models/mobasharon_model.dart';
import '../../../../shared/constants/dimensions.dart';


class MobasharonDetailsScreen extends StatelessWidget {
  final String image;

  const MobasharonDetailsScreen({Key? key, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var aboBakr = aboBakrList;
    var omar = omarList;
    var ali = aliList;
    var othman = othmanList;
    var talha = talhaList;
    var awam = awamList;
    var aof = aofList;
    var saad = saadList;
    var sayed = sayedList;
    var garah = garahList;

    // Check if appBarTitle is Equal to current index then choose the list[AppBarTitle] of current index
    String appBarTitle()
    {
      if(image == 'assets/images/Abu_bakr.png')
      {
        return 'أبو بَكر';
      }else if(image == 'assets/images/Umar.png')
      {
        return 'عمر بن الخطاب';
      }else if(image == 'assets/images/Ali.png')
      {
        return 'علي بن أبي طالب';
      }else if(image == 'assets/images/Uthman.png')
      {
        return 'عثمان بن عفَّان';
      }else if(image == 'assets/images/talha.png')
      {
        return 'طَلْحَة بن عُبَيْد اللّه';
      }else if(image == 'assets/images/awam.png')
      {
        return 'الزُّبَيْرُ بن العَوَّام';
      }else if(image == 'assets/images/aof.png')
      {
        return 'عبد الرّحمن بن عوف';
      }else if(image == 'assets/images/saad.png')
      {
        return 'سَعْد بن أَبي وقاص';
      }else if(image == 'assets/images/zayd.png')
      {
        return 'سَعِيد بن زَيْد';
      }else
      {
        return 'أبو عبيدة بن الجراح';
      }
    }
    // Check if appBarTitle is Equal to current index then choose the list[name] of current index
    String itemName()
    {
      if(image == 'assets/images/Abu_bakr.png')
      {
        return aboBakr[0]['name']!;
      }else if(image == 'assets/images/Umar.png')
      {
        return omar[0]['name']!;
      }else if(image == 'assets/images/Ali.png')
      {
        return ali[0]['name']!;
      }else if(image == 'assets/images/Uthman.png')
      {
        return othman[0]['name']!;
      }else if(image == 'assets/images/Abu_bakr.png')
      {
        return aboBakr[0]['name']!;
      }else if(image == 'assets/images/talha.png')
      {
        return talha[0]['name']!;
      }else if(image == 'assets/images/awam.png')
      {
        return awam[0]['name']!;
      }else if(image == 'assets/images/aof.png')
      {
        return aof[0]['name']!;
      }else if(image == 'assets/images/saad.png')
      {
        return saad[0]['name']!;
      }else if(image == 'assets/images/zayd.png')
      {
        return sayed[0]['name']!;
      }else
      {
        return garah[0]['name']!;
      }
    }

    // Check if appBarTitle is Equal to current index then choose the list[death_place] of current index
    String itemDeathPlace()
    {
      if(image == 'assets/images/Abu_bakr.png')
      {
        return aboBakr[0]['death_place']!;
      }else if(image == 'assets/images/Umar.png')
      {
        return omar[0]['death_place']!;
      }else if(image == 'assets/images/Ali.png')
      {
        return ali[0]['death_place']!;
      }else if(image == 'assets/images/Uthman.png')
      {
        return othman[0]['death_place']!;
      }else if(image == 'assets/images/talha.png')
      {
        return talha[0]['death_place']!;
      }else if(image == 'assets/images/awam.png')
      {
        return awam[0]['death_place']!;
      }else if(image == 'assets/images/aof.png')
      {
        return aof[0]['death_place']!;
      }else if(image == 'assets/images/saad.png')
      {
        return saad[0]['death_place']!;
      }else if(image == 'assets/images/zayd.png')
      {
        return sayed[0]['death_place']!;
      }else
      {
        return garah[0]['death_place']!;
      }
    }

    // Check if appBarTitle is Equal to current index then choose the list[life] of current index
    String itemLife()
    {
      if(image == 'assets/images/Abu_bakr.png')
      {
        return aboBakr[0]['life']!;
      }else if(image == 'assets/images/Umar.png')
      {
        return omar[0]['life']!;
      }else if(image == 'assets/images/Ali.png')
      {
        return ali[0]['life']!;
      }else if(image == 'assets/images/Uthman.png')
      {
        return othman[0]['life']!;
      }else if(image == 'assets/images/talha.png')
      {
        return talha[0]['life']!;
      }else if(image == 'assets/images/awam.png')
      {
        return awam[0]['life']!;
      }else if(image == 'assets/images/aof.png')
      {
        return aof[0]['life']!;
      }else if(image == 'assets/images/saad.png')
      {
        return saad[0]['life']!;
      }else if(image == 'assets/images/zayd.png')
      {
        return sayed[0]['life']!;
      }else
      {
        return garah[0]['life']!;
      }
    }

    // Check if appBarTitle is Equal to current index then choose the list[notes] of current index
    String itemNotes()
    {
      if(image == 'assets/images/Abu_bakr.png')
      {
        return aboBakr[0]['notes']!;
      }else if(image == 'assets/images/Umar.png')
      {
        return omar[0]['notes']!;
      }else if(image == 'assets/images/Ali.png')
      {
        return ali[0]['notes']!;
      }else if(image == 'assets/images/Uthman.png')
      {
        return othman[0]['notes']!;
      }else if(image == 'assets/images/talha.png')
      {
        return talha[0]['notes']!;
      }else if(image == 'assets/images/awam.png')
      {
        return awam[0]['notes']!;
      }else if(image == 'assets/images/aof.png')
      {
        return aof[0]['notes']!;
      }else if(image == 'assets/images/saad.png')
      {
        return saad[0]['notes']!;
      }else if(image == 'assets/images/zayd.png')
      {
        return sayed[0]['notes']!;
      }else
      {
        return garah[0]['notes']!;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle(),
          style: TextStyle(
            fontSize: Dimensions.font26,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: Dimensions.height20*3,),
          CircleAvatar(
            radius: Dimensions.radius30 * 2,
            backgroundColor: Colors.white,
            child: Image.asset(image),
          ),
          _buildItems(title: 'الإسم', description: itemName(),),
          _buildItems(title: 'فترة حياتة', description: itemLife(),),
          _buildItems(title: 'مكان الدفن', description: itemDeathPlace(),),
          _buildItems(title: 'ملاحظات', description: itemNotes(),),
        ],
      ),
    );
  }

  Widget _buildItems(
  {
    required String title,
    required String description,
})
  {
    return Column(
      children: [
        SizedBox(height: Dimensions.height10,),
        Container(
          padding: EdgeInsets.only(
            top: Dimensions.height10,
            bottom: Dimensions.height10,
          ),
          margin: EdgeInsets.only(
            top: Dimensions.height30,
            left: Dimensions.width30*4,
            right: Dimensions.width30*4,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(Dimensions.radius20),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: Dimensions.font26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: Dimensions.height10,),
        Container(
          padding: EdgeInsets.only(
            top: Dimensions.height10,
            left: Dimensions.width30,
            right: Dimensions.width45,
          ),
          child: Text(
              description,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: Dimensions.font20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
