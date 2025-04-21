import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/components/text_form_field/planta_text_form_field.dart';
import 'package:planta_care/app/models/user_model.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/user_collection.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final _nameController = TextEditingController();
  final _professionController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();

  UserModel? user;
  UserModel? tempUser;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  Future<void> _getUser() async {
    user = await UserCollection.getUserById(Auth.currentUser?.email);
    tempUser = user;
    _nameController.text = user?.name ?? '';
    _professionController.text = user?.profession ?? '';
    _cityController.text = user?.city ?? '';
    _countryController.text = user?.country ?? '';
  }

  _setName(String name) {
    tempUser = tempUser?.copyWith(name: name);
    UserCollection.updateUser(tempUser);
  }

  _setProfession(String profession) {
    tempUser = tempUser?.copyWith(profession: profession);
    UserCollection.updateUser(tempUser);
  }

  _setCity(String city) {
    tempUser = tempUser?.copyWith(city: city);
    UserCollection.updateUser(tempUser);
  }

  _setCountry(String country) {
    tempUser = tempUser?.copyWith(country: country);
    UserCollection.updateUser(tempUser);
  }

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: PlantAppBar(
        leading: context.canPop()
            ? PlantaAppBarButton(
                context: context,
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
              )
            : null,
      ),
      bottomSheet: Row(
        spacing: 16.0,
        children: [
          Center(
            child: PlantaFilledButton(
              context: context,
              backgroundColor:
                  Theme.of(context).colorScheme.onSurface.withAlpha(20),
              onPressed: () {
                UserCollection.updateUserOnboardingSkipped(
                  FirebaseAuth.instance.currentUser?.email,
                  true,
                );
                context.go('/home');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50.0,
                  vertical: 12.0,
                ),
                child: Text(
                  'Skip',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
            ),
          ),
          Expanded(
            child: PlantaFilledButton(
              context: context,
              onPressed: () {
                context.push('/where-are-your-plants');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Text(
                  'Next',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24.0),
          Text(
            'Personal Information',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Please fill in your personal information',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
                ),
          ),
          const SizedBox(height: 32.0),
          Text(
            'Name',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12.0),
          PlantaTextFormField(
            context: context,
            readOnly: false,
            controller: _nameController,
            keyboardType: TextInputType.name,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            hintText: 'John Doe',
            onChanged: _setName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 24.0),
          Text(
            'Profession',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12.0),
          PlantaTextFormField(
            context: context,
            readOnly: false,
            controller: _professionController,
            keyboardType: TextInputType.name,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            hintText: 'Software Engineer',
            onChanged: _setProfession,
          ),
          const SizedBox(height: 24.0),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'City',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12.0),
                    PlantaTextFormField(
                      context: context,
                      readOnly: false,
                      controller: _cityController,
                      keyboardType: TextInputType.name,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      hintText: 'New York',
                      onChanged: _setCity,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Country',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12.0),
                    PlantaTextFormField(
                      context: context,
                      readOnly: false,
                      controller: _countryController,
                      keyboardType: TextInputType.name,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      hintText: 'US',
                      onChanged: _setCountry,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}
