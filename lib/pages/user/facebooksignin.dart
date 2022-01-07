

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();

// String name='';
// String email='';
// String imageUrl='';

// Future<String> signInWithGoogle() async {
//   await Firebase.initializeApp();

//   final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount!.authentication;

//   final AuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );

//   final UserCredential authResult =
//       await _auth.signInWithCredential(credential);
//   final User user = authResult.user!;

//   if (user != null) {
//     // Checking if email and name is null
//     assert(user.email != null);
//     assert(user.displayName != null);
//     assert(user.photoURL != null);

//     name = user.displayName!;
//     email = user.email!;
//     imageUrl = user.photoURL!;

//     // Only taking the first part of the name, i.e., First Name
//     if (name.contains(" ")) {
//       name = name.substring(0, name.indexOf(" "));
//     }

//     assert(!user.isAnonymous);
//     assert(await user.getIdToken() != null);

//     final User currentUser = _auth.currentUser!;
//     assert(user.uid == currentUser.uid);

//     print('signInWithGoogle succeeded: $user');

//     return '$user';
//   }

//   return '$user';
// }

// Future<UserCredential> signInWithFacebook() async {
//     // Trigger the sign-in flow
//     final LoginResult loginResult = await FacebookAuth.instance.login();

//     // Create a credential from the access token
//     final OAuthCredential facebookAuthCredential =
//         FacebookAuthProvider.credential(loginResult.accessToken!.token);
//     if (loginResult.status == LoginStatus.success) {
//       final userData = await FacebookAuth.instance.getUserData(
//         fields: 'email,name,picture.type(large)',
//       );
//       print(userData);
//     }
//     // Once signed in, return the UserCredential
//     return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

//     final User user = loginResult.user!;

//   if (user != null) {
//     // Checking if email and name is null
//     assert(user.email != null);
//     assert(user.displayName != null);
//     assert(user.photoURL != null);

//     name = user.displayName!;
//     email = user.email!;
//     imageUrl = user.photoURL!;

//     // Only taking the first part of the name, i.e., First Name
//     if (name.contains(" ")) {
//       name = name.substring(0, name.indexOf(" "));
//     }

//     assert(!user.isAnonymous);
//     assert(await user.getIdToken() != null);

//     final User currentUser = _auth.currentUser!;
//     assert(user.uid == currentUser.uid);

//     print('signInWithGoogle succeeded: $user');

//     return '$user';
//   }

//   return '$user';
    
//   }

// Future<void> signOutGoogle() async {
//   await googleSignIn.signOut();

//   print("User Signed Out");
// }







