import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialMediaAuth {
  // Future signInWithApple() async {
  //   String generateNonce([int length = 32]) {
  //     final charset =
  //         '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  //     final random = Random.secure();
  //     return List.generate(
  //         length, (_) => charset[random.nextInt(charset.length)]).join();
  //   }

  //   /// Returns the sha256 hash of [input] in hex notation.
  //   String sha256ofString(String input) {
  //     final bytes = utf8.encode(input);
  //     final digest = sha256.convert(bytes);
  //     return digest.toString();
  //   }

  //   final rawNonce = generateNonce();
  //   final nonce = sha256ofString(rawNonce);

  //   // Request credential for the currently signed in Apple account.
  //   final appleCredential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //       nonce: nonce,
  //       webAuthenticationOptions: WebAuthenticationOptions(
  //           clientId: "com.hikaea.app.login",
  //           redirectUri: Uri.parse(redirectUri)));

  //   // Create an `OAuthCredential` from the credential returned by Apple.
  //   final oauthCredential = OAuthProvider("apple.com").credential(
  //     idToken: appleCredential.identityToken,
  //     rawNonce: rawNonce,
  //   );

  //   UserCredential UserDATA =
  //       await FirebaseAuth.instance.signInWithCredential(oauthCredential);

  //   return UserDATA;
  // }

  // Future signInWithTwitter() async {
  //   // Create a TwitterLogin instance
  //   final twitterLogin = TwitterLogin(
  //       apiKey: 'P9JE7hJxcTWbGbwC7dzDPSxoC',
  //       apiSecretKey: 'tQXQMAFT7yQEbRG9Z7AP9Zn0c0B733i3o0zV9YHg4I2YtLjtjy',
  //       redirectURI: 'hikaeaapp://');

  //   // Trigger the sign-in flow
  //   final authResult = await twitterLogin.loginV2();
  //   print('authToken :: ${authResult.authToken!}');
  //   // Create a credential from the access token
  //   final twitterAuthCredential = TwitterAuthProvider.credential(
  //     accessToken: authResult.authToken!,
  //     secret: authResult.authTokenSecret!,
  //   );

  //   // Once signed in, return the UserCredential
  //   UserCredential UserDATA =
  //       await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);

  //   return UserDATA;
  // }

  // Future signInWithFacebook() async {
  //   LoginResult loginResult = await FacebookAuth.instance
  //       .login(permissions: ["public_profile", "email"]);

  //   if (loginResult.status == LoginStatus.success) {
  //     final userData =
  //         await FacebookAuth.instance.getUserData(fields: "email,name,id");
  //     final AccessToken? accessToken = await FacebookAuth.instance.accessToken;

  //     print('FB DATA :: $userData');

  //     AuthCredential facebookAuthCredential =
  //         await FacebookAuthProvider.credential(accessToken!.token);
  //     print('FB facebookAuthCredential :: $facebookAuthCredential');

  //     UserCredential UserDATA = await FirebaseAuth.instance
  //         .signInWithCredential(facebookAuthCredential);

  //     return UserDATA;
  //   }
  // }

  Future signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    // GoogleSignInAccount get user => user!;

    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userDATA =
        await FirebaseAuth.instance.signInWithCredential(credential);
    log(userDATA.toString());
    return userDATA;
  }
}
