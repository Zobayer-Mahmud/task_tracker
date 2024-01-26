import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:task_tracker/app/modules/app_widgets/image/image_picker_button.dart';

void showSnackBar(String text, BuildContext context, {int? durationSeconds}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    duration: Duration(seconds: durationSeconds ?? 3),
  ));
  // scaffoldKey.currentState.showSnackBar(snackBar);
}

void showFlutterToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
const _chars_text = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

String getRandomTextString({required int length}) =>
    String.fromCharCodes(Iterable.generate(length,
        (_) => _chars_text.codeUnitAt(_rnd.nextInt(_chars_text.length))));

int getRandomNumber({int? length}) => _rnd.nextInt(length ?? 5500000);

String getCurrentDate() {
  return DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();
}

String getBase64Image({required Uint8List? uint8List}) =>
    'data:image/png;base64,${base64.encode(uint8List!)}';

String getMonthName(int month) {
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return 'Unknown';
  }
}

String getFormattedDate(String? date) {
  return DateFormat("dd-MMM-yyyy").format(DateTime.parse('$date')).toString();
}

DateTime stringToDate({required String date}) {
  return DateTime.parse(date);
}

String getFormattedTime(String? date) {
  return DateFormat("HH:mm:ss").format(DateTime.parse('$date')).toString();
}

Future<String> imageTOBase64(File file) async {
  List<int> imageBytes = await file.readAsBytes();
  if (kDebugMode) {
    print(imageBytes);
  }
  return base64Encode(imageBytes);
}

showSingleButtonDialog(
    {required BuildContext context,
    required VoidCallback onYesClick,
    String? yesTitle,
    required String? title,
    required String? description}) {
  Widget continueButton = TextButton(
    onPressed: onYesClick,
    child: Text(
      yesTitle ?? "Continue",
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("$title"),
    content: Text("$description"),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showConfirmationDialog(
    {required BuildContext context,
    required VoidCallback onYesClick,
    required VoidCallback onCancelClick,
    String? yesTitle,
    required String? title,
    required String? description}) {
  // set up the buttons
  Widget cancelButton = TextButton(
    onPressed: onCancelClick,
    child: const Text(
      "Cancel",
    ),
  );
  Widget continueButton = TextButton(
    onPressed: onYesClick,
    child: Text(
      yesTitle ?? "Continue",
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("$title"),
    content: Text("$description"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

bool checkIfNumberIsValid({required String? number}) {
  if (number != null && number.isNotEmpty) {
    if (number.length == 11) {
      if (number[0] == '0' && number[1] == '1' && number[2] != '1') {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  } else {
    return false;
  }
}

Future<DateTime?> showDatePickerFunction(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101));
  if (picked != null) {
    return picked;
  }
  return null;
}

Future<String?> showMaterialDatePicker(BuildContext context,
    {String? midDivider}) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101));
  if (picked != null) {
    String divider = midDivider ?? "/";
    return "${picked.year}$divider${picked.month}$divider${picked.day}";
  }
  return null;
}

Future<TimeOfDay?> showTimePickerHelper(BuildContext context) async {
  TimeOfDay? pickedTime =
      await showTimePicker(context: context, initialTime: TimeOfDay.now());
  if (pickedTime != null) {
    return pickedTime;
  }
  return null;
}

Future<DateTime?> showDOBPicker(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now());

  if (pickedDate != null) {
    return pickedDate;
  }
  return null;
}

void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

getSimpleFraction({required String? value, int? fractionDigit}) {
  return num.parse("$value").toStringAsFixed(fractionDigit ?? 2);
}

bool isListNullOrEmpty(List<dynamic>? list) {
  if (list == null) {
    return true;
  } else if (list.isEmpty) {
    return true;
  } else {
    return false;
  }
}

Future<XFile?> showImagePicker(context) async {
  var picker = ImagePicker();
  XFile? pickedImageFile;

  showModalBottomSheet(
      isDismissible: true,
      backgroundColor: Colors.white,
      elevation: 0,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.30),
      builder: (context) {
        return Center(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Please Pick An Image Source'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ImagePickerButton(
                      iconData: Icons.add_a_photo_outlined,
                      onTap: () async {
                        pickedImageFile =
                            await picker.pickImage(source: ImageSource.camera);
                        Get.back();
                      },
                    ),
                    ImagePickerButton(
                      onTap: () async {
                        pickedImageFile =
                            await picker.pickImage(source: ImageSource.gallery);
                        Get.back();
                      },
                      iconData: Icons.add_photo_alternate_outlined,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });

// await showDialog(
//     context: context,
//     builder: (context) {
//       return Center(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height * 0.2,
//           width: MediaQuery.of(context).size.width * 0.6,
//           child: CustomTile(
//             carveRadius: 12,
//             elevation: 4,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text('Please Pick An Image Source'),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ImagePickerButton(
//                       iconData: Icons.add_a_photo_outlined,
//                       onTap: () async {
//                         pickedImageFile = await picker.pickImage(
//                             source: ImageSource.camera);
//                         context.pop();
//                       },
//                     ),
//                     ImagePickerButton(
//                       onTap: () async {
//                         pickedImageFile = await picker.pickImage(
//                             source: ImageSource.gallery);
//                         context.pop();
//                       },
//                       iconData: Icons.add_photo_alternate_outlined,
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       );
//     });
  return pickedImageFile;
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
