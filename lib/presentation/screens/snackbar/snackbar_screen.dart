import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context ){
    //if pressed too many times in a row it enqueues the call of the sackbar making it look like a bug, 
    ScaffoldMessenger.of(context).clearSnackBars(); //this clears the queue before a new snackbar is called

    ScaffoldMessenger.of(context).showSnackBar(//Snack bar is the notification showed at the buttom of the screen
            SnackBar(
              content: const Text('Hola mundo'),
              action: SnackBarAction(//action on press makes snackbar go
                label: 'snackbar action', 
                onPressed: (){},
                ),
              duration: const Duration(seconds: 2) // duration of the notification
            )
          );
  }

  void openDialog(BuildContext context){

    showDialog(
      context: context, 
      barrierDismissible: false,//if taping outside the dialog will remove the dialog
      builder: (context) => AlertDialog(
        title: const Text('Are you Sure'),
        content: const Text('Occaecat amet labore ea eiusmod cillum sunt ea minim reprehenderit sunt. Velit adipisicing ipsum duis irure quis qui. Minim pariatur do exercitation incididunt eu labore magna pariatur laboris Lorem commodo culpa ut. Nulla tempor amet aliqua qui.'),
        actions: [
          TextButton(onPressed: (){context.pop();}, child: const Text('Cancel')),//if press cancel go back to previews screen - go router

          FilledButton(onPressed: (){}, child: const Text('Accept'))
        ],
      
      )
      );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showCustomSnackbar(context);
        }, 
        label: const Text('mostrar snapbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
          
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [//what is shown in the dialog
                    const Text('App to showcase simple FLutter widgets')
                  ]
                  );//shows a window with licenses 
              }, 
              child: const Text('Licencias Usadas')
              ),
            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar dialogo')
              )
          ],
        ),
      ),

    );
  }
}