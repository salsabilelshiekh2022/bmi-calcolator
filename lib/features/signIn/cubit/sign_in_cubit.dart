import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../core/database/cache/cache_helper.dart';
import '../../../core/di/dependency_injection.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signInAnonymous() async {
    emit(SignInLoadingState());
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      getIt<CacheHelper>()
          .cacheData(key: "userId", value: userCredential.user!.uid);
      addUserProfile(uId: userCredential.user!.uid);
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      _signInAnonymousHandelException(e);
    }
  }

  void _signInAnonymousHandelException(FirebaseAuthException e) {
    if (e.code == 'operation-not-allowed') {
      emit(SignInFailureState(
          message:
              'Anonymous authentication has not been enabled for this project.'));
    } else {
      emit(SignInFailureState(message: 'Unknown error.'));
    }
  }

  Future<void> addUserProfile({required String uId}) async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.add({
      "uId": uId,
    });
  }
}
