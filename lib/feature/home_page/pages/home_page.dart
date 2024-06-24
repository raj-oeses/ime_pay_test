import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ime_pay_test/feature/home_page/pages/stock_bloc/stock_bloc.dart';

import 'components/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => StockBloc(), child: const HomeBody()));
  }
}
