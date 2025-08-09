import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipe_app_withai/core/errors/failure.dart';
import 'package:recipe_app_withai/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


abstract interface class SupabaseDatasource{
  Session? get currentUserSession;


  Future<UserModel> signInWithGoogle();

  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
    required String phone
  });
  Future<UserModel> signInWithEmailPassword({
    required String email,
    required String password
  });
  Future<UserModel?> getCurrentUserData();
}

class  SupabaseDatasourceImpl implements SupabaseDatasource{
  final GoogleSignIn googleSignIn;
  final SupabaseClient supabaseClient;
  SupabaseDatasourceImpl({required this.supabaseClient, required this.googleSignIn});



  @override
  Future<UserModel> signInWithEmailPassword({ required email, required password}) async{
    try{

      final response = await supabaseClient.auth.signInWithPassword(password: password,email: email);
      if(response.user == null){
        throw Exception("user in null");
      }
      return UserModel.fromJson(response.user!.toJson());
    }
    catch (e) {
      if (e is AuthException) {
        throw ServerFailure(e.message);
      } else if (e is SocketException) {
        throw NetworkFailure("No Internet Connection");
      } else {
        throw Failure("Unexpected error: ${e.toString()}");
      }
    }

  }

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
    required String phone

  })async {
    try {
      final response = await supabaseClient.auth.signUp(password: password,
          email: email,
          data: {"name": name, "phone": phone});
      if (response.user == null) {
        throw Exception("user in null");
      }
      print("-----------${response.user?.email}");
      return UserModel.fromJson(response.user!.toJson());
    }
    catch (e) {
      if (e is AuthException) {
        if (e.message.contains("User already registered")) {
          throw ServerFailure("User already registered");
        }
        throw ServerFailure(e.message);
      } else if (e is SocketException) {
        throw NetworkFailure("no internet connection");
      } else {
        throw Failure("Exception: ${e.toString()}");
      }
    }
  }

  @override
  Session? get currentUserSession =>supabaseClient.auth.currentSession ;

  @override
  Future<UserModel?> getCurrentUserData() async{
    try{
      if(currentUserSession!=null){
        final userData = await supabaseClient.from('profiles').select().eq('id', currentUserSession!.user.id);
        return UserModel.fromJson(userData.first).copyWith(
          email: currentUserSession!.user.email,
        );
      }
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw Failure("User cancelled login");
      }

      final googleAuth = await googleUser.authentication;
      final idToken = googleAuth.idToken;
      final accessToken = googleAuth.accessToken;

      if (idToken == null || accessToken == null) {
        throw Failure("Missing Google tokens");
      }

      final response = await supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      if (response.user == null) {
        throw Failure("Failed to authenticate with Supabase");
      }

      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw ServerFailure(e.message);
    } on SocketException catch (_) {
      throw NetworkFailure("No internet connection");
    } catch (e) {
      if (e is PlatformException) {
        debugPrint('Google Sign-In PlatformException:');
        debugPrint('Error code: ${e.code}');
        debugPrint('Error message: ${e.message}');
        debugPrint('Error details: ${e.details}');
      } else {
        debugPrint('Google Sign-In Error: $e');
      }
      throw Failure(e.toString());
    }
  }


  // @override
  // Future<UserModel> signInWithGoogle() async {
  //   try {
  //
  //     const webClientId = '18488283895-6jcn666troknjnk889sprolq72qkva7h.apps.googleusercontent.com';
  //     const iosClientId = '18488283895-2r7d1d26d9s4bija3doph7fh2cm56g2j.apps.googleusercontent.com';
  //
  //     final googleSignIn = GoogleSignIn.instance;
  //       googleSignIn.initialize(
  //       clientId: iosClientId,
  //       serverClientId: webClientId,
  //     );
  //
  //     final googleAccount = await googleSignIn.authenticate();
  //     // if (googleUser == null) {
  //     //   throw Exception("User canceled sign in");
  //     // }
  //     //
  //     // final googleAuth = await googleUser.authentication;
  //
  //
  //     final idToken = googleAccount.authentication.idToken;
  //
  //     if (idToken == null) {
  //       throw Exception("Missing Google tokens");
  //     }
  //
  //     final response = await supabaseClient.auth.signInWithIdToken(
  //       provider: OAuthProvider.google,
  //       idToken: idToken,
  //
  //     );
  //     final auth = await googleAccount.authentication;
  //
  //     if (auth.idToken == null || auth.idToken == null) {
  //       print("Missing tokens-------------");
  //     }
  //     if (response.user == null) {
  //       throw Exception("User not logged in");
  //     }
  //
  //     return UserModel.fromJson(response.user!.toJson());
  //   } catch (e) {
  //     print("Google Sign In Error: $e");
  //     rethrow;
  //   }
  //
  //
  // }
}