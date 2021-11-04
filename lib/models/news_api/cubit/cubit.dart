import 'package:bloc/bloc.dart';
import 'package:first_app/models/news_api/business.dart';
import 'package:first_app/models/news_api/cubit/states.dart';
import 'package:first_app/models/news_api/science.dart';
import 'package:first_app/models/news_api/settings.dart';
import 'package:first_app/models/news_api/sports.dart';
import 'package:first_app/shared/network/dio.dart';
import 'package:first_app/shared/network/local/cash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;


  List<BottomNavigationBarItem> listBottomIndex = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_sharp),
      label: 'Business'
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_baseball),
      label: 'Sports'
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science'
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings'
    ),
  ];

  List<Widget> screen = [
    Business(),
    Sports(),
    Science(),
    Settings(),

  ];

void changeBottomNav(int index) {
  currentIndex = index;
  if (index ==1)
    getSports();
  if(index == 2)
    getScience();
  emit(NewsBottomNavState());
}

List <dynamic> business = [];
List <dynamic> sports = [];
List <dynamic> science = [];

void getBusiness() {
  emit(NewsLoadingState());
  if (business.length == 0) {
    DioHelper.getData(
        url: 'v2/top-headlines', query: {
      "country":"eg",
      "category":"business",
      "apiKey":"6b21a07f7b124651bc25e4a8e7ab12bb",
    }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());

    }).catchError((onError){
      print(onError.toString());
      emit(NewsGetBusinessErrorState(onError.toString()));

    });
  } else {
    emit(NewsGetBusinessSuccessState());
  }
}
void getScience() {
  emit(NewsLoadingScienceState());
  if (science.length ==0 ) {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      "country":"eg",
      "category":"science",
      "apiKey":"6b21a07f7b124651bc25e4a8e7ab12bb",
    }).then((value) {
      print(value.data['totalResults']);
      print(value.data['articles'][5]['title']);
      print(value.data['articles'][3]['author']);
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());

    }).catchError((onError){
      print(onError.toString());
      emit(NewsGetScienceErrorState(onError.toString()));

    });
  } else {
    emit(NewsGetScienceSuccessState());
  }
}
void getSports() {
  emit(NewsLoadingSportsState());
  if (sports.length ==0 ) {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      "country":"eg",
      "category":"sport",
      "apiKey":"6b21a07f7b124651bc25e4a8e7ab12bb",
    }).then((value) {
      print(value.data['totalResults']);
      print(value.data['articles'][5]['title']);
      print(value.data['articles'][3]['author']);
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());

    }).catchError((onError){
      print(onError.toString());
      emit(NewsGetSportsErrorState(onError.toString()));

    });
  } else {
    emit (NewsGetSportsSuccessState());
  }
}

  bool isDark = false;

  void changeMode({bool? fromShared}) {
    if(fromShared != null) {
      isDark = fromShared;
      emit(ChangeModeThemeApp());
    } else {
      isDark = !isDark;
      CashHelper.putBoolean(key: 'dark' , value: isDark ).then((value) {
      emit(ChangeModeThemeApp());

    });
    }
  }

  void changeIconMode({bool? fromShared}) {
    isDark = !isDark;
    emit(ChangeModeThemeIconApp());
  }

  List <dynamic> search = [];

  void getSearch(String value) {
    emit(NewsLoadingSearchState());

    DioHelper.getData(
        url: 'v2/everything',
        query:
        {
          'q':'$value',
          'apiKey':'6b21a07f7b124651bc25e4a8e7ab12bb',
        },

    ).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState(error));
      });

  }


}