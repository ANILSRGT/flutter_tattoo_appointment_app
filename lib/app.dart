import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tattoo_appointment/core/constants/app/app_constants.dart';
import 'package:tattoo_appointment/core/utils/localization/app_langs.dart';
import 'package:tattoo_appointment/core/utils/localization/localization_manager.dart';
import 'package:tattoo_appointment/core/utils/router/app_router.dart';
import 'package:tattoo_appointment/injection.dart';
import 'package:tattoo_appointment/presentation/blocs/theme/theme_cubit.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        ],
        child: Builder(
          builder: (context) {
            final themeCubitWatch = context.watch<ThemeCubit>();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppConstants.appTitle,
              theme: themeCubitWatch.state.currentTheme.lightTheme,
              darkTheme: themeCubitWatch.state.currentTheme.darkTheme,
              themeMode: themeCubitWatch.state.themeMode,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale:
                  LocalizationManager.instance.currentLang(context).toLocale,
              onGenerateRoute: Injection.read<AppRouter>().onGenerateRoute,
              navigatorKey: Injection.read<GlobalKey<NavigatorState>>(),
              initialRoute: Injection.read<AppRouter>().initialRoute,
            );
          },
        ),
      ),
    );
  }
}
