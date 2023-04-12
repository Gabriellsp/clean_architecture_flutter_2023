import 'package:clean_architecture_flutter_2023/features/data/models/user_model.dart';
import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/login/i_login_remote_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginRemoteDataSourceImpl extends ILoginRemoteDataSource {
  final FirebaseFirestore fireStore;
  final FirebaseAuth authFirebase;
  final GoogleSignIn authGoogle;

  LoginRemoteDataSourceImpl(
      {required this.fireStore,
      required this.authFirebase,
      required this.authGoogle});

  @override
  Future<void> googleAuth() async {
    final usersCollection = fireStore.collection("users");
    try {
      final GoogleSignInAccount? account = await authGoogle.signIn();
      final GoogleSignInAuthentication googleAuth =
          await account!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final information =
          (await authFirebase.signInWithCredential(credential)).user;
      usersCollection
          .doc(authFirebase.currentUser!.uid)
          .get()
          .then((user) async {
        if (!user.exists) {
          var uid = authFirebase.currentUser!.uid;
          var newUser = UserModel(
                  name: information!.displayName!,
                  email: information.email!,
                  phoneNumber: information.phoneNumber == null
                      ? ""
                      : information.phoneNumber!,
                  profileUrl:
                      information.photoURL == null ? "" : information.photoURL!,
                  isOnline: false,
                  status: "",
                  dob: "",
                  gender: "",
                  uid: information.uid)
              .toDocument();

          usersCollection.doc(uid).set(newUser);
        }
      }).whenComplete(() {
        if (kDebugMode) {
          print("New User Created Successfully");
        }
      }).catchError((e) {
        if (kDebugMode) {
          print("getInitializeCreateCurrentUser ${e.toString()}");
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> signOut() async {
    await authFirebase.signOut();
    await authGoogle.signOut();
  }

  @override
  bool userIsAuthenticated() {
    var isAuthenticated = authFirebase.currentUser != null ? true : false;
    return isAuthenticated;
  }

  @override
  String getCurrentUId() => authFirebase.currentUser!.uid;
}
