import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/firebase/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisSize: MainAxisSize.min, children: [
              PlantaAppBarButton(
                context: context,
                onPressed: () {
                  context.go('/profile');
                },
                icon: const Icon(Icons.person),
              ),
              const SizedBox(width: 4.0),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Hi Caio!',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Curitiba, BR',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(120),
                      ),
                )
              ])
            ]),
            PlantaAppBarButton(
              context: context,
              onPressed: () {
                Auth.signOut();
              },
              icon: const Icon(Icons.fit_screen_rounded),
            ),
          ],
        ),
        elevation: 0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: const Center(child: Text('Home Page')),
    );
  }
}
