import 'package:diyo/gen/colors.gen.dart';
import 'package:diyo/helpers/navigation_helper.dart';
import 'package:diyo/utils/font.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.line_weight,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: ColorName.white,
            ),
            title: const Text('Home'),
            textColor: ColorName.white,
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.checklist, color: ColorName.white),
            title: const Text('Order Queue'),
            textColor: ColorName.white,
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(
              Icons.grid_view_sharp,
              color: ColorName.white,
            ),
            title: const Text('Menu'),
            textColor: ColorName.white,
            onTap: () => null,
          ),
          ListTile(
            title: Text(
              'Logout',
              style: captionSemiBold(),
            ),
            textColor: ColorName.white,
            onTap: () => GetIt.I<NavigationHelper>().goToLogin(),
          ),
        ],
      ),
    );
  }
}
