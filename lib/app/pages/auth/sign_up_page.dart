import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/logo_text_planta.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/app/pages/auth/components/auth_module.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: PlantAppBar(
        leading: PlantaAppBarButton(
          context: context,
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        trailing: const LogoTextPlanta(),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: AuthModule(
          type: AuthModuleType.signUp,
          isLoading: _isCreatingAccount,
          onContinuePressed: (email, password) async {
            setState(() {
              _isCreatingAccount = true;
            });
            final userCredential = await Auth.createUserWithEmailAndPassword(
              email: email,
              password: password,
              context: context,
            );
            if (userCredential != null && context.mounted) {
              context.pop();
            }
            if (context.mounted) {
              setState(() {
                _isCreatingAccount = false;
              });
            }
          },
        ),
      ),
    );
  }
}
