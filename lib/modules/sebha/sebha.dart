import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/constants/dimensions.dart';
import '../../shared/network/cubit/cubit.dart';
import '../../shared/network/cubit/states.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Stack(
          children: [
            Image.asset(
              'assets/images/kaba.jpeg',
              fit: BoxFit.cover,
              height: Dimensions.screenHeight,
              width: Dimensions.screenWidth,
            ),
            Positioned(
              top: Dimensions.screenHeight / 5,
              left: Dimensions.screenWidth / 4,
              right: Dimensions.screenWidth / 4,
              child: Column(
                children: [
                  Text(
                    cubit.counter.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  Text(
                    'عدد التسبيح',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: Dimensions.height45 * 2,
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                      cubit.changeCounterPlus();
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height10,
                          bottom: Dimensions.height10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: Image.asset(
                            'assets/images/finger.png',
                            height: 40,
                            width: 40,
                          )),
                          Expanded(
                              child: Text(
                            'تسبيح',
                            style: TextStyle(
                              fontSize: Dimensions.font26,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height45,
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                      cubit.resetCounter();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(Dimensions.radius30),
                      ),
                      child: Icon(
                        Icons.refresh,
                        size: Dimensions.iconSize24 * 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
