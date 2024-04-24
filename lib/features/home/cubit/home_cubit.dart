import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../core/database/cache/cache_helper.dart';
import '../../../core/di/dependency_injection.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int height = 160;
  int weight = 60;
  int age = 22;
  int? result;
  String? status;
  void heightPlus() {
    height = height + 1;
    emit(PlusNumberState());
  }

  void heightMinus() {
    if (height > 0) {
      height = height - 1;
      emit(MinusNumberState());
    }
  }

  void weightPlus() {
    weight = weight + 1;
    emit(PlusNumberState());
  }

  void weightMinus() {
    if (weight > 0) {
      weight = weight - 1;
      emit(MinusNumberState());
    }
  }

  void agePlus() {
    age = age + 1;
    emit(PlusNumberState());
  }

  void ageMinus() {
    if (age > 0) {
      age = age - 1;
      emit(MinusNumberState());
    }
  }

  void calculateBmi() {
    result = weight ~/ pow((height / 100), 2);
    getStatus();
    saveResult(getIt<CacheHelper>().getData(key: "userId"));
  }

  void getStatus() {
    if (result! < 18.5) {
      status = 'Underweight';
    } else if (result! >= 18.5 && result! < 25) {
      status = 'Normal';
    } else if (result! >= 25 && result! < 30) {
      status = 'Overweight';
    } else if (result! >= 30) {
      status = 'Obese';
    }
  }

  void saveResult(String id) async {
    emit(ResultSaveLoadingState());
    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .collection('bmi results')
          .add({
        'height': height,
        'weight': weight,
        'age': age,
        'bmi': result,
        'status': status,
        'date': DateTime.now().toString(),
      });

      await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .collection('bmi results')
          .doc(data.id)
          .set(
        {'id': data.id},
        SetOptions(merge: true),
      );

      emit(ResultSaveSuccessState());
    } catch (e) {
      emit(ResultSaveFailureState(message: e.toString()));
    }
  }
}
