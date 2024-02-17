import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class ServiceDialog extends StatelessWidget {
  const ServiceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            'LAYANAN',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.cancel,
                color: AppColors.primary,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Presentase (10%)'),
            subtitle: const Text('biaya layanan'),
            contentPadding: EdgeInsets.zero,
            textColor: AppColors.primary,
            trailing: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
            onTap: () {
              context.pop();
            },
          ),
          ListTile(
            title: const Text('Presentase (5%)'),
            subtitle: const Text('biaya layanan'),
            contentPadding: EdgeInsets.zero,
            textColor: AppColors.primary,
            trailing: Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            onTap: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
