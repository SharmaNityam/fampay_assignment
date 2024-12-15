import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/model/hc6_model.dart';
import '../utils/utils.dart';

class Hc6Card extends StatelessWidget {
  final HC6Cards? card;
  final double height;

  const Hc6Card({
    Key? key,
    required this.card,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildCardWrapper(context);
  }

  Widget _buildCardWrapper(BuildContext context) {
    return InkWell(
      onTap: _handleCardTap,
      child: _buildCardContainer(context),
    );
  }

  void _handleCardTap() {
    final url = _extractUrl();
    if (url.isNotEmpty) {
      launchUrl(Uri.parse(url));
    }
  }

  Widget _buildCardContainer(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width * 0.96,
      decoration: _getCardDecoration(),
      child: Center(
        child: _buildCardContent(),
      ),
    );
  }

  BoxDecoration _getCardDecoration() {
    final bgColor = _extractBackgroundColor();
    return BoxDecoration(
      color: Utils.hexToColor(bgColor),
      borderRadius: BorderRadius.circular(12),
    );
  }

  Widget _buildCardContent() {
    return ListTile(
      leading: _buildLeadingIcon(),
      title: _buildTitle(),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _buildLeadingIcon() {
    final iconDetails = _extractIconDetails();
    return SizedBox(
      height: iconDetails.size,
      width: iconDetails.size,
      child: AspectRatio(
        aspectRatio: iconDetails.aspectRatio,
        child: Image.network(
          iconDetails.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    final titleDetails = _extractTitleDetails();
    return Text(
      titleDetails.text,
      style: TextStyle(
        color: titleDetails.color,
        fontWeight: titleDetails.fontWeight,
      ),
    );
  }

  String _extractBackgroundColor() {
    return card?.bgColor ?? '';
  }

  String _extractUrl() {
    return card?.url ?? '';
  }

  ({double size, double aspectRatio, String imageUrl}) _extractIconDetails() {
    return (
      size: card?.iconSize != null
          ? double.parse(card?.iconSize.toString() ?? '16')
          : 16.0,
      aspectRatio: card?.icon?.aspectRatio != null
          ? double.parse(card?.icon?.aspectRatio.toString() ?? '0.0')
          : 0.0,
      imageUrl: card?.icon?.imageUrl ?? '',
    );
  }

  ({String text, Color color, FontWeight fontWeight}) _extractTitleDetails() {
    String titleText = '';
    Color titleColor = Colors.white;
    FontWeight titleFontWeight = FontWeight.w200;

    if (card?.formattedTitle?.entities != null) {
      for (var entity in card!.formattedTitle!.entities!) {
        if (entity != null) {
          titleText += "${entity.text} ";
          titleColor = Utils.hexToColor(entity.color!);
          titleFontWeight = Utils.getFontWeight(entity.fontFamily!);
        }
      }
    }

    return (
      text: titleText,
      color: titleColor,
      fontWeight: titleFontWeight,
    );
  }
}
