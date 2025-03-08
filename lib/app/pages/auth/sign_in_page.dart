import 'package:flutter/material.dart';
import 'package:planta_care/app/components/logo_text_planta.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/app/pages/auth/components/auth_module.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: const PlantAppBar(trailing: LogoTextPlanta()),
      child: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: AuthModule(
          type: AuthModuleType.signIn,
          isLoading: _isSigningIn,
          onContinuePressed: (email, password) async {
            setState(() {
              _isSigningIn = true;
            });
            await Auth.signInWithEmailAndPassword(
              email: email,
              password: password,
              context: context,
            );
            setState(() {
              _isSigningIn = false;
            });
          },
        ),
      ),
    );
  }
}
