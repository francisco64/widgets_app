// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  static const String name = 'cards_screen'; //name of screen for routing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cards Screen'),
        ),
        body: const _CardsView());
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(//if there are many cards than cant fit the screen it throws an error unless transformed to a scroll view
      child: Column(
        children: [
          //... is the spread operator that can be used to expand and iterable or list into individual elements, so that each element mapped becomes an element of children
          ...cards.map((card) => _CardType1(
                label: card['label'],
                elevation: card['elevation'],
              )),
      
          ...cards.map((card) => _CardType2(
                label: card['label'],
                elevation: card['elevation'],
              )),
      
          ...cards.map((card) => _CardType3(
                label: card['label'],
                elevation: card['elevation'],
              )),

          ...cards.map((card) => _CardType4(
                label: card['label'],
                elevation: card['elevation'],
              )),
           SizedBox(height: 50,)
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  const _CardType1({required this.label, required this.elevation});

  final String label;
  final double elevation;
 
  @override
  Widget build(BuildContext context) {

  
    return Card(
        //card allows adding elevation to the icon
        
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined))),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(label)
              ),
             
            ],
          ),
        ));
  }
}


class _CardType2 extends StatelessWidget {
  const _CardType2({required this.label, required this.elevation});

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
        //card allows adding elevation to the icon
        shape: RoundedRectangleBorder(
          borderRadius:const BorderRadius.all(Radius.circular(10)),
          side: BorderSide( 
            color: colors.outline
          )
        ),
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined))),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('$label - outline')
              )
            ],
          ),
        ));
  }
}


class _CardType3 extends StatelessWidget {
  const _CardType3({required this.label, required this.elevation});

  final String label;
  final double elevation;
 
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
  
    return Card(
        //card allows adding elevation to the icon
        color: colors.surfaceContainerHighest,
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined))),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(label)
              ),
             
            ],
          ),
        ));
  }
}



class _CardType4 extends StatelessWidget {
  const _CardType4({required this.label, required this.elevation});

  final String label;
  final double elevation;
 
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
  
    return Card(
        clipBehavior: Clip.hardEdge,//clips to round edges
        //card allows adding elevation to the icon
        color: colors.surfaceContainerHighest,
        elevation: elevation,
        child: Stack(//puts one on top of the other towards the front, the first are closer to background
          children: [
            Image.network(
              'https://picsum.photos/id/${elevation.toInt()}/600/250',
              height: 350,
              fit: BoxFit.cover
            ),
            Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))//only button left corner will be rounded
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined)),
                )),
        
          ],
        ));
  }
}
