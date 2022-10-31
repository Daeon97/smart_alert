import 'package:flutter/material.dart';
import 'screens/screens.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Navigator(
          pages: [
            MaterialPage(
              child: HomeScreen(),
            ),
          ],
          onPopPage: (route, result) => route.didPop(
            result,
          ),
        ),
      );
}
