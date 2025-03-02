import 'package:flutter/material.dart';
import 'package:planta_care/components/buttons/planta_app_bar_button.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
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
              icon: const Icon(Icons.notifications),
            ),
          ],
        ),
        elevation: 0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 84.0,
            ),
            child: SafeArea(
              bottom: true,
              child: Column(
                children: [
                  Center(child: Text('Categories Page')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
