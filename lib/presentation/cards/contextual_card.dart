import 'package:flutter/material.dart';
import '../../domain/big_card_cubit/big_card_cubit.dart';
import '../../domain/model/card_model.dart';
import '../../domain/model/hc1_model.dart';
import '../../domain/model/hc3_model.dart';
import '../../domain/model/hc5_model.dart';
import '../../domain/model/hc6_model.dart';
import '../../domain/model/hc9_model.dart';

import 'hc1_card.dart';
import 'hc3_card.dart';
import 'hc5_card.dart';
import 'hc6_card.dart';
import 'hc9_card.dart';

class ContextualCard extends StatelessWidget {
  final CardGroupDescriptor? cardGroupDescriptor;
  final HC1Cards? hc1CardData;
  final HC3Cards? hc3CardData;
  final HC5Cards? hc5CardData;
  final HC6Cards? hc6CardData;
  final HC9Cards? hc9CardData;
  final BigCardCubit? visibilityCubit;
  final double? cardHeight;
  final double? cardWidth;

  const ContextualCard({
    this.cardGroupDescriptor,
    this.hc1CardData,
    this.hc3CardData,
    this.hc5CardData,
    this.hc6CardData,
    this.hc9CardData,
    this.visibilityCubit,
    this.cardHeight,
    this.cardWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Rendering the appropriate card widget based on the design type.
    switch (cardGroupDescriptor?.designType) {
      case "HC1":
        if (hc1CardData != null) {
          return Hc1Card(
            card: hc1CardData,
          );
        }
        break;
      case "HC3":
        if (visibilityCubit != null && hc3CardData != null) {
          return Hc3Card(
            card: hc3CardData,
            cubit: visibilityCubit!,
          );
        }
        break;
      case "HC5":
        if (hc5CardData != null) {
          return Hc5Card(card: hc5CardData);
        }
        break;
      case "HC6":
        if (hc6CardData != null) {
          return Hc6Card(card: hc6CardData);
        }
        break;
      case "HC9":
        if (hc9CardData != null) {
          return Hc9Card(card: hc9CardData);
        }
        break;
      default:
        break;
    }
    // Return an empty container if no card matches the criteria.
    return Container();
  }
}
