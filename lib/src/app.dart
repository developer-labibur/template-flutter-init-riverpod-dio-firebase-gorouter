import 'package:flutter_init/src/imports/core_imports.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Widget current = _buildMaterialApp(context);

    current = ScreenUtilWrapper(child: current);

    return current;
  }

  Widget _buildMaterialApp(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Init (Feature-first, Riverpod, Firebase, Go-router, Dio)',
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(primaryColorHex: '#5e24ff'),
      darkTheme: buildDarkTheme(primaryColorHex: '#5e24ff'),
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) {
        Widget current = child!;
        current = SkeletonWrapper(child: current);
        current = SessionListenerWrapper(child: current);
        return current;
      },
    );
  }
}
