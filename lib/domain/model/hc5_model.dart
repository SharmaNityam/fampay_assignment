import 'package:fampay/domain/model/card_model.dart';

class HC5CardsBgImage {
  String? imageType;
  String? imageUrl;
  String? webpImageUrl;
  double? aspectRatio;

  HC5CardsBgImage({
    this.imageType,
    this.imageUrl,
    this.webpImageUrl,
    this.aspectRatio,
  });
  HC5CardsBgImage.fromJson(Map<String, dynamic> json) {
    imageType = json['image_type']?.toString();
    imageUrl = json['image_url']?.toString();
    webpImageUrl = json['webp_image_url']?.toString();
    aspectRatio = json['aspect_ratio']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image_type'] = imageType;
    data['image_url'] = imageUrl;
    data['webp_image_url'] = webpImageUrl;
    data['aspect_ratio'] = aspectRatio;
    return data;
  }
}

class HC5CardsFormattedTitleEntities {
  String? type;
  String? fontStyle;
  String? fontFamily;

  HC5CardsFormattedTitleEntities({
    this.type,
    this.fontStyle,
    this.fontFamily,
  });
  HC5CardsFormattedTitleEntities.fromJson(Map<String, dynamic> json) {
    type = json['type']?.toString();
    fontStyle = json['font_style']?.toString();
    fontFamily = json['font_family']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['font_style'] = fontStyle;
    data['font_family'] = fontFamily;
    return data;
  }
}

class HC5CardsFormattedTitle {
  String? text;
  String? align;
  List<HC5CardsFormattedTitleEntities?>? entities;

  HC5CardsFormattedTitle({
    this.text,
    this.align,
    this.entities,
  });
  HC5CardsFormattedTitle.fromJson(Map<String, dynamic> json) {
    text = json['text']?.toString();
    align = json['align']?.toString();
    if (json['entities'] != null) {
      final v = json['entities'];
      final arr0 = <HC5CardsFormattedTitleEntities>[];
      v.forEach((v) {
        arr0.add(HC5CardsFormattedTitleEntities.fromJson(v));
      });
      entities = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['align'] = align;
    if (entities != null) {
      final v = entities;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['entities'] = arr0;
    }
    return data;
  }
}

class HC5Cards {
  int? id;
  String? name;
  String? slug;
  String? title;
  HC5CardsFormattedTitle? formattedTitle;
  List<dynamic>? positionalImages;
  List<dynamic>? components;
  HC5CardsBgImage? bgImage;
  bool? isDisabled;
  bool? isShareable;
  bool? isInternal;

  HC5Cards({
    this.id,
    this.name,
    this.slug,
    this.title,
    this.formattedTitle,
    this.positionalImages,
    this.components,
    this.bgImage,
    this.isDisabled,
    this.isShareable,
    this.isInternal,
  });
  HC5Cards.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    slug = json['slug']?.toString();
    title = json['title']?.toString();
    formattedTitle = (json['formatted_title'] != null)
        ? HC5CardsFormattedTitle.fromJson(json['formatted_title'])
        : null;
    bgImage = (json['bg_image'] != null)
        ? HC5CardsBgImage.fromJson(json['bg_image'])
        : null;
    isDisabled = json['is_disabled'];
    isShareable = json['is_shareable'];
    isInternal = json['is_internal'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['title'] = title;
    if (formattedTitle != null) {
      data['formatted_title'] = formattedTitle!.toJson();
    }
    if (bgImage != null) {
      data['bg_image'] = bgImage!.toJson();
    }
    data['is_disabled'] = isDisabled;
    data['is_shareable'] = isShareable;
    data['is_internal'] = isInternal;
    return data;
  }
}

class HC5 extends CardGroupDescriptor {
  int? id;
  String? name;
  String? designType;
  int? cardType;
  List<HC5Cards?>? cards;
  bool? isScrollable;
  bool? isFullWidth;
  String? slug;
  int? level;

  HC5({
    this.id,
    this.name,
    this.designType,
    this.cardType,
    this.cards,
    this.isScrollable,
    this.isFullWidth,
    this.slug,
    this.level,
  });
  HC5.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    designType = json['design_type']?.toString();
    cardType = json['card_type']?.toInt();
    if (json['cards'] != null) {
      final v = json['cards'];
      final arr0 = <HC5Cards>[];
      v.forEach((v) {
        arr0.add(HC5Cards.fromJson(v));
      });
      cards = arr0;
    }
    isScrollable = json['is_scrollable'];
    isFullWidth = json['is_full_width'];
    slug = json['slug']?.toString();
    level = json['level']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['design_type'] = designType;
    data['card_type'] = cardType;
    if (cards != null) {
      final v = cards;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['cards'] = arr0;
    }
    data['is_scrollable'] = isScrollable;
    data['is_full_width'] = isFullWidth;
    data['slug'] = slug;
    data['level'] = level;
    return data;
  }
}
