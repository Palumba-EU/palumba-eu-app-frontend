import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/purchase/purchase_controller.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../global_widgets/purchase_title.dart';
import '../../styles/app_theme.dart';

class PurchasePage extends StatelessWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchaseController>(
      builder: (_) {
        return Scaffold(
            backgroundColor: Colors.black.withOpacity(0.3),
            body: SafeArea(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(Styles.paddingValue),
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Styles.spacer(multiplier: 3),
                        Styles.h3TitleText(context, 'Your focus shelter'),
                        Styles.spacer(small: true),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: 2,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Styles.spacer(small: true);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return PurchaseTile(onTap: () {});
                            },
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {
                              await InAppPurchase.instance.restorePurchases();
                            },
                            child: Container(
                                color: Colors.transparent,
                                child: Styles.smallText(
                                    context, 'Restore purchases'),
                                padding: EdgeInsets.all(
                                  Styles.paddingValue,
                                ))),
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
