import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../core/database/cache/cache_helper.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/models/bmi_result.dart';

part 'previous_results_state.dart';

class PreviousResultsCubit extends Cubit<PreviousResultsState> {
  PreviousResultsCubit() : super(PreviousResultsInitial());
  int? height, weight, age, result;
  String? status;
  final GlobalKey<FormState> formKey = GlobalKey();

  CollectionReference results = FirebaseFirestore.instance
      .collection('users')
      .doc(getIt<CacheHelper>().getData(key: "userId"))
      .collection('bmi results');

  Future<void> deleteResult(String id) {
    return results.doc(id).delete();
  }

  Future<void> editBmi(
    BmiResult bmiResult,
  ) {
    return results
        .doc(bmiResult.id)
        .update({
          'height': (height != null || height! > 0) ? height : bmiResult.height,
          'weight': (weight != null || weight! > 0) ? weight : bmiResult.weight,
          'age': (age != null || age! > 0) ? age : bmiResult.age,
          'bmi': result,
          'status': status,
          'date': DateTime.now().toString(),
        })
        .then((value) => print("result Updated"))
        .catchError((error) => print("Failed to update : $error"));
  }

  void calculateBmi(BmiResult bmiResult) {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      result = weight! ~/ pow((height! / 100), 2);
      getStatus();
      editBmi(bmiResult);
    }
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
}
