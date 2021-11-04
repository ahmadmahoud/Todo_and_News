import 'package:first_app/shared/componant/componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ArchivedTask extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , state){},
      builder: (context , state){

        var tasks = AppCubit.get(context).Archivedtasks;
        return buildTask(tasks: tasks , context: context);

      },
    );
  }
}
