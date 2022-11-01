import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/blocs.dart';
import 'repositories/repositories.dart';
import 'screens/screens.dart';
import 'utils/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: _providers,
        child: MaterialApp(
          home: Navigator(
            pages: const [
              MaterialPage(
                key: ValueKey<String>(
                  homeScreenKey,
                ),
                child: HomeScreen(),
              ),
            ],
            onPopPage: (route, result) => route.didPop(
              result,
            ),
          ),
        ),
      );

  List<BlocProvider> get _providers => [
        BlocProvider<SliderBloc>(
          create: (context) => SliderBloc(),
        ),
        BlocProvider<StatusBloc>(
          create: (context) => StatusBloc(
            databaseOps: DatabaseOps(),
          ),
        ),
        BlocProvider<TestBloc>(
          create: (context) => TestBloc(
            databaseOps: DatabaseOps(),
          ),
        ),
      ];
}
