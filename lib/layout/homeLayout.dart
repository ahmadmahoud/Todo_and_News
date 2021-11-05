import 'package:first_app/models/todo/cubit/cubit.dart';
import 'package:first_app/models/todo/cubit/states.dart';
import 'package:first_app/shared/componant/componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var title_controller = TextEditingController();
  var time_controller = TextEditingController();
  var date_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // استخدام .. هي عمل اكسس للappcubit والوصول الى محتوياته بمعنى قمنا بجعله مثل المتغير
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..create_db(),

      child: BlocConsumer<AppCubit , AppStates>(
        listener: (BuildContext context, state) {
          if (state is AppInsertDataBaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, state) {
          var def = AppCubit.get(context);
          return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
          title: Text(
              def.appbar[def.currentIndex]
          ),
          ),
          body: state is AppGetDataBaseLoadingState ? Center(child: CircularProgressIndicator()) : AppCubit.get(context).screen[AppCubit.get(context).currentIndex],
          floatingActionButton: FloatingActionButton(
          onPressed: () async {
          if (def.isBottomSheetShow) {
          if (formKey.currentState!.validate()) {
            def.insert_database(
                title: title_controller.text,
                time: time_controller.text,
                date: date_controller.text);
          }

          } else {
          scaffoldKey.currentState!.showBottomSheet((context) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
          key: formKey,
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          defaultFormField(controller: title_controller,
          type: TextInputType.text,
          validate: (String? value){
          if (value!.isEmpty) {
          return 'title is null';
          }
          return null;
          },
          label: 'Task Title',
          prefix: Icons.title),

          SizedBox(height: 5,),
          defaultFormField(controller: time_controller,
          type: TextInputType.datetime,
          onTap: (){
          showTimePicker(context: context,
          initialTime: TimeOfDay.now())
              .then((value) {
             time_controller.text = value!.format(context);
          print(value.toString());
          });
          },
          validate: (String? value){
          if (value!.isEmpty) {
          return 'time is null';
          }
          return null;
          },
          label: 'Task Time',
          prefix: Icons.timer_sharp),
          SizedBox(height: 5,),
          defaultFormField(controller: date_controller,
          type: TextInputType.datetime,
          onTap: (){
          showDatePicker(context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2018),
          lastDate: DateTime(2025)).then((value) {
          date_controller.text = DateFormat.yMMMd().format(value!);
          print(value.toString());
          });

          },
          validate: (String? value){
          if (value!.isEmpty) {
          return 'time is null';
          }
          return null;
          },
          label: 'Task Time',
          prefix: Icons.timer_sharp),
          ],
          ),
          ),
          ),
          elevation: 20.0,
          ).closed.then((value) {
          def.changeBottomSheetState(
              isShow: false,
              icon: Icons.edit
          );
          });
         def.changeBottomSheetState(isShow: true,
             icon: Icons.add);
          }
          },
          child: Icon(def.iconData),
          ),
          bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 100.0,
          currentIndex: def.currentIndex,
          onTap: (index) {
         def.changeIndex(index);
          // setState(() {
          //   currentIndex = index;
          // });
          },
          items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.menu_rounded), label: 'Text'),
          BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_outline), label: 'Done'),
          BottomNavigationBarItem(
          icon: Icon(Icons.archive_outlined), label: 'Archive'),
          ],
          ),
          );
        },

      ),
    );
  }

}



