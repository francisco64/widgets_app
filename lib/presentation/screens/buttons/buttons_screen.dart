import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});
  static const String name = 'buttons_screen'; //name of screen for routing 

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;//gets theme defined

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screem'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: (){
          context.pop();//remove las screen from the front of the pile 
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    
    return SizedBox(
      width: double.infinity,//what is available
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Wrap(//somilar to row but when space is finished goes to the next line
          spacing: 10,//space between widgets
          alignment: WrapAlignment.center,//center with respect to the width of the sizebox
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Elevated Button')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm),label: const Text('Elevated Icon')),
            FilledButton(onPressed: (){}, child: const Text('Filled')),
            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm), label: const Text('icon Filled')),
            OutlinedButton(onPressed: (){}, child: const Text('Outlined Button')),
            OutlinedButton.icon(onPressed: (){}, icon:const Icon(Icons.ac_unit_sharp), label:  const Text('Outlined Button')),
            TextButton(onPressed: (){}, child: const Text('Text Button')),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.accessibility),label: const Text('Text Button with icon')),
            IconButton(onPressed: (){}, icon: const Icon(Icons.adb_outlined)),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.adb_outlined),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: const WidgetStatePropertyAll(Colors.white)
                )
              ),
            const CustomButton(),
          ],
        ),
      )
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;


    return ClipRRect(//round borders
      borderRadius: BorderRadius.circular(30),
      child: Material(//adds material functionalities to the widget
        color: colors.primary,
        child: InkWell(//adds splash animation to button 
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Hello World', style: const TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}