import 'package:flutter/material.dart';
import 'package:task_tracker/app/modules/app_widgets/progress_bar/progress_bar.dart';



class BaseView extends StatelessWidget {
 final Widget child;
 final bool showLoading ;

  const BaseView({super.key, required this.child, this.showLoading = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (showLoading == true)
          const LoadingProgressBar()
      ],
    );
  }
}
