import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/azkar/azkar.dart';
import '../../../modules/quran/quran.dart';
import '../../../modules/sebha/sebha.dart';
import 'states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  // Get context to Easily use in a different places in all Project
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 1;

  List<String> appBarTitle = const
  [
    'قرآن',
    'أذكار',
    'سبحة',
  ];

  // List of Screens
  List<Widget> screens = const
  [
    QuranScreen(),
    AzkarScreen(),
    SebhaScreen(),
  ];


  // Function To Change BottomNavigationBar Items by emit The State
  void changeBottomNavBar (int index)
  {
    currentIndex = index;
    emit(AppBottomNavigationBarState());
  }


  //
  var counter = 0;
  // Function To Change Sebha Counter Plus Items by emit The State
  void changeCounterPlus ()
  {
    counter = ++counter;
    emit(AppCounterPlusState());
  }

  // Function To Reset Sebha Counter Items by emit The State
  void resetCounter ()
  {
    counter = 0;
    emit(AppResetCounterState());
  }



}
