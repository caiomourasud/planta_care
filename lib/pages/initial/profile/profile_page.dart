import 'package:flutter/material.dart';
import 'package:planta_care/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/components/scaffold_elevated_container.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PlantaAppBarButton(
              context: context,
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        elevation: 0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: const Stack(
        children: [
          ScaffoldElevatedContainer(),
          Center(child: Text('Profile Page')),
        ],
      ),
    );
  }
}
