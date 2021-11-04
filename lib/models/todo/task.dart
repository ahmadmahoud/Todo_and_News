import 'package:first_app/models/todo/cubit/cubit.dart';
import 'package:first_app/models/todo/cubit/states.dart';
import 'package:first_app/shared/componant/componant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTask extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit , AppStates>(
        listener: (context , state){},
        builder: (context , state){

          var tasks = AppCubit.get(context).Newtasks;
          return buildTask(tasks: tasks , context: context);

        },
    );
  }
}


