import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // Observable for hiding/showing Password.
  final privacyPolicy = true.obs; // Observable for Privacy Policy CheckBox.
  final email = TextEditingController(); // Controller For Email Input.
  final firstName = TextEditingController(); // Controller For FirstName Input.
  final lastName = TextEditingController(); // Controller For lastName Input.
  final userName = TextEditingController(); // Controller For UserName Input.
  final password = TextEditingController(); // Controller For Password Input.
  final phoneNumber =
      TextEditingController(); // Controller For Phone Number Input.
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form Key For Validation.

  /// SignUp
  void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        TImages.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();

        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();

        return;
      }
      ;

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        // Remove Loader
        TFullScreenLoader.stopLoading();

        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read  and accept Privacy Policy & Terms of Use.',
        );
        return;
      }

      // Register User in the firebase Authentication and save user in firestore.
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      // Save Authenticated user data in firebase firestore.
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue. ',
      );

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Some Generic Error to user.
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
