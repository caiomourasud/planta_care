import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/lists/plant_list_tile_group.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/firebase/auth.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: PlantAppBar(
        leading: PlantaAppBarButton(
          context: context,
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      upperBodyTitle: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
        child: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            PlantListTileGroup(
              leadingColor:
                  Theme.of(context).colorScheme.onSurface.withAlpha(20),
              title: 'Devices',
              items: [
                PlantListTileGroupItem(
                  leadingIcon: Icons.sensors_outlined,
                  label: 'Connected Devices',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            PlantListTileGroup(
              leadingColor:
                  Theme.of(context).colorScheme.onSurface.withAlpha(20),
              title: 'Account',
              items: [
                PlantListTileGroupItem(
                  leadingIcon: Icons.lock_outlined,
                  label: 'Change Password',
                  onTap: () {},
                ),
                PlantListTileGroupItem(
                  leadingIcon: Icons.logout_outlined,
                  customTrailing: const SizedBox(),
                  label: 'Logout',
                  onTap: () {
                    Auth.signOut(context: context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}
