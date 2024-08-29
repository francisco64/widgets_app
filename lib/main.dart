import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(//MaterialApp.router allows specifying the router manager
    routerConfig: appRouter,//routs defined
      debugShowMaterialGrid: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
      //home: HomeScreen(), //not necessary as go router specifies the initial path '/' as home 
        
      //for this project it was chosen go_router as rout manager
      /* routes: {//routes maps urls to widgets (screens)
        '/buttons': (context) => ButtonsScreen(),   
        '/cards': (context) => CardsScreen(),      
      }, */
    );
  }
}
