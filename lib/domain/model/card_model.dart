import 'hc1_model.dart';
import 'hc3_model.dart';
import 'hc5_model.dart';
import 'hc6_model.dart';
import 'hc9_model.dart';

class CardActionDescriptor {
  String? actionText;
  String? actionType;
  String? backgroundColor;
  bool? isRoundedShape;
  bool? isAlternateStyle;
  int? borderThickness;

  CardActionDescriptor({
    this.actionText,
    this.actionType,
    this.backgroundColor,
    this.isRoundedShape,
    this.isAlternateStyle,
    this.borderThickness,
  });

  factory CardActionDescriptor.fromJson(Map<String, dynamic> json) {
    return CardActionDescriptor(
      actionText: json['text']?.toString(),
      actionType: json['type']?.toString(),
      backgroundColor: json['bg_color']?.toString(),
      isRoundedShape: json['is_circular'],
      isAlternateStyle: json['is_secondary'],
      borderThickness: json['stroke_width']?.toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
        'text': actionText,
        'type': actionType,
        'bg_color': backgroundColor,
        'is_circular': isRoundedShape,
        'is_secondary': isAlternateStyle,
        'stroke_width': borderThickness,
      };
}

class CardBackgroundImageDescriptor {
  String? imageVariant;
  String? primaryImageUrl;
  String? alternateImageUrl;
  double? imageProportion;

  CardBackgroundImageDescriptor({
    this.imageVariant,
    this.primaryImageUrl,
    this.alternateImageUrl,
    this.imageProportion,
  });

  factory CardBackgroundImageDescriptor.fromJson(Map<String, dynamic> json) {
    return CardBackgroundImageDescriptor(
      imageVariant: json['image_type']?.toString(),
      primaryImageUrl: json['image_url']?.toString(),
      alternateImageUrl: json['webp_image_url']?.toString(),
      imageProportion: json['aspect_ratio']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'image_type': imageVariant,
        'image_url': primaryImageUrl,
        'webp_image_url': alternateImageUrl,
        'aspect_ratio': imageProportion,
      };
}

class CardTitleEntityDescriptor {
  String? contentText;
  String? contentType;
  String? contentColor;
  int? fontSize;
  String? fontStyle;
  String? fontFamily;

  CardTitleEntityDescriptor({
    this.contentText,
    this.contentType,
    this.contentColor,
    this.fontSize,
    this.fontStyle,
    this.fontFamily,
  });

  factory CardTitleEntityDescriptor.fromJson(Map<String, dynamic> json) {
    return CardTitleEntityDescriptor(
      contentText: json['text']?.toString(),
      contentType: json['type']?.toString(),
      contentColor: json['color']?.toString(),
      fontSize: json['font_size']?.toInt(),
      fontStyle: json['font_style']?.toString(),
      fontFamily: json['font_family']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'text': contentText,
        'type': contentType,
        'color': contentColor,
        'font_size': fontSize,
        'font_style': fontStyle,
        'font_family': fontFamily,
      };
}

class CardTitleDescriptor {
  String? text;
  String? alignment;
  List<CardTitleEntityDescriptor?>? entities;

  CardTitleDescriptor({
    this.text,
    this.alignment,
    this.entities,
  });

  factory CardTitleDescriptor.fromJson(Map<String, dynamic> json) {
    return CardTitleDescriptor(
      text: json['text']?.toString(),
      alignment: json['align']?.toString(),
      entities: json['entities'] != null
          ? (json['entities'] as List)
              .map((v) => CardTitleEntityDescriptor.fromJson(v))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'text': text,
        'align': alignment,
        'entities': entities?.map((v) => v?.toJson()).toList(),
      };
}

class CardGroupItemDescriptor {
  int? id;
  String? name;
  String? slug;
  String? title;
  CardTitleDescriptor? formattedTitle;
  List<dynamic>? positionalImages;
  List<dynamic>? components;
  String? url;
  CardBackgroundImageDescriptor? backgroundImage;
  List<CardActionDescriptor?>? actionItems;
  bool? isDisabled;
  bool? isShareable;
  bool? isInternal;

  CardGroupItemDescriptor({
    this.id,
    this.name,
    this.slug,
    this.title,
    this.formattedTitle,
    this.positionalImages,
    this.components,
    this.url,
    this.backgroundImage,
    this.actionItems,
    this.isDisabled,
    this.isShareable,
    this.isInternal,
  });

