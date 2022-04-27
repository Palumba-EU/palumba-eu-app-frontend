import 'package:flutter/material.dart';
import 'package:bondy/global_widgets/loading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: Stack(
            children: [
              GetBuilder<LogInController>(
                id: 'loading',
                builder: (_) {
                  return _.isLoading
                      ? const Loading(
                    indicatorColor: Colors.white,
                  )
                      : SizedBox.shrink();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
