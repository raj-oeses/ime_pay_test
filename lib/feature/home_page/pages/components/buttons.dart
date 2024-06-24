import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ime_pay_test/core/utils/colors.dart';
import 'package:ime_pay_test/core/utils/properties.dart';

const _candleTailHeight = 10.0;

class IntervalBtn extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const IntervalBtn(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: isSelected ? selectedColor : Colors.transparent),
        child: Text(title),
      ),
    );
  }
}

class CandleStickBtn extends StatelessWidget {
  const CandleStickBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
                height: _candleTailHeight * .4, width: 2, color: black600),
            Container(
                height: _candleTailHeight,
                width: 5,
                decoration: BoxDecoration(
                    border: Border.all(color: black600),
                    borderRadius: BorderRadius.circular(2.0))),
            Container(height: _candleTailHeight * .4, width: 2, color: black600)
          ],
        ),
        widthBox2,
        Column(
          children: [
            Container(
                height: _candleTailHeight * .5, width: 2, color: black600),
            Container(
                height: _candleTailHeight * .7,
                width: 5,
                decoration: BoxDecoration(
                    border: Border.all(color: black600),
                    borderRadius: BorderRadius.circular(2.0))),
            Container(
                height: _candleTailHeight * .5, width: 2, color: black600),
          ],
        ),
      ],
    );
  }
}
