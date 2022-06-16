import 'dart:async';

import 'package:flutter/material.dart';

class TempoJogo extends StatefulWidget {
  final Function(double) onTempoTerminado;

  // ignore: prefer_const_constructors_in_immutables
  TempoJogo({
    Key? key,
    required this.onTempoTerminado,
  }) : super(key: key);

  @override
  State<TempoJogo> createState() => _TempoJogoState();
}

class _TempoJogoState extends State<TempoJogo> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 120),
    )..addListener(
        () {
          if (mounted) {
            setState(() {
              widget.onTempoTerminado(controller.value);
            });
          }
        },
      );

    Timer(
      const Duration(milliseconds: 2000),
      () => controller.forward().whenComplete(
            () => widget.onTempoTerminado(1),
          ),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Color getColor() {
    if (controller.value < 0.40) {
      return const Color(0xFF5cb85c);
    } else if (controller.value < 0.60) {
      return const Color(0xFF5bc0de);
    } else if (controller.value < 0.80) {
      return const Color(0xFFf0ad4e);
    } else {
      return const Color(0xFFd9534f);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: controller.value,
      color: getColor(),
      backgroundColor: const Color(0xFFf2f2f2),
      minHeight: 8,
    );
  }
}
