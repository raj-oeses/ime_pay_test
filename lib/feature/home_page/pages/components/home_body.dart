import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ime_pay_test/core/constants/demo_data.dart';
import 'package:ime_pay_test/feature/home_page/pages/components/heading_section.dart';
import 'package:ime_pay_test/feature/home_page/pages/components/stock_cart_widget.dart';
import 'package:ime_pay_test/feature/home_page/pages/stock_bloc/stock_state.dart';

import '../stock_bloc/stock_bloc.dart';
import '../stock_bloc/stock_event.dart';
import 'buttons.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    context.read<StockBloc>().add(FetchStockData(intervalList.first));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockBloc, StockState>(builder: (context, state) {
      if (state is StockLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is StockLoaded) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                HeadingSection(
                    marketSumary: state.totalData?.data?.marketSumary),
                StockChart(dataList: state.stockData),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...intervalList.map((interval) => IntervalBtn(
                        title: interval,
                        onTap: ()=> context
                            .read<StockBloc>()
                            .add(IntervalChange(interval, state.totalData)),
                        isSelected: interval == state.selectedInterval)),
                    const CandleStickBtn(),
                  ],
                ),
              ],
            ),
          ),
        );
      } else if (state is StockError) {
        return Center(child: Text('Error: ${state.message}'));
      }
      return const Center(child: Text('Error'));
    });
  }
}
