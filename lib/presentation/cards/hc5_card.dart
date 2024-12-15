import 'package:flutter/material.dart';
import '../../domain/model/hc5_model.dart';

class Hc5Card extends StatelessWidget {
  final HC5Cards? card;
  final double height;

  const Hc5Card({
    Key? key,
    required this.card,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildCardContainer(context);
  }

  Widget _buildCardContainer(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      decoration: _getCardDecoration(),
      child: _buildCardContent(),
    );
  }

  BoxDecoration _getCardDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
    );
  }

  Widget _buildCardContent() {
    final bgImage = _extractBackgroundImage();
    final aspectRatio = _extractAspectRatio();

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Image.network(bgImage),
    );
  }

  String _extractBackgroundImage() {
    return card?.bgImage?.imageUrl ?? '';
  }

  double _extractAspectRatio() {
    return card?.bgImage?.aspectRatio ?? 0.0;
  }
}
