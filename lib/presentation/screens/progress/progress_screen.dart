import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text('Circular Progress Indicator'),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black12,
          ), //indicator
          SizedBox(
            height: 20,
          ),
          Text('Circular Progress Controlado - circular & Linear'),
          SizedBox(
            height: 10,
          ),
          _ControlledProgresIndicator()
        ],
      ),
    );
  }
}

class _ControlledProgresIndicator extends StatelessWidget {
  const _ControlledProgresIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(//create a widget that is re-built based on a stream of data
      //stream generate events every 300 ms. value starts from 0 and is increased by 1 each new event 
      stream: Stream.periodic(const Duration(milliseconds: 100), (value) {// stream the widget listens to
        return (value ) / 100; //creates a doubled value
      }).takeWhile((value) => value < 100),//streams data as long as value < 100
      builder: (context, snapshot) {//how the widget should be billed based on the current snapshot of the stream

        final progressValue = snapshot.data ?? 0;//takes the snapshot data from stream, if null put 0 instead

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black12,
              ), //value is the percentage progress
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  //the progress bar needs to know the available space, expanded takes all available space by default. Without expanded it throuws an error
                  child: LinearProgressIndicator(
                      value: progressValue,) //creates a progress bar, value is the percentage progress
                  )
            ],
          ),
        );
      },
    );
  }
}
