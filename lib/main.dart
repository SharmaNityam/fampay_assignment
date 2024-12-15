import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/card_bloc/card_bloc.dart';
import 'package:flutter/material.dart';
import 'data/service/card_service.dart';
import 'domain/big_card_cubit/big_card_cubit.dart';
import 'data/repositories/card_repository.dart';
import 'presentation/card_view.dart';

void main() => runApp(const ApplicationRoot());

class ApplicationRoot extends StatelessWidget {
  const ApplicationRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FamPay Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CardBloc>(
            create: (context) => CardBloc(
              repository: CardRepo(service: CardService()),
            ),
          ),
          BlocProvider<BigCardCubit>(
            create: (context) => BigCardCubit(),
          ),
        ],
        child: const CardView(),
      ),
    );
  }
}
