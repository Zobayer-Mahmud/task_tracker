import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_tracker/app/utils/utility.dart';

class ProfileUpdateController extends GetxController {
  XFile? profileImage;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  void updateProfile() {
    Get.back();
  }

   pickProfileImage(BuildContext context)async {
    print("profileImage 1:${profileImage!=null}");

    var image = await showImagePicker(context);
    if(image!=null){
      print("profileImage:${profileImage != null}");
    }
    update();
  }
}
