import 'package:first_app/models/news_api/cubit/cubit.dart';
import 'package:first_app/models/news_api/cubit/states.dart';
import 'package:first_app/shared/componant/componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context, state){},
      builder: (context, state){
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: Text('Search'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (String value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (String? value){
                    if (value!.isEmpty) {
                      return 'search must be empty ..';
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(child: buildArticle(list, context , isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
