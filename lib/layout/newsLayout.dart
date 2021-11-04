import 'package:first_app/models/news_api/cubit/cubit.dart';
import 'package:first_app/models/news_api/cubit/states.dart';
import 'package:first_app/models/news_api/search/searchNews.dart';
import 'package:first_app/models/todo/cubit/cubit.dart';
import 'package:first_app/shared/componant/componant.dart';
import 'package:first_app/shared/network/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context , state) {},
      builder: (context , state) {

        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(onPressed: (){
                navigateTo(context, SearchScreen());
              }, icon: Icon(Icons.search)),
              IconButton(onPressed: (){
                NewsCubit.get(context).changeMode();
              },
                  icon: NewsCubit.get(context).isDark ? Icon(Icons.wb_sunny) : Icon(Icons.brightness_2_outlined)) ,
            ],
          ),
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar:
          BottomNavigationBar(
            currentIndex: cubit.currentIndex,
              onTap: (index) { cubit.changeBottomNav(index); } ,
              items: cubit.listBottomIndex,
          ),
        );
      },

    );
  }
}

