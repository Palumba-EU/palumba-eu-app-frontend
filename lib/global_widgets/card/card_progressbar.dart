import 'package:flutter/material.dart';

class CardProgressBar extends StatelessWidget {
  final int step;
  final int totalSteps;

  const CardProgressBar({
    super.key,
    required this.step,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (int i = 0; i < totalSteps; i++)
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: SizedBox(
              width: double.infinity,
              height: 4,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.5),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  if (i == step)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                ],
              ),
            ),
          ),
        ),
      InkWell(
        onTap: () {
          //TODO: Implement Skip
        },
        child: Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            'SKIP',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      )
    ]);
  }
}
