import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

Widget counter({
  required String title,
  required double value,

})=> Expanded(
  child: SfRadialGauge(
    animationDuration: 20.0,
    title: GaugeTitle(
        text: title,
        textStyle: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        alignment: GaugeAlignment.near
    ),
    axes: <RadialAxis>[
      RadialAxis(
        startAngle: 0.0,
        endAngle: 360.0,
        minimum: 0.0,
        maximum: 1000.0,
        interval: 100.0,
        pointers:  <GaugePointer>[
          NeedlePointer(
            needleStartWidth: 2.0,
            needleEndWidth: 2.0,
            needleColor: Colors.red,
            knobStyle: const KnobStyle(
                knobRadius: 0.1,
                borderWidth: 100.0,
                color: Colors.black54
            ),
            value: value,
            enableAnimation: true,
          ),
        ],
      ),
    ],
  ),
);