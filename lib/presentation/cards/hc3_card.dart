import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../domain/big_card_cubit/big_card_cubit.dart';
import '../../domain/model/hc3_model.dart';
import '../utils/assets.dart';
import '../utils/utils.dart';

class Hc3Card extends StatefulWidget {
  final HC3Cards? card;
  final double height;
  final BigCardCubit cubit;

  const Hc3Card(
      {required this.card, this.height = 600, required this.cubit, super.key});

  @override
  State<Hc3Card> createState() => _Hc3CardState();
}

class _Hc3CardState extends State<Hc3Card> {
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleScreenTap,
      child: Container(
        height: widget.height,
        color: Colors.white,
        width: _getScreenWidth(),
        child: Stack(
          children: [
            _buildSideActions(),
            _buildMainCard(),
          ],
        ),
      ),
    );
  }

  void _handleScreenTap() {
    // If the card is collapsed, reset to original state
    if (isCollapsed) {
      setState(() {
        isCollapsed = false;
      });
    }
  }

  Widget _buildSideActions() {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        height: widget.height,
        width: _getScreenWidth(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container()),
            _buildRemindLaterButton(),
            const SizedBox(height: 24),
            _buildDismissButton(),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  Widget _buildRemindLaterButton() {
    return InkWell(
      onTap: () => widget.cubit.toggleVisibility(),
      child: _buildActionButton(
        icon: Assets.bellSvg,
        label: "Remind Later",
      ),
    );
  }

  Widget _buildDismissButton() {
    return InkWell(
      onTap: () => widget.cubit.hidePermanently(),
      child: _buildActionButton(
        icon: Assets.dismissSvg,
        label: "Dismiss Now",
      ),
    );
  }

  Widget _buildActionButton({required String icon, required String label}) {
    return Container(
      height: 64,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffF7F6F3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }

  Widget _buildMainCard() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      left: isCollapsed ? _getScreenWidth() * 0.5 : 0,
      child: GestureDetector(
        onLongPress: _toggleCollapse,
        // Prevent the tap from bubbling up and triggering the parent's onTap
        onTap: () {},
        child: Container(
          height: widget.height,
          width: _getScreenWidth(),
          decoration: BoxDecoration(
            color: const Color(0xff454AA6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: _buildCardContent(),
        ),
      ),
    );
  }

  Widget _buildCardContent() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: isCollapsed ? _getScreenWidth() * 0.5 : _getScreenWidth(),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Container()),
          _buildCardImage(),
          _buildTitleText(_getFirstTitleEntity()),
          const SizedBox(height: 24),
          _buildTitleText(_getLastTitleEntity()),
          const SizedBox(height: 24),
          _buildCtaButton(),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget _buildCardImage() {
    return SizedBox(
      height: widget.height / 2,
      child: AspectRatio(
        aspectRatio: _getAspectRatio(),
        child: CachedNetworkImage(
          imageUrl: _getImageUrl(),
          height: widget.height / 2,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _buildTitleText(_TitleEntityData entityData) {
    return Text(
      entityData.text,
      style: TextStyle(
        color: entityData.color,
        fontWeight: entityData.fontWeight,
        fontSize: entityData.fontSize,
      ),
    );
  }

  Widget _buildCtaButton() {
    return InkWell(
      onTap: _launchUrl,
      child: Container(
        height: 42,
        width: 128,
        decoration: BoxDecoration(
          color: Utils.hexToColor(_getCtaColor()),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            _getCtaText(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  void _toggleCollapse() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  void _launchUrl() {
    launchUrl(Uri.parse(_getUrl()));
  }

  double _getScreenWidth() {
    return MediaQuery.of(context).size.width * 0.96;
  }

  String _getImageUrl() {
    return widget.card?.bgImage?.imageUrl ?? "";
  }

  double _getAspectRatio() {
    return widget.card?.bgImage?.aspectRatio ?? 0.0;
  }

  _TitleEntityData _getFirstTitleEntity() {
    return _extractTitleEntity(0);
  }

  _TitleEntityData _getLastTitleEntity() {
    return _extractTitleEntity(-1);
  }

  _TitleEntityData _extractTitleEntity(int index) {
    final entities = widget.card?.formattedTitle?.entities;
    if (entities == null || entities.isEmpty) {
      return _TitleEntityData(
        text: '',
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
    }

    final entity = entities[index >= 0 ? index : entities.length + index];
    return _TitleEntityData(
      text: entity?.text ?? '',
      color: Utils.hexToColor(entity?.color ?? '#FFFFFF'),
      fontWeight: Utils.getFontWeight(entity?.fontFamily ?? 'normal'),
      fontSize: double.parse((entity?.fontSize ?? 16).toString()),
    );
  }

  String _getCtaText() {
    return widget.card?.cta?.isNotEmpty == true
        ? widget.card!.cta!.first!.text ?? ''
        : '';
  }

  String _getCtaColor() {
    return widget.card?.cta?.isNotEmpty == true
        ? widget.card!.cta!.first!.bgColor ?? '#000000'
        : '#000000';
  }

  String _getUrl() {
    return widget.card?.url ?? '';
  }
}

// Helper class to store title entity data
class _TitleEntityData {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;

  _TitleEntityData({
    required this.text,
    required this.color,
    required this.fontWeight,
    required this.fontSize,
  });
}
