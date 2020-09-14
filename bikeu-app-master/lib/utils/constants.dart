import 'package:flutter/material.dart';

const apiUrl = "hhttp://bikeu.blasterinformation.com/api";

//Colors
const blueDrakColor = Color.fromRGBO(5, 69, 93, 1);
const blueColor = Color.fromRGBO(0, 191, 242, 1);
const greenColor = Color.fromRGBO(166, 203, 40, 1);
const greenDarkColor = Color.fromRGBO(0, 89, 112, 1);
const lightGreenColor = Color.fromRGBO(0, 181, 241, 1);
const orangeColor = Color.fromRGBO(254, 164, 40, 1);
const darkOrangeColor = Color.fromRGBO(245, 123, 81, 1);
const purpleColor = Color.fromRGBO(240, 19, 77, 1);
const shadowColor = Color.fromRGBO(0, 89, 112, 0.1);
const greyColor = Colors.grey;
const greybackgroundColor = Color.fromRGBO(234, 240, 242, 1);
const blackColor = Colors.black;
const whiteColor = Colors.white;
const yellowColor = Colors.yellow;


//Text styles
const titleBlack1 = TextStyle(fontSize: 26.0, color: blackColor, fontWeight: FontWeight.bold);
const titleBlack2 = TextStyle(fontSize: 23.0, color: blackColor, fontWeight: FontWeight.bold);
const titleBlack3 = TextStyle(fontSize: 20.0, color: blackColor, fontWeight: FontWeight.bold);
const titleBlack4 = TextStyle(fontSize: 17.0, color: blackColor, fontWeight: FontWeight.bold);
const titleBlack5 = TextStyle(fontSize: 14.0, color: blackColor, fontWeight: FontWeight.bold);
const titleBlack6 = TextStyle(fontSize: 11.0, color: blackColor, fontWeight: FontWeight.bold);

const titleGreenDarkColor1 = TextStyle(fontSize: 26.0, color: greenDarkColor, fontWeight: FontWeight.bold);
const titleGreenDarkColor2 = TextStyle(fontSize: 23.0, color: greenDarkColor, fontWeight: FontWeight.bold);
const titleGreenDarkColor3 = TextStyle(fontSize: 20.0, color: greenDarkColor, fontWeight: FontWeight.bold);
const titleGreenDarkColor4 = TextStyle(fontSize: 17.0, color: greenDarkColor, fontWeight: FontWeight.bold);
const titleGreenDarkColor5 = TextStyle(fontSize: 14.0, color: greenDarkColor, fontWeight: FontWeight.bold);
const titleGreenDarkColor6 = TextStyle(fontSize: 11.0, color: greenDarkColor, fontWeight: FontWeight.bold);

const titleGreen1 = TextStyle(fontSize: 26.0, color: greenColor, fontWeight: FontWeight.bold);
const titleGreen2 = TextStyle(fontSize: 23.0, color: greenColor, fontWeight: FontWeight.bold);
const titleGreen3 = TextStyle(fontSize: 20.0, color: greenColor, fontWeight: FontWeight.bold);
const titleGreen4 = TextStyle(fontSize: 17.0, color: greenColor, fontWeight: FontWeight.bold);
const titleGreen5 = TextStyle(fontSize: 14.0, color: greenColor, fontWeight: FontWeight.bold);
const titleGreen6 = TextStyle(fontSize: 11.0, color: greenColor, fontWeight: FontWeight.bold);

const titleOrange1 = TextStyle(fontSize: 26.0, color: orangeColor, fontWeight: FontWeight.bold);
const titleOrange2 = TextStyle(fontSize: 23.0, color: orangeColor, fontWeight: FontWeight.bold);
const titleOrange3 = TextStyle(fontSize: 20.0, color: orangeColor, fontWeight: FontWeight.bold);
const titleOrange4 = TextStyle(fontSize: 17.0, color: orangeColor, fontWeight: FontWeight.bold);
const titleOrange5 = TextStyle(fontSize: 14.0, color: orangeColor, fontWeight: FontWeight.bold);
const titleOrange6 = TextStyle(fontSize: 11.0, color: orangeColor, fontWeight: FontWeight.bold);

const titleGrey1 = TextStyle(fontSize: 26.0, color: greyColor, fontWeight: FontWeight.bold);
const titleGrey2 = TextStyle(fontSize: 23.0, color: greyColor, fontWeight: FontWeight.bold);
const titleGrey3 = TextStyle(fontSize: 20.0, color: greyColor, fontWeight: FontWeight.bold);
const titleGrey4 = TextStyle(fontSize: 17.0, color: greyColor, fontWeight: FontWeight.bold);
const titleGrey5 = TextStyle(fontSize: 14.0, color: greyColor, fontWeight: FontWeight.bold);
const titleGrey6 = TextStyle(fontSize: 11.0, color: greyColor, fontWeight: FontWeight.bold);

