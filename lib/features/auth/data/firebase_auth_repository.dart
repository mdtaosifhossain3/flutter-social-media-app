import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:social_media/features/auth/domain/entities/app_user.dart';
import 'package:social_media/features/auth/domain/repository/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<AppUser?> getCurrentUser() async {
    try {
      final firebase.User? firebaseUser = firebaseAuth.currentUser;
      if (firebaseUser == null) return null;
      return AppUser(
        id: firebaseUser.uid,
        email: firebaseUser.email ?? "",
        name: firebaseUser.displayName ?? "",
      );
    } catch (e) {
      throw Exception("Something went wrong $e");
    }
  }

  @override
  Future<AppUser?> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      AppUser user = AppUser(
        id: userCredential.user!.uid,
        email: email,
        name: "",
      );
      return user;
    } catch (e) {
      throw Exception("Login Failed: $e");
    }
  }

  @override
  Future<AppUser> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      AppUser user = AppUser(
        id: userCredential.user!.uid,
        email: email,
        name: name,
      );

      await _firestore.collection("users").doc(user.id).set(user.toJson());

      return user;
    } catch (e) {
      throw Exception("Registration Failed: $e");
    }
  }

  @override
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw Exception("Logout Failed $e");
    }
  }
}
