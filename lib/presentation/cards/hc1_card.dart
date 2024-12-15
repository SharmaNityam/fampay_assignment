import 'package:flutter/material.dart';
import '../../domain/model/hc1_model.dart';
import '../utils/utils.dart';

class Hc1Card extends StatelessWidget {
  final HC1Cards? card;
  final double height;
  final double width;

  const Hc1Card(
      {required this.card, this.height = 64, this.width = 0.0, super.key});

  @override
  Widget build(BuildContext context) {
    return _buildCardContainer(context);
  }

  Widget _buildCardContainer(BuildContext context) {
    return Container(
      height: height,
      width: _calculateWidth(context),
      decoration: _buildCardDecoration(),
      child: _buildCardContent(),
    );
  }

  double _calculateWidth(BuildContext context) {
    return width == 0.0 ? MediaQuery.of(context).size.width * 0.96 : width;
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: _getBackgroundColor(),
    );
  }

  Color _getBackgroundColor() {
    return card!.bgColor != null
        ? Utils.hexToColor(card!.bgColor!)
        : Colors.white;
  }

  Widget _buildCardContent() {
    return ListTile(
      leading: _buildLeadingImage(),
      title: _buildTitle(),
      subtitle: _buildSubtitle(),
    );
  }

  Widget _buildLeadingImage() {
    if (card!.icon?.imageUrl != null && card!.icon?.aspectRatio != null) {
      return AspectRatio(
        aspectRatio: double.parse(card!.icon!.aspectRatio!.toString()),
        child: Image.network(card!.icon!.imageUrl!),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildTitle() {
    final titleData = _processFormattedEntities(card!.formattedTitle?.entities);
    return Text(
      titleData.text,
      maxLines: 1,
      style: TextStyle(
        color: titleData.color,
        fontWeight: titleData.fontWeight,
      ),
    );
  }

  Widget _buildSubtitle() {
    final descData =
        _processFormattedEntities(card!.formattedDescription?.entities);
    return Text(
      descData.text,
      maxLines: 1,
      style: TextStyle(
        color: descData.color,
        fontWeight: descData.fontWeight,
      ),
    );
  }

  _EntityData _processFormattedEntities(List<dynamic>? entities) {
    if (entities == null || entities.isEmpty) {
      return _EntityData(
        text: '',
        color: Colors.white,
        fontWeight: FontWeight.w200,
      );
    }

    String processedText = '';
    Color entityColor = Colors.white;
    FontWeight entityFontWeight = FontWeight.w200;

    for (var entity in entities) {
      if (entity != null) {
        processedText += "${entity.text} ";
        entityColor = Utils.hexToColor(entity.color!);
        entityFontWeight = Utils.getFontWeight(entity.fontFamily!);
      }
    }

    return _EntityData(
      text: processedText.trim(),
      color: entityColor,
      fontWeight: entityFontWeight,
    );
  }
}

// Helper class to store processed entity data
class _EntityData {
  final String text;
  final Color color;
  final FontWeight fontWeight;

  _EntityData({
    required this.text,
    required this.color,
    required this.fontWeight,
  });
}
