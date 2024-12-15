import 'package:fampay/domain/model/card_model.dart';

class HC3CardsCta {
  String? text;
  String? type;
  String? bgColor;
  bool? isCircular;
  bool? isSecondary;
  int? strokeWidth;

  HC3CardsCta({
    this.text,
    this.type,
    this.bgColor,
    this.isCircular,
    this.isSecondary,
    this.strokeWidth,
  });
  HC3CardsCta.fromJson(Map<String, dynamic> json) {
    text = json['text']?.toString();
    type = json['type']?.toString();
    bgColor = json['bg_color']?.toString();
    isCircular = json['is_circular'];
    isSecondary = json['is_secondary'];
    strokeWidth = json['stroke_width']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['type'] = type;
    data['bg_color'] = bgColor;
    data['is_circular'] = isCircular;
    data['is_secondary'] = isSecondary;
    data['stroke_width'] = strokeWidth;
    return data;
  }
}

class HC3CardsBgImage {
  String? imageType;
  String? imageUrl;
  String? webpImageUrl;
  double? aspectRatio;

  HC3CardsBgImage({
    this.imageType,
    this.imageUrl,
    this.webpImageUrl,
    this.aspectRatio,
  });
  HC3CardsBgImage.fromJson(Map<String, dynamic> json) {
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

class HC3CardsFormattedTitleEntities {
  String? text;
  String? type;
  String? color;
  int? fontSize;
  String? fontStyle;
  String? fontFamily;

  HC3CardsFormattedTitleEntities({
    this.text,
    this.type,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.fontFamily,
  });
  HC3CardsFormattedTitleEntities.fromJson(Map<String, dynamic> json) {
    text = json['text']?.toString();
    type = json['type']?.toString();
    color = json['color']?.toString();
    fontSize = json['font_size']?.toInt();
    fontStyle = json['font_style']?.toString();
    fontFamily = json['font_family']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['type'] = type;
    data['color'] = color;
    data['font_size'] = fontSize;
    data['font_style'] = fontStyle;
    data['font_family'] = fontFamily;
    return data;
  }
}

class HC3CardsFormattedTitle {
  String? text;
  String? align;
  List<HC3CardsFormattedTitleEntities?>? entities;

  HC3CardsFormattedTitle({
    this.text,
    this.align,
    this.entities,
  });
  HC3CardsFormattedTitle.fromJson(Map<String, dynamic> json) {
    text = json['text']?.toString();
    align = json['align']?.toString();
    if (json['entities'] != null) {
      final v = json['entities'];
      final arr0 = <HC3CardsFormattedTitleEntities>[];
      v.forEach((v) {
        arr0.add(HC3CardsFormattedTitleEntities.fromJson(v));
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

class HC3Cards {
  int? id;
  String? name;
  String? slug;
  String? title;
  HC3CardsFormattedTitle? formattedTitle;
  List<dynamic>? positionalImages;
  List<dynamic>? components;
  String? url;
  HC3CardsBgImage? bgImage;
  List<HC3CardsCta?>? cta;
  bool? isDisabled;
  bool? isShareable;
  bool? isInternal;

  HC3Cards({
    this.id,
    this.name,
    this.slug,
    this.title,
    this.formattedTitle,
    this.positionalImages,
    this.components,
    this.url,
    this.bgImage,
    this.cta,
    this.isDisabled,
    this.isShareable,
    this.isInternal,
  });
  HC3Cards.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    slug = json['slug']?.toString();
    title = json['title']?.toString();
    formattedTitle = (json['formatted_title'] != null)
        ? HC3CardsFormattedTitle.fromJson(json['formatted_title'])
        : null;
    url = json['url']?.toString();
    bgImage = (json['bg_image'] != null)
        ? HC3CardsBgImage.fromJson(json['bg_image'])
        : null;
    if (json['cta'] != null) {
      final v = json['cta'];
      final arr0 = <HC3CardsCta>[];
      v.forEach((v) {
        arr0.add(HC3CardsCta.fromJson(v));
      });
      cta = arr0;
    }
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
    data['url'] = url;
    if (bgImage != null) {
      data['bg_image'] = bgImage!.toJson();
    }
    if (cta != null) {
      final v = cta;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['cta'] = arr0;
    }
    data['is_disabled'] = isDisabled;
    data['is_shareable'] = isShareable;
    data['is_internal'] = isInternal;
    return data;
  }
}

class HC3 extends CardGroupDescriptor {
  int? id;
  String? name;
  String? designType;
  int? cardType;
  List<HC3Cards?>? cards;
  bool? isScrollable;
  int? height;
  bool? isFullWidth;
  String? slug;
  int? level;

  HC3({
    this.id,
    this.name,
    this.designType,
    this.cardType,
    this.cards,
    this.isScrollable,
    this.height,
    this.isFullWidth,
    this.slug,
    this.level,
  });
  HC3.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    designType = json['design_type']?.toString();
    cardType = json['card_type']?.toInt();
    if (json['cards'] != null) {
      final v = json['cards'];
      final arr0 = <HC3Cards>[];
      v.forEach((v) {
        arr0.add(HC3Cards.fromJson(v));
      });
      cards = arr0;
    }
    isScrollable = json['is_scrollable'];
    height = json['height']?.toInt();
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
    data['height'] = height;
    data['is_full_width'] = isFullWidth;
    data['slug'] = slug;
    data['level'] = level;
    return data;
  }
}
