import 'package:diyo/gen/colors.gen.dart';
import 'package:flutter/material.dart';


class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorName.primary,
      child: ListView(
        // Remove padding
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: ColorName.white,
            ),
            title: const Text('Dashboard'),
            textColor: ColorName.white,
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(
                Icons.settings_suggest, color: ColorName.white),
            title: const Text('Data Penjualan'),
            textColor: ColorName.white,
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(
              Icons.stacked_bar_chart,
              color: ColorName.white,
            ),
            title: const Text('Data Produksi'),
            textColor: ColorName.white,
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(
              Icons.storage,
              color: ColorName.white,
            ),
            title: const Text('Data Bahan Baku'),
            textColor: ColorName.white,
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(
              Icons.person_add_alt_1_sharp,
              color: ColorName.white,
            ),
            textColor: ColorName.white,
            title: const Text('Profile'),
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: ColorName.white,
            ),
            title: const Text('Keluar'),
            textColor: ColorName.white,
            onTap: () =>null,
          ),
        ],
      ),
    );
  }
}
