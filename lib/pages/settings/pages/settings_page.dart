import 'package:flutter/material.dart';

import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../../home/models/product_category.dart';
import '../../home/models/product_model.dart';
import '../../home/widgets/custom_tab_bar.dart';
import '../widgets/manage_product_card.dart';
import '../widgets/settings_title.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
 

  @override
  void initState() {
   
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // LEFT CONTENT
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.topCenter,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  const Text(
                    'Settings',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SpaceHeight(16.0),
               
                  ListTile(
                    contentPadding: const EdgeInsets.all(12.0),
                    leading: Assets.icons.kelolaDiskon.svg(),
                    title: const Text('Kelola Diskon'),
                    subtitle: const Text('Kelola Diskon Pelanggan'),
                    textColor: AppColors.primary,
                    tileColor: Colors.transparent,
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(12.0),
                    leading: Assets.icons.kelolaPrinter.svg(),
                    title: const Text('Kelola Printer'),
                    subtitle: const Text('Tambah atau hapus printer'),
                    textColor: AppColors.primary,
                    tileColor: Colors.transparent,
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(12.0),
                    leading: Assets.icons.kelolaPajak.svg(),
                    title: const Text('Kelola Pajak'),
                    subtitle: const Text('Kelola pajak 10 atau 11 %'),
                    textColor: AppColors.primary,
                    tileColor: Colors.transparent,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),

          // RIGHT CONTENT
          const Expanded(
            flex: 4,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Center(child: Text('Right Content')),
            ),
          ),
        ],
      ),
    );
  }
}

