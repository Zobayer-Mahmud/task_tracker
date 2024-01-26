import 'package:flutter/material.dart';


class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton({super.key, this.onTap, required this.iconData});

  final Future<void> Function()? onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      elevation: 3,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.23,
          child: Icon(
            iconData,
            color:Colors.green,
          ),
        ),
      ),
    );
  }
}