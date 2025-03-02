import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

enum AppLanguage { en, es, br }

class PlantaLanguages {
  const PlantaLanguages({
    required this.en,
    required this.es,
    required this.br,
  });

  final String en;
  final String es;
  final String br;

  String getTranslation(AppLanguage language) {
    switch (language) {
      case AppLanguage.en:
        return en;
      case AppLanguage.es:
        return es;
      case AppLanguage.br:
        return br;
    }
  }
}

mixin AppLocale {
  // Get Started
  static const String keepYourPlantsAlive = 'keepYourPlantsAlive';
  static const String keepYourPlantsAliveDescription =
      'keepYourPlantsAliveDescription';
  static const String getStartedWithPlanta = 'getStartedWithPlanta';

  // Sign In and Sign Up
  static const String yourEmailAddress = 'yourEmailAddress';
  static const String chooseYourPassword = 'chooseYourPassword';
  static const String confirmYourPassword = 'confirmYourPassword';
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';
  static const String signInWithGoogle = 'signInWithGoogle';
  static const String signInWithFacebook = 'signInWithFacebook';
  static const String min6Characters = 'min6Characters';
  static const String emailIsRequired = 'emailIsRequired';
  static const String passwordIsRequired = 'passwordIsRequired';
  static const String passwordMustBeAtLeast6Characters =
      'passwordMustBeAtLeast6Characters';
  static const String continueButton = 'continueButton';
  static const String dontHaveAnAccount = 'dontHaveAnAccount';
  static const String orSignUpWith = 'orSignUpWith';

  static const Map<String, PlantaLanguages> localizedStrings = {
    keepYourPlantsAlive: PlantaLanguages(
      en: 'Keep your plants alive',
      es: 'Mantén tus plantas vivas',
      br: 'Mantenha suas plantas vivas',
    ),
    keepYourPlantsAliveDescription: PlantaLanguages(
      en: 'Keep your plants alive by watering, providing sunlight, and checking for pests.',
      es: 'Mantén tus plantas vivas regando, dándole luz solar y revisando por insectos.',
      br: 'Mantenha suas plantas vivas regando, dando luz solar e verificando por insetos.',
    ),
    getStartedWithPlanta: PlantaLanguages(
      en: 'Get Started With Planta',
      es: 'Comienza con Planta',
      br: 'Comece com Planta',
    ),
    yourEmailAddress: PlantaLanguages(
      en: 'Your email address',
      es: 'Tu dirección de correo electrónico',
      br: 'Seu endereço de e-mail',
    ),
    chooseYourPassword: PlantaLanguages(
      en: 'Choose your password',
      es: 'Elige tu contraseña',
      br: 'Escolha sua senha',
    ),
    confirmYourPassword: PlantaLanguages(
      en: 'Confirm your password',
      es: 'Confirma tu contraseña',
      br: 'Confirme sua senha',
    ),
    signIn: PlantaLanguages(
      en: 'Sign In',
      es: 'Iniciar sesión',
      br: 'Entrar',
    ),
    signUp: PlantaLanguages(
      en: 'Sign Up',
      es: 'Registrarse',
      br: 'Registrar',
    ),
    signInWithGoogle: PlantaLanguages(
      en: 'Sign In with Google',
      es: 'Iniciar sesión con Google',
      br: 'Entrar com Google',
    ),
    signInWithFacebook: PlantaLanguages(
      en: 'Sign In with Facebook',
      es: 'Iniciar sesión con Facebook',
      br: 'Entrar com Facebook',
    ),
    min6Characters: PlantaLanguages(
      en: 'Min 6 characters',
      es: 'Mínimo 6 caracteres',
      br: 'Mínimo 6 caracteres',
    ),
    emailIsRequired: PlantaLanguages(
      en: 'Email is required',
      es: 'El correo electrónico es requerido',
      br: 'O e-mail é obrigatório',
    ),
    passwordIsRequired: PlantaLanguages(
      en: 'Password is required',
      es: 'La contraseña es requerida',
      br: 'A senha é obrigatória',
    ),
    passwordMustBeAtLeast6Characters: PlantaLanguages(
      en: 'Password must be at least 6 characters',
      es: 'La contraseña debe tener al menos 6 caracteres',
      br: 'A senha deve ter pelo menos 6 caracteres',
    ),
    continueButton: PlantaLanguages(
      en: 'Continue',
      es: 'Continuar',
      br: 'Continuar',
    ),
    dontHaveAnAccount: PlantaLanguages(
      en: "Don't have an account ",
      es: "No tienes una cuenta ",
      br: "Não tem uma conta ",
    ),
    orSignUpWith: PlantaLanguages(
      en: 'Or Sign up with',
      es: 'O regístrate con',
      br: 'Ou registre-se com',
    ),
  };

  static String getString(BuildContext context, String key) {
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;
    final AppLanguage language = _getLanguageFromCode(languageCode);

    return localizedStrings[key]?.getTranslation(language) ?? key;
  }

  static AppLanguage _getLanguageFromCode(String code) {
    switch (code) {
      case 'en':
        return AppLanguage.en;
      case 'es':
        return AppLanguage.es;
      case 'pt':
        return AppLanguage.br;
      default:
        return AppLanguage.en;
    }
  }

  static final mapLocales = [
    MapLocale(
      'en',
      _getTranslationsForLanguage(AppLanguage.en),
      countryCode: 'US',
    ),
    MapLocale(
      'es',
      _getTranslationsForLanguage(AppLanguage.es),
      countryCode: 'ES',
    ),
    MapLocale(
      'pt',
      _getTranslationsForLanguage(AppLanguage.br),
      countryCode: 'BR',
    ),
  ];

  static Map<String, String> _getTranslationsForLanguage(AppLanguage language) {
    return localizedStrings.map((key, value) => MapEntry(
          key,
          value.getTranslation(language),
        ));
  }
}
