import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel _userModel(User user){
    return user!=null ? UserModel(uid: user.uid):null;
  }
  Stream<UserModel> get user {
    return _auth.authStateChanges()
        .map(_userModel);
  }
  Future signInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userModel(user);

    } catch(e){
      return null;
    }
  }
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user =result.user;
      return _userModel(user);
    }
    catch(e){
      print(e.toString());
      return null;

    }
  }
  Future registerWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user =result.user;
      return _userModel(user);
    }
    catch(e){
      print(e.toString());
      return null;

    }
  }
  Future signOutAnon() async {
    try{
      return await _auth.signOut();
  }
  catch(e){
      print(e.toString());
  }}
}