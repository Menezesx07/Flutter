import 'package:flutter/material.dart';

import '../../shared/images/app_images.dart';

class imageAssetsPage extends StatelessWidget {
  const imageAssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.user1, height: 50),
        Image.asset(AppImages.user2, height: 50),
        Image.asset(AppImages.user3, height: 50),
        //double.infinity ocupa toda a lateral
        Image.asset(AppImages.paisagem1, height: 50),
        Image.asset(AppImages.paisagem2, height: 50),
        Image.asset(AppImages.paisagem3, height: 50),

      ],
    );
  }
}
