import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/utils/app_assets.dart';
import 'package:islamy_app/Ui/utils/app_colors.dart';
import 'package:islamy_app/Ui/utils/styles.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(AppAssets.radioImage),
        Text(
          'إذاعة القرآن الكريم',
          style: AppStyles.semiBoldAccent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  size: 40,
                  Icons.fast_rewind,
                  color: AppColors.primary,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(size:80,

                  Icons.play_arrow,
                  color: AppColors.primary,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(size:40,
                  Icons.fast_forward,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
