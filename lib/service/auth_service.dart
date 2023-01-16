import 'package:chatting_app/helper/helper_function.dart';
import 'package:chatting_app/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // login fxn

  Future<dynamic> loginUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      User? user = (await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      print(e);
    }
  }


  // register fxn
  Future<dynamic> registerUserWithEmailAndPassword(
    String fullName,
    String email,
    String password,
  ) async {
    try {
      User? user = (await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        // call our database service to set the user data.
        await DatabaseService(uid: user.uid).setUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      print(e);
    }
  }

  // logout or signout fxn
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF('');
      await HelperFunctions.saveUserNameSF('');
      await firebaseAuth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
