import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_tracker/app/api/data/response/model/auth/sign_in_response.dart';
import 'package:task_tracker/app/api/service/profile_service/profile_service.dart';
import 'package:task_tracker/app/modules/profile/controllers/profile_controller.dart';
import 'package:task_tracker/app/utils/utility.dart';

class ProfileUpdateController extends GetxController {
  XFile? profileImage;
  String? userImage;
  ProfileController profileController = Get.find();
  ProfileService profileService = Get.find();
  GlobalKey<FormState> profileUpdateKey = GlobalKey();

  User? user;
  @override
  void onInit() async {
    user = profileController.user;
    await setInitialDate();
    super.onInit();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  void updateProfile(BuildContext context) async {
    if (profileUpdateKey.currentState?.validate() == true) {
      User? updatedModel = User(
          name: nameController.text,
          age: int.tryParse(ageController.text),
          email: emailController.text.toLowerCase().trim());
      await profileService.updateUser(user: updatedModel);
      if (profileImage != null) {
        await profileService.uploadImage(image: File(profileImage!.path));
      }

      await profileController.getUser();
      Get.back();
      showSnackBar("Profile Updated successfully!", context);
    }
  }

  pickProfileImage(BuildContext context) async {
    var image = await showImagePicker(context);
    if (image != null) {
      profileImage = image;
      update();
    }
    update();
  }

  setInitialDate() {
    nameController.text = user?.name ?? '';
    ageController.text = user?.age.toString() ?? '';
    emailController.text = user?.email ?? '';
    userImage = profileController.userImageUrl;
    update();
  }
}