const titleWhite1 = TextStyle(fontSize: 26.0, color: whiteColor, fontWeight: FontWeight.bold);
const titleWhite2 = TextStyle(fontSize: 23.0, color: whiteColor, fontWeight: FontWeight.bold);
const titleWhite3 = TextStyle(fontSize: 20.0, color: whiteColor, fontWeight: FontWeight.bold);
const titleWhite4 = TextStyle(fontSize: 17.0, color: whiteColor, fontWeight: FontWeight.bold);
const titleWhite5 = TextStyle(fontSize: 14.0, color: whiteColor, fontWeight: FontWeight.bold);
const titleWhite6 = TextStyle(fontSize: 11.0, color: whiteColor, fontWeight: FontWeight.bold);

const textBlack1 = TextStyle(fontSize: 26.0, color: blackColor, fontWeight: FontWeight.normal);
const textBlack2 = TextStyle(fontSize: 23.0, color: blackColor, fontWeight: FontWeight.normal);
const textBlack3 = TextStyle(fontSize: 20.0, color: blackColor, fontWeight: FontWeight.normal);
const textBlack4 = TextStyle(fontSize: 17.0, color: blackColor, fontWeight: FontWeight.normal);
const textBlack5 = TextStyle(fontSize: 14.0, color: blackColor, fontWeight: FontWeight.normal);
const textBlack6 = TextStyle(fontSize: 11.0, color: blackColor, fontWeight: FontWeight.normal);

const textWhite1 = TextStyle(fontSize: 26.0, color: whiteColor, fontWeight: FontWeight.normal);
const textWhite2 = TextStyle(fontSize: 23.0, color: whiteColor, fontWeight: FontWeight.normal);
const textWhite3 = TextStyle(fontSize: 20.0, color: whiteColor, fontWeight: FontWeight.normal);
const textWhite4 = TextStyle(fontSize: 17.0, color: whiteColor, fontWeight: FontWeight.normal);
const textWhite5 = TextStyle(fontSize: 14.0, color: whiteColor, fontWeight: FontWeight.normal);
const textWhite6 = TextStyle(fontSize: 11.0, color: whiteColor, fontWeight: FontWeight.normal);

const textgreen1 = TextStyle(fontSize: 26.0, color: greenColor, fontWeight: FontWeight.normal);
const textgreen2 = TextStyle(fontSize: 23.0, color: greenColor, fontWeight: FontWeight.normal);
const textgreen3 = TextStyle(fontSize: 20.0, color: greenColor, fontWeight: FontWeight.normal);
const textgreen4 = TextStyle(fontSize: 17.0, color: greenColor, fontWeight: FontWeight.normal);
const textgreen5 = TextStyle(fontSize: 14.0, color: greenColor, fontWeight: FontWeight.normal);
const textgreen6 = TextStyle(fontSize: 11.0, color: greenColor, fontWeight: FontWeight.normal);

const textGrey1 = TextStyle(fontSize: 26.0, color: greyColor, fontWeight: FontWeight.normal);
const textGrey2 = TextStyle(fontSize: 23.0, color: greyColor, fontWeight: FontWeight.normal);
const textGrey3 = TextStyle(fontSize: 20.0, color: greyColor, fontWeight: FontWeight.normal);
const textGrey4 = TextStyle(fontSize: 17.0, color: greyColor, fontWeight: FontWeight.normal);
const textGrey5 = TextStyle(fontSize: 14.0, color: greyColor, fontWeight: FontWeight.normal);
const textGrey6 = TextStyle(fontSize: 11.0, color: greyColor, fontWeight: FontWeight.normal);

const textGreenDark1 = TextStyle(fontSize: 26.0, color: greenDarkColor, fontWeight: FontWeight.normal);
const textGreenDark2 = TextStyle(fontSize: 23.0, color: greenDarkColor, fontWeight: FontWeight.normal);
const textGreenDark3 = TextStyle(fontSize: 20.0, color: greenDarkColor, fontWeight: FontWeight.normal);
const textGreenDark4 = TextStyle(fontSize: 17.0, color: greenDarkColor, fontWeight: FontWeight.normal);
const textGreenDark5 = TextStyle(fontSize: 14.0, color: greenDarkColor, fontWeight: FontWeight.normal);
const textGreenDark6 = TextStyle(fontSize: 11.0, color: greenDarkColor, fontWeight: FontWeight.normal);