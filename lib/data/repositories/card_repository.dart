import 'package:fampay/data/service/card_service.dart';
import 'package:fampay/domain/model/card_model.dart';

class CardRepo {
  CardService service;

  CardRepo({required this.service});

  Future<CardModel> getCardsData() => service.fetchCardData();
}
