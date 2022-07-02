import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen({Key? key}) : super(key: key);

  @override
  State<CurrenciesScreen> createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen> {
  final PageController _pageController = PageController();
  double _currenPosition = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      _currenPosition = _pageController.page!;
      setState(() {});


    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF5F627D),
            Color(0xFF313347),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Your Coins"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: DotsIndicator(
                position: _currenPosition,
                dotsCount: 3,
                decorator:
                    DotsDecorator(activeColor: Colors.white, size: Size(6, 6)),
              ),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(pi * _currenPosition),
              child: Container(
                margin: EdgeInsets.only(top: 24, bottom: 18),
                height: 190,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(0, 10),
                      color: Colors.black54,
                      spreadRadius: -5,
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF08AEEA),
                      Color(0xFF2AF598),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (context, index) => Container(
                  child: ListView.separated(
                      itemBuilder: (context, index) => ListTile(
                            title: Text(index.toString()),
                          ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: 10),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
