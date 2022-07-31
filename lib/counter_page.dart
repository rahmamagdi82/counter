import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'component.dart';


class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPage();
}

class _CounterPage extends State<CounterPage> {
  // The node used to request the keyboard focus.
  final FocusNode focusNode = FocusNode();
  // The message to display.
  String? message;
  //to determined position when pressed "Q"
  var x=0.0;
  var y=0.0;
  bool pressedQ =false;
  //to determined position on screen
  var x2=0.0;
  var y2=0.0;

  void handleKeyEvent(RawKeyEvent event) {

    setState(() {
      if (event.isKeyPressed(LogicalKeyboardKey.keyQ))
      {
        pressedQ=true;
      }else
      {
        pressedQ=false;
      }
    });
  }
  void updateLocation(PointerEvent details) {
    x=0.0;
    y=0.0;
    x2=0.0;
    y2=0.0;
    setState(() {
      if(pressedQ)
      {
        setState((){
          x = details.position.dx;
          y = details.position.dy;
        });
      } else
      {
        setState((){
          x2 = details.position.dx;
          y2 = details.position.dy;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
        body: SingleChildScrollView(
          child: RawKeyboardListener(
            focusNode: focusNode,
            onKey: handleKeyEvent,
            child: MouseRegion(
              onHover: updateLocation,
              child: AnimatedBuilder(
                animation: focusNode,
                builder: (BuildContext context, Widget? child) {
                  if (!focusNode.hasFocus) {
                    FocusScope.of(context).requestFocus(focusNode);
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'When click on Q in keyboard',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      Row(
                        children: [
                          counter(
                              title: 'x',
                              value: x,
                          ),
                         counter(
                             title: 'y',
                             value: y,
                         ),
                          Expanded(
                            child: Column(
                              children: [
                                Text('x = $x'),
                                Text('y = $y'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'When move with mouse only',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      Row(
                        children: [
                          counter(
                              title: 'x2',
                              value: x2,
                          ),
                          counter(
                              title: 'y2',
                              value: y2,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text('x2 = $x2'),
                                Text('y2 = $y2'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}