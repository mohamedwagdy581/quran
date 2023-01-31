import 'package:flutter/material.dart';

import '../../../shared/constants/dimensions.dart';
import 'mobasharon_details/mobasharon_details_screen.dart';


class MobasharonScreen extends StatelessWidget {
  const MobasharonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'العشرة المبشرون بالجنة',
          style: TextStyle(
            fontSize: Dimensions.font26,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height45,
            ),
            _buildCircleItem(
              onTap: ()
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MobasharonDetailsScreen(image: 'assets/images/Abu_bakr.png',),));
              },
              image: 'assets/images/Abu_bakr.png',
            ),
            SizedBox(
              height: Dimensions.height45,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircleItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobasharonDetailsScreen(image: 'assets/images/Uthman.png',),));
                  },
                  image: 'assets/images/Uthman.png',
                ),
                _buildCircleItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobasharonDetailsScreen(image: 'assets/images/Ali.png',),));
                  },
                  image: 'assets/images/Ali.png',
                ),
                _buildCircleItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobasharonDetailsScreen(image: 'assets/images/Umar.png',),));
                  },
                  image: 'assets/images/Umar.png',
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height45,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircleItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobasharonDetailsScreen(image: 'assets/images/aof.png',),));
                  },
                  image: 'assets/images/aof.png',
                ),
                _buildCircleItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobasharonDetailsScreen(image: 'assets/images/awam.png',),));
                  },
                  image: 'assets/images/awam.png',
                ),
                _buildCircleItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobasharonDetailsScreen(image: 'assets/images/talha.png',),));
                  },
                  image: 'assets/images/talha.png',
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height45,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircleItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobasharonDetailsScreen(image: 'assets/images/garah.png',),));
                  },
                  image: 'assets/images/garah.png',
                ),
                _buildCircleItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobasharonDetailsScreen(image: 'assets/images/zayd.png',),));
                  },
                  image: 'assets/images/zayd.png',
                ),
                _buildCircleItem(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobasharonDetailsScreen(image: 'assets/images/saad.png',),));
                  },
                  image: 'assets/images/saad.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleItem({
    required VoidCallback onTap,
    required String image,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: Dimensions.radius30 * 2,
        backgroundImage: AssetImage(image),
      ),
    );
  }
}
