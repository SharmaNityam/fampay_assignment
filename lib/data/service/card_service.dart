import 'dart:convert';
import 'package:flutter/material.dart';
import '../../domain/model/card_model.dart';
import 'package:http/http.dart' as http;

class CardService {
  final String _baseUrl;

  CardService({
    String baseUrl =
        "https://polyjuice.kong.fampay.co/mock/famapp/feed/home_section/?slugs=famx-paypage",
  }) : _baseUrl = baseUrl;

  Future<CardModel> fetchCardData() async {
    try {
      final uri = Uri.parse(_baseUrl);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        if (data.isNotEmpty) {
          return CardModel.fromJson(data.first);
        } else {
          throw Exception("No card data available.");
        }
      } else {
        throw Exception(
            "Failed to load card data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      debugPrint("Error fetching card data: $error");
      throw Exception("Error fetching card data: $error");
    }
  }
}
