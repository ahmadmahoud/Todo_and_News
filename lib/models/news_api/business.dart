import 'package:first_app/models/news_api/cubit/cubit.dart';
import 'package:first_app/models/news_api/cubit/states.dart';
import 'package:first_app/shared/componant/componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Business extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;

        return buildArticle(list, context);
      },
    );
  }
}
