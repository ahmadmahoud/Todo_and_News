import 'package:bloc/bloc.dart';
import 'package:first_app/models/news_api/cubit/states.dart';
import 'package:first_app/models/todo/Archivedtask.dart';
import 'package:first_app/models/todo/cubit/states.dart';
import 'package:first_app/models/todo/donetask.dart';
import 'package:first_app/models/todo/task.dart';
import 'package:first_app/shared/network/dio.dart';
import 'package:first_app/shared/network/local/cash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {

  AppCubit() : super (AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;
  late Database database;

  List<Map?>? Newtasks = [];
  List<Map?>? Donetasks = [];
  List<Map?>? Archivedtasks = [];

  bool isBottomSheetShow = false;
  IconData iconData = Icons.edit;

  List<Widget> screen = [
    NewTask(),
    DoneTask(),
    ArchivedTask(),
  ];

  List<String> appbar = [
    'NewTask',
    'DoneTask',
    'ArchivedTask',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNav());
  }

  void create_db() async {
    openDatabase('note.db', version: 1,
        onCreate: (database, version) {
          print('DataBase is Created');
          database
              .execute(
              'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT , date TEXT , time TEXT , status TEXT)')
              .then((value) {
            print('Table Created');
          }).catchError((error) {
            print('Error ${error.toString()}');
          });
        }, onOpen: (database) {
          getDataFromDB(database);
          print('DataBase is Opened');
        }).then((value) {
      database = value;
      emit(AppCreateDataBaseState());
    });
  }

  getDataFromDB(database) {
    Newtasks = [];
    Donetasks = [];
    Archivedtasks = [];

    emit(AppGetDataBaseLoadingState());
    database!.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'active')
          Newtasks!.add(element);
        else if (element['status'] == 'done')
          Donetasks!.add(element);
        else
          Archivedtasks!.add(element);
      });
      emit(AppGetDataBaseState());
    });
  }

  void updateData({
    required String status,
    required int id,
  }) async =>
      database.rawUpdate(
          'UPDATE tasks SET status = ? WHERE id = ?',
          ['$status', id]).then((value) {
        getDataFromDB(database);
        emit(AppUpdateDataBaseState());
      });

  void deleteData({
    required int id,
  }) async =>
      database.rawDelete(
          'DELETE FROM tasks WHERE id = ?', [id])

          .then((value) {
        getDataFromDB(database);
        emit(AppDeleteDataBaseState());
      });

  insert_database({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
          'INSERT INTO tasks(title , time , date , status) VALUES( "$title" , "$time" , "$date" , "active" )')
          .then((value) {
        print('done $value');
        emit(AppInsertDataBaseState());


        getDataFromDB(database);
      }).catchError((onError) {
        print('Error ${onError.toString()}');
      });
    });
  }

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShow = isShow;
    iconData = icon;
    emit(AppChangeBottomSheetState());
  }

}
