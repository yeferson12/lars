import 'package:bikeu/providers/provider_bloc.dart';
import 'package:bikeu/screens/formulario.dart';
import 'package:bikeu/screens/pendiente.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './utils/constants.dart';
import './providers/companies_provider.dart';
import './providers/auth_provider.dart';
import './screens/home.dart';
import 'providers/services_provider.dart';
import 'screens/faq.dart';
import 'screens/help.dart';
import 'screens/login.dart';
import 'screens/my_profile.dart';
import 'screens/ongoing_services.dart';
import 'screens/ongoing_services_operator.dart';
import 'screens/password_recovery.dart';
import 'screens/promotions.dart';
import 'screens/register.dart';
import 'screens/service_detail.dart';
import 'screens/service_messaging_companies.dart';
import 'screens/service_messaging_options.dart';
import 'screens/service_mechanics_companies.dart';
import 'screens/service_mechanics_options.dart';
import 'screens/service_operator.dart';
import 'screens/sheduled_services.dart';
import 'screens/provided_services.dart';
import 'screens/requested_services.dart';
import 'screens/terms_conditions.dart';
import './screens/chat.dart';
import './screens/ongoing_services_operator.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Providerr(
      child:MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CompaniesProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ServicesProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        /**
         * Idiomas del calendario
         */
        localizationsDelegates: [
               GlobalMaterialLocalizations.delegate,
               GlobalWidgetsLocalizations.delegate,
               GlobalCupertinoLocalizations.delegate,
 ],
 supportedLocales: [
    const Locale('en', 'US'), 
    const Locale('es', 'ES'), 
    const Locale.fromSubtags(languageCode: 'es'),
  ],
        title: 'BikeU',
        initialRoute: 'login',
        routes: {
          'login': (context)                      => Login(),
          'register': (context)                   => Register(),
          'passwordRecovery': (context)           => PasswordRecovery(),
          'home': (context)                       => Home(),
          'service-messaging-options': (context)  => ServiceMessagingOptions(),
          'service-messaging-companies': (context)=> ServiceMessagingCompanies(),
          'service-mechanics-options': (context)  => ServiceMechanicsOptions(),
          'service-mechanics-companies': (context)=> ServiceMechanicsCompanies(),
          'service-operator': (context)           => ServiceOperator(),
          'service-detail': (context)             => ServiceDetail(),
          'my-profile': (context)                 => MyProfile(),
          'promotions': (context)                 => Promotions(),
          'faq': (context)                        => Faq(),
          'help': (context)                       => Help(),
          'ongoing-services': (context)           => OngoingServices(),
          'ongoing-services-operator': (context)  => OngoingServicesOperator(),
          'sheduled-services': (context)          => SheduledServices(),
          'provided-services': (context)          => ProvidedServices(),
          'requested-services': (context)         => RequestedServices(),
          'terms-conditions': (context)           => TermsConditions(),
          'chat': (context)                       => Chat(),
          'formulario': (context)                 => Formulario(),
          'pendiente' :(context)                  => Pendiente(),
        },
        theme: ThemeData(
          primaryColor: greenDarkColor,
        ),
      ),
    ) ,
    );
    
    
  }
}