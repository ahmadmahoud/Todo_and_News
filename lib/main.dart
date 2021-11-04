import 'package:bloc/bloc.dart';
import 'package:first_app/layout/homeLayout.dart';
import 'package:first_app/layout/newsLayout.dart';
import 'package:first_app/models/news_api/cubit/cubit.dart';
import 'package:first_app/models/news_api/cubit/states.dart';
import 'package:first_app/models/todo/cubit/cubit.dart';
import 'package:first_app/models/todo/cubit/states.dart';
import 'package:first_app/shared/network/dio.dart';
import 'package:first_app/shared/network/local/cash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'models/counter/cubit/bloc_observer.dart';

  Future<void> main () async {

  // التاكد من ان جميع الmethode تعمل وبعدها يقوم بفتح التطبيق
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  bool? isDark = CashHelper.getBoolean(key: "dark") == null ? false : CashHelper.getBoolean(key: "dark");

  runApp(MyApp(isDark!));

  }

class MyApp extends StatelessWidget {
    final bool isDark;
    MyApp(this.isDark);

  @override
  Widget build(Object context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness()..getSports()..getScience()..changeMode(),
      child: BlocConsumer<NewsCubit , NewsStates> (
        listener: (context , state) {},
        builder: (context , state) {
          return MaterialApp(
          // delete debug in app
          debugShowCheckedModeBanner: false,
          themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
          // لون اتطبيق الرئيسي
          primarySwatch: Colors.deepOrange,
          textTheme: TextTheme(
          bodyText1: TextStyle(
          fontSize: 18 , color: HexColor('212121') , fontWeight: FontWeight.bold
          ),
          bodyText2: TextStyle( fontSize: 14 , color: HexColor('4A403A') , fontWeight: FontWeight.bold),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange,
          ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
          color: Colors.black54
          ),
          // سماح بتغيير لون الشريط العلوي

          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
          // لون شريط الايقونات
          statusBarColor: Colors.white,
          // لون الايقونات
          statusBarIconBrightness : Brightness.dark
          ),
          titleTextStyle: TextStyle(color: Colors.black , fontSize: 18.0 , fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          elevation: 1.0,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 20.0,

          selectedItemColor: Colors.deepOrange,
          ),

          ),
          darkTheme: ThemeData(
          // لون اتطبيق الرئيسي
          primarySwatch: Colors.deepOrange,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange,
          ),
          scaffoldBackgroundColor: HexColor('6B4F4F'),
          appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
          color: Colors.white
          ),
          // سماح بتغيير لون الشريط العلوي

          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
          // لون شريط الايقونات
          statusBarColor: HexColor('483434'),
          // لون الايقونات
          statusBarIconBrightness : Brightness.light
          ),
          titleTextStyle: TextStyle(color: Colors.white , fontSize: 18.0 , fontWeight: FontWeight.bold),
          backgroundColor: HexColor('483434'),
          elevation: 1.0,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: HexColor('483434'),
          elevation: 20.0,

          selectedItemColor: HexColor('EED6C4'),
          unselectedItemColor: HexColor('6B4F4F'),
          ),
          textTheme: TextTheme(
          bodyText1: TextStyle(
          fontSize: 18 , color: HexColor('FFF3E4') , fontWeight: FontWeight.bold
          ),
          bodyText2: TextStyle( fontSize: 14 , color: HexColor('C7BEA2') , fontWeight: FontWeight.bold),
          ),
          ),
          home: Directionality(
          textDirection: TextDirection.ltr,
          child: NewsLayout(),
          )
          );
        },
      ),
    );
  }
}


