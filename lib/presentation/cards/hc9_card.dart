import 'dart:math';
import 'package:flutter/material.dart';
import '../../domain/model/hc9_model.dart';
import '../utils/utils.dart';

class Hc9Card extends StatelessWidget {
  final HC9Cards? card;
  final double height;

  const Hc9Card({
    Key? key,
    required this.card,
    this.height = 195,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: _buildCardContainer(),
    );
  }

  Widget _buildCardContainer() {
    return Container(
      height: height,
      decoration: _getCardDecoration(),
      child: _buildCardContent(),
    );
  }

  BoxDecoration _getCardDecoration() {
    final gradientDetails = _extractGradientDetails();
    return BoxDecoration(
      gradient: LinearGradient(
        colors: gradientDetails.colors,
        begin: _calculateGradientAlignment(gradientDetails.angle),
        end: _calculateGradientAlignment(gradientDetails.angle + 180),
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }

  Widget _buildCardContent() {
    final imageDetails = _extractImageDetails();
    return AspectRatio(
      aspectRatio: imageDetails.aspectRatio,
      child: Image.network(
        imageDetails.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Alignment _calculateGradientAlignment(double angle) {
    return Alignment(
      cos(Utils.angleToRadians(angle)),
      sin(Utils.angleToRadians(angle)),
    );
  }

  ({List<Color> colors, double angle}) _extractGradientDetails() {
    List<Color> gradientColors = [];
    double gradientAngle = 333;

    if (card?.bgGradient?.colors != null) {
      gradientColors = card!.bgGradient!.colors!
          .where((hex) => hex != null)
          .map((hex) => Utils.hexToColor(hex!))
          .toList();
    }

    if (card?.bgGradient?.angle != null) {
      gradientAngle = double.parse(card!.bgGradient!.angle!.toString());
    }

    return (
      colors: gradientColors.isNotEmpty
          ? gradientColors
          : [Colors.transparent, Colors.transparent],
      angle: gradientAngle,
    );
  }

  ({double aspectRatio, String imageUrl}) _extractImageDetails() {
    return (
      aspectRatio: card?.bgImage?.aspectRatio ?? 0.0,
      imageUrl: card?.bgImage?.imageUrl ?? '',
    );
  }
}
