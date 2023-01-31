import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/curved_nav_bar.dart';
import '../shared/components/mydrawer.dart';
import '../shared/constants/dimensions.dart';
import '../shared/network/cubit/cubit.dart';
import '../shared/network/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            drawer: const MyDrawer(),
            appBar: AppBar(
              centerTitle: true,
              title: Text(cubit.appBarTitle[cubit.currentIndex], style: TextStyle(fontSize: Dimensions.font26),),

            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 1,
            backgroundColor: Color.fromARGB(255, 253, 247, 230),
            color: Colors.green,
            height: 50,
            animationDuration: const Duration(microseconds: 200),
            items: [
              bottomNavItemIcon(
                icon: 'assets/images/q.png',
              ),
              bottomNavItemIcon(
                icon: 'assets/images/a.png',
              ),
              bottomNavItemIcon(
                icon: 'assets/images/s.png',
              ),
            ],
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            letIndexChange: (index) => true,
          ),
          );
        },
      ),
    );
  }
  Widget bottomNavItemIcon({
    required String icon,
  }) =>
      CircleAvatar(
        backgroundImage: AssetImage(icon),
        backgroundColor: Colors.white,
        radius: Dimensions.radius10*5/2,
      );

}
