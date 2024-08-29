import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = 'home_screen'; //name of screen for routing 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flitter + material 3'),
        centerTitle: false,
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();//private class doesnt require a key

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder:  (context,index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      }
      );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;//gets theme defined



    return ListTile(

      leading: Icon(menuItem.icon, color: colors.primary,),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary,),
      title: Text(menuItem.title) ,
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        //on tap navigate to another screen
        /* Navigator.of(context).push(//push to stack of screens
          MaterialPageRoute(
            builder: (context) => const ButtonsScreen()
          )
        ); */
        //alternative to above, if routes are defined in the MaterialApp widget
        //Navigator.pushNamed(context, menuItem.link);//pass route to go as parameter 
        context.push(menuItem.link);//go_router adds the method push, go to the context
        //context.pushNamed(CardsScreen.name); using the name of the screen

      },
    );
  }
}