import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../domain/big_card_cubit/big_card_cubit.dart';
import '../domain/card_bloc/card_bloc.dart';
import '../domain/model/hc1_model.dart';
import '../domain/model/hc3_model.dart';
import '../domain/model/hc5_model.dart';
import '../domain/model/hc6_model.dart';
import '../domain/model/hc9_model.dart';
import 'cards/contextual_card.dart';
import 'utils/assets.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F6F3),
      appBar: _buildAppBar(),
      body: _buildCardBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      surfaceTintColor: Colors.white,
      centerTitle: true,
      title: SvgPicture.asset(Assets.fampaySvg),
    );
  }

  Widget _buildCardBody(BuildContext context) {
    final cardBloc = context.read<CardBloc>();
    cardBloc.add(GetCards());

    return BlocConsumer<CardBloc, CardState>(
      builder: (context, state) => _handleCardState(context, state),
      listener: _handleCardStateChanges,
    );
  }

  Widget _handleCardState(BuildContext context, CardState state) {
    if (state is CardLoading) return _buildLoadingIndicator();
    if (state is CardError) return _buildErrorView(state);
    if (state is CardData) return _buildCardDataView(context, state);
    return _buildDefaultView();
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorView(CardError state) {
    return Center(child: Text(state.errorMessage));
  }

  Widget _buildDefaultView() {
    return const Center(child: Text("Please try again later!"));
  }

  Widget _buildCardDataView(BuildContext context, CardData state) {
    final cardBloc = context.read<CardBloc>();

    return RefreshIndicator(
      onRefresh: () async => cardBloc.add(GetCards()),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHC3Cards(context, state),
            const SizedBox(height: 16),
            _buildHC6Cards(context, state),
            const SizedBox(height: 12),
            _buildHC5Cards(context, state),
            const SizedBox(height: 12),
            _buildHC9Cards(context, state),
            const SizedBox(height: 12),
            _buildHC1Cards(context, state),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, top: 8),
              child: Text(
                'Made with ❤️ Nityam',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHC3Cards(BuildContext context, CardData state) {
    final hc3Data = state.model.hc3Cards;
    if (hc3Data == null) return const SizedBox.shrink();

    return BlocBuilder<BigCardCubit, bool?>(
      builder: (context, isVisible) {
        if (isVisible != true) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: hc3Data.height != null
                ? double.parse(hc3Data.height.toString())
                : 600,
            child: ListView.separated(
              physics: hc3Data.isScrollable!
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ContextualCard(
                cardGroupDescriptor: hc3Data,
                hc3CardData: hc3Data.cards![index],
                visibilityCubit: context.read<BigCardCubit>(),
              ),
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemCount: hc3Data.cards!.length,
            ),
          ),
        );
      },
    );
  }

  Widget _buildHC6Cards(BuildContext context, CardData state) {
    final hc6Data = state.model.hc6Cards;
    if (hc6Data == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: SizedBox(
        height: 64,
        child: ListView.separated(
          physics: hc6Data.isScrollable!
              ? const ClampingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ContextualCard(
            cardGroupDescriptor: hc6Data,
            hc6CardData: hc6Data.cards![index],
            cardHeight: hc6Data.height != null
                ? double.parse(hc6Data.height.toString())
                : 64,
          ),
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemCount: hc6Data.cards!.length,
        ),
      ),
    );
  }

  Widget _buildHC5Cards(BuildContext context, CardData state) {
    final hc5Data = state.model.hc5Cards;
    if (hc5Data == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 160,
        child: ListView.separated(
          physics: hc5Data.isScrollable!
              ? const ClampingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ContextualCard(
            cardGroupDescriptor: hc5Data,
            hc5CardData: hc5Data.cards![index],
          ),
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemCount: hc5Data.cards!.length,
        ),
      ),
    );
  }

  Widget _buildHC9Cards(BuildContext context, CardData state) {
    final hc9Data = state.model.hc9Cards;
    if (hc9Data == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: SizedBox(
        height: hc9Data.height != null
            ? double.parse(hc9Data.height.toString())
            : 195,
        child: ListView.separated(
          physics: hc9Data.isScrollable!
              ? const BouncingScrollPhysics()
              : const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ContextualCard(
            cardGroupDescriptor: hc9Data,
            hc9CardData: hc9Data.cards![index],
          ),
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemCount: hc9Data.cards!.length,
        ),
      ),
    );
  }

  Widget _buildHC1Cards(BuildContext context, CardData state) {
    final hc1Data = state.model.hc1Cards;
    if (hc1Data == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: SizedBox(
        height: hc1Data.height != null
            ? double.parse(hc1Data.height.toString())
            : 64,
        child: hc1Data.isScrollable!
            ? ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ContextualCard(
                  cardGroupDescriptor: hc1Data,
                  hc1CardData: hc1Data.cards![index],
                ),
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemCount: hc1Data.cards!.length,
              )
            : Wrap(
                children: hc1Data.cards!
                    .map((card) => ContextualCard(
                          cardGroupDescriptor: hc1Data,
                          hc1CardData: card,
                        ))
                    .toList(),
              ),
      ),
    );
  }

  void _handleCardStateChanges(BuildContext context, CardState state) {
    if (state is CardError) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please try again later!")),
      );
    }
  }
}
