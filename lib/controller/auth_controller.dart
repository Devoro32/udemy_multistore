import 'package:multistore/exports.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerNewUser(
      String email, String fullname, String password) async {
    String res = 'something went wrong';
    try {
      //we want to create the user first in the auth and then in firestore
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection('buyers').doc(userCredential.user!.uid).set(
        {
          'fullName': fullname,
          'profileImage': "",
          'uid': userCredential.user!.uid,
          'email': email,
          'pinCode': "",
          'locality': '',
          'city': '',
          'state': '',
        },
      );
      res = 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        res = 'The account already exists for that email.';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  //?Login User
  Future<String> loginUser(String email, String password) async {
    String res = 'Something went wrong';

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      res = 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        res = 'Wrong password provided for that user.';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}
