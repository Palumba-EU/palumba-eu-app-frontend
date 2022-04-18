import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/data/audio_manager.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:get/get.dart';
import '../data/models/preset.dart';
import '../styles/app_theme.dart';

class PurchaseTile extends StatelessWidget {
  Function onTap;

  PurchaseTile({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
            padding: EdgeInsets.all(Styles.paddingValue/2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Styles.regularText(context, 'Subscription 1'),
                    Styles.smallText(context, 'Subscription Text 1'),
                  ],
                )),
                Styles.regularText(context, '2,99€')
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              border: Border.all(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(12),
            )));
  }
}
