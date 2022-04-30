import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/color/color_constants.dart';
import 'package:flutter_bottom_navigation/color/material_color.dart';
class CardModel {
  String? cardHolderName;
  String? cardNumber;
  String? expDate;
  String? cvv;
  Color? cardColor;

  CardModel({
    this.cardHolderName,
    this.cardNumber,
    this.cvv,
    this.expDate,
    this.cardColor,
  });
}

List<CardModel> cardsList = [
  CardModel(
    cardHolderName: "User",
    cardNumber: "****  ****  ****  1234",
    cvv: "**6",
    expDate: "11/26",
    cardColor: createMaterialColor(Color(0xFF4f51fe)),
  ),
  CardModel(
    cardHolderName: "User",
    cardNumber: "****  ****  ****  4321",
    cvv: "**8",
    expDate: "06/27",
    cardColor: createMaterialColor(Color(0xFFfb7b70)),
  ),
];