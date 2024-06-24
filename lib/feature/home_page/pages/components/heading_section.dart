import 'package:flutter/material.dart';
import 'package:ime_pay_test/core/utils/colors.dart';
import 'package:ime_pay_test/core/utils/date_time_formatter.dart';
import 'package:ime_pay_test/core/utils/properties.dart';
import 'package:ime_pay_test/feature/home_page/data/model/share_data_model.dart';

import '../../../../core/utils/text_styles.dart';

const _iconSize = 15.0;
const _periodSize = 10.0;

class HeadingSection extends StatefulWidget {
  final MarketSumary? marketSumary;

  const HeadingSection({super.key, required this.marketSumary});

  @override
  State<HeadingSection> createState() => _HeadingSectionState();
}

class _HeadingSectionState extends State<HeadingSection> {
  bool isIncreased = false;

  @override
  void initState() {
    if (widget.marketSumary?.percentChange != null) {
      isIncreased = ((widget.marketSumary?.percentChange)! > 0);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.marketSumary?.todayNepse ?? '',
                style: const TextStyle(
                    fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
              Row(
                children: [
                  Text('2.1 Ar', style: detailsTextStyle),
                  widthBox5,
                  Image.asset(pngImage(isIncreased ? 'increase' : 'decrease'),
                      height: _iconSize,
                      width: _iconSize,
                      color: isIncreased ? greenColor : redColor),
                  widthBox5,
                  Text(
                      '${widget.marketSumary?.change ?? ''}(${widget.marketSumary?.percentChange ?? ''}%)',
                      style: detailsTextStyle.copyWith(
                          color: isIncreased ? greenColor : redColor)),
                ],
              ),
              Text(
                'As of ${DateTimeFormatter.formatDMY(DateTime.now())}',
                style: greyTextStyle,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomDropdown(),
            Row(
              children: [
                Container(
                  height: _periodSize,
                  width: _periodSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_periodSize),
                      color: greenColor),
                ),
                widthBox5,
                Text('Market ', style: detailsTextStyle),
                Text('OPEN',
                    style: detailsTextStyle.copyWith(color: greenColor)),
              ],
            ),
            Text(
              'Closes in 3 hr 9 min',
              style: greyTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String selectedValue = 'NEPSE';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          color: grey200.withOpacity(.5),
          borderRadius: BorderRadius.circular(16)),
      child: DropdownButton<String>(
        value: selectedValue,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: const SizedBox.shrink(),
        onChanged: (String? newValue) =>
            setState(() => selectedValue = newValue!),
        items: <String>['NEPSE', 'NASDAQ', 'NYSE']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          );
        }).toList(),
      ),
    );
  }
}
