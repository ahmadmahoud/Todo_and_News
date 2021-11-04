import 'package:bloc/bloc.dart';
import 'package:first_app/models/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// انشاء كلاس لل Cubit والوراثه من كلاس state
class CounterCubit extends Cubit <CounterState> {

  // وضع كلاس الانشاء داخل سوبر
  CounterCubit () : super(CounterInitialState());

  // يسهل التعامل في عدة اماكن
  static CounterCubit get(context) => BlocProvider.of(context);

  // التغيرات
  int counter = 1;

  void minus () {
    counter-- ;
    emit(CounterMinusState());
  }

  void pluse () {
    counter++ ;
    emit(CounterPlusState());
  }

}