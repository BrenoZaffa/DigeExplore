import 'dart:async';
import 'dart:math';
import 'package:digeexplore/enums/enum_orgaos.dart';
import 'package:flutter/material.dart';

class CartaJogoMemoria extends StatefulWidget {
  final EnumOrgaos orgao;
  final Function(EnumOrgaos) onTap;
  const CartaJogoMemoria({
    Key? key,
    required this.orgao,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CartaJogoMemoria> createState() => _CartaJogoMemoriaState();
}

class _CartaJogoMemoriaState extends State<CartaJogoMemoria>
    with SingleTickerProviderStateMixin {
  late final AnimationController animation;

  void flipCard() {
    if (!animation.isAnimating) {
      animation.forward();
      Timer(const Duration(milliseconds: 2000), () => animation.reverse());
    }
  }

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );
    flipCard();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  Future<void> selecionaCarta() async {
    await widget.onTap(widget.orgao);
    flipCard();
    // setState(() {});
  }

  Container getCarta(angulo) {
    if (angulo > 0.5 * pi) {
      return Container(
        width: 150,
        height: 170,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(widget.orgao.getColor()),
            width: 4,
          ),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Image.asset(
          widget.orgao.getAsset(),
          // fit: BoxFit.fill,
        ),
      );
    }

    return Container(
      width: 150,
      height: 170,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 32,
        ),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Image.asset(
        'assets/images/memoria.png',
        // fit: BoxFit.fill,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selecionaCarta(),
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, _) {
          final angulo = animation.value * pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(angulo);

          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child: getCarta(angulo),
          );
        },
      ),
    );
  }
}
