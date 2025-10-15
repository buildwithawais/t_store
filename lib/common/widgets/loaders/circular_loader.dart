import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TCircularLoader extends StatelessWidget {
  const TCircularLoader ({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: TColors.primary, backgroundColor: TColors.white,));
  }
}