import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/models/bmi_result.dart';
import 'previous_result_item.dart';

class PreviousResultsBody extends StatelessWidget {
  const PreviousResultsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: FirestorePagination(
        query: FirebaseFirestore.instance
            .collection('users')
            .doc(getIt<CacheHelper>().getData(key: "userId"))
            .collection('bmi results')
            .orderBy('date', descending: true),
        itemBuilder: (context, documentSnapshot, index) {
          final data = documentSnapshot.data() as Map<String, dynamic>;
          final finalResult = BmiResult.fromJson(data);
          return Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: PreviousResultsItem(
              result: finalResult,
            ),
          );
        },
        limit: 10,
        isLive: true,
      ),
    );
  }
}
