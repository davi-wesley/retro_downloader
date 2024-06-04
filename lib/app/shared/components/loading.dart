import 'package:flutter/material.dart';
import 'package:retroDownloader/app/core/theme/app_colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.blue),
      ),
    );
  }
}

class LoadingStacked extends StatelessWidget {
  const LoadingStacked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            color: AppColors.grey.withOpacity(0.4),
          ),
          const Center(
            child: CircularProgressIndicator(
              color: AppColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