  factory CardGroupItemDescriptor.fromJson(Map<String, dynamic> json) {
    return CardGroupItemDescriptor(
      id: json['id']?.toInt(),
      name: json['name']?.toString(),
      slug: json['slug']?.toString(),
      title: json['title']?.toString(),
      formattedTitle: json['formatted_title'] != null
          ? CardTitleDescriptor.fromJson(json['formatted_title'])
          : null,
      url: json['url']?.toString(),
      backgroundImage: json['bg_image'] != null
          ? CardBackgroundImageDescriptor.fromJson(json['bg_image'])
          : null,
      actionItems: json['cta'] != null
          ? (json['cta'] as List)
              .map((v) => CardActionDescriptor.fromJson(v))
              .toList()
          : null,
      isDisabled: json['is_disabled'],
      isShareable: json['is_shareable'],
      isInternal: json['is_internal'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'title': title,
        'formatted_title': formattedTitle?.toJson(),
        'url': url,
        'bg_image': backgroundImage?.toJson(),
        'cta': actionItems?.map((v) => v?.toJson()).toList(),
        'is_disabled': isDisabled,
        'is_shareable': isShareable,
        'is_internal': isInternal,
      };
}

class CardGroupDescriptor {
  int? id;
  String? name;
  String? designType;
  int? cardType;
  List<CardGroupItemDescriptor?>? groupItems;
  bool? isScrollable;
  int? height;
  bool? isFullWidth;
  String? slug;
  int? level;

  CardGroupDescriptor({
    this.id,
    this.name,
    this.designType,
    this.cardType,
    this.groupItems,
    this.isScrollable,
    this.height,
    this.isFullWidth,
    this.slug,
    this.level,
  });

  factory CardGroupDescriptor.fromJson(Map<String, dynamic> json) {
    return CardGroupDescriptor(
      id: json['id']?.toInt(),
      name: json['name']?.toString(),
      designType: json['design_type']?.toString(),
      cardType: json['card_type']?.toInt(),
      groupItems: json['cards'] != null
          ? (json['cards'] as List)
              .map((v) => CardGroupItemDescriptor.fromJson(v))
              .toList()
          : null,
      isScrollable: json['is_scrollable'],
      height: json['height']?.toInt(),
      isFullWidth: json['is_full_width'],
      slug: json['slug']?.toString(),
      level: json['level']?.toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'design_type': designType,
        'card_type': cardType,
        'cards': groupItems?.map((v) => v?.toJson()).toList(),
        'is_scrollable': isScrollable,
        'height': height,
        'is_full_width': isFullWidth,
        'slug': slug,
        'level': level,
      };
}

class CardModel {
  int? id;
  String? slug;
  String? title;
  String? formattedTitle;
  String? description;
  String? formattedDescription;
  String? assets;
  List<CardGroupDescriptor?>? cardGroups;
  HC1? hc1Cards;
  HC3? hc3Cards;
  HC5? hc5Cards;
  HC6? hc6Cards;
  HC9? hc9Cards;

  CardModel({
    this.id,
    this.slug,
    this.title,
    this.formattedTitle,
    this.description,
    this.formattedDescription,
    this.assets,
    this.cardGroups,
    this.hc1Cards,
    this.hc3Cards,
    this.hc5Cards,
    this.hc9Cards,
    this.hc6Cards,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    final cardModel = CardModel(
      id: json['id']?.toInt(),
      slug: json['slug']?.toString(),
      title: json['title']?.toString(),
      formattedTitle: json['formatted_title']?.toString(),
      description: json['description']?.toString(),
      formattedDescription: json['formatted_description']?.toString(),
      assets: json['assets']?.toString(),
    );

    if (json['hc_groups'] != null) {
      final groups = json['hc_groups'] as List;
      cardModel.cardGroups =
          groups.map((v) => CardGroupDescriptor.fromJson(v)).toList();

      for (var group in groups) {
        switch (group['design_type']) {
          case "HC3":
            cardModel.hc3Cards = HC3.fromJson(group);
            break;
          case "HC5":
            cardModel.hc5Cards = HC5.fromJson(group);
            break;
          case "HC6":
            cardModel.hc6Cards = HC6.fromJson(group);
            break;
          case "HC9":
            cardModel.hc9Cards = HC9.fromJson(group);
            break;
          case "HC1":
            cardModel.hc1Cards = HC1.fromJson(group);
            break;
        }
      }
    }

    return cardModel;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'title': title,
        'formatted_title': formattedTitle,
        'description': description,
        'formatted_description': formattedDescription,
        'assets': assets,
        'hc_groups': cardGroups?.map((v) => v?.toJson()).toList(),
      };
}
