import 'package:flutter/material.dart';

import '../../../../components/components.dart';
import '../../../../core/core.dart';

class SettingsTitle extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? onChanged;

  const SettingsTitle({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Manajemen Produk',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 300.0,
          child: SearchInput(
            controller: controller,
            onChanged: onChanged,
            hintText: 'Search for food, coffe, etc..',
          ),
        ),
      ],
    );
  }
}
