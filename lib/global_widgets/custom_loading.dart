import 'package:flutter/material.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';

class CustomLoading extends StatelessWidget {
  final Color? indicatorColor;

  const CustomLoading({Key? key, this.indicatorColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      color: Colors.transparent,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(
              indicatorColor ?? AppColors.primary),
        ),
      ),
    );
  }
}
