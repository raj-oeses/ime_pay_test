import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomCircularProgress extends StatelessWidget {
  final double? size;

  const CustomCircularProgress({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
            child: SizedBox(
                height: size ?? 50.0,
                width: size ?? 50.0,
                child: const CircularProgressIndicator.adaptive(
                    backgroundColor: black600)))
      ],
    );
  }
}
