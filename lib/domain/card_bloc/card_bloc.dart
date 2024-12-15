import 'package:bloc/bloc.dart';
import '../../data/repositories/card_repository.dart';
import '../model/card_model.dart';

abstract class CardState {}

class CardInitial extends CardState {}

class CardLoading extends CardState {}

class CardData extends CardState {
  final CardModel model;

  CardData({required this.model});
}

class CardError extends CardState {
  final String errorMessage;

  CardError({required this.errorMessage});
}

// Abstract class representing events for the CardBloc.
abstract class CardEvent {}

// Event to fetch card data.
class GetCards extends CardEvent {}

class CardBloc extends Bloc<CardEvent, CardState> {
  // Repository instance to fetch card data.
  final CardRepo _repository;

  // Constructor to initialize the bloc with the repository and the initial state.
  CardBloc({required CardRepo repository})
      : _repository = repository,
        super(CardInitial()) {
    // Registering the event handler for the GetCards event.
    on<GetCards>(_fetchCardData);
  }

  // Method to handle the GetCards event.
  Future<void> _fetchCardData(GetCards event, Emitter<CardState> emit) async {
    // Indicating the loading state to the UI.
    emit(CardLoading());

    try {
      // Fetching card data using the repository.
      final cardData = await _repository.getCardsData();
      // Emitting the fetched card data as the new state.
      emit(CardData(model: cardData));
    } catch (error) {
      // Emitting an error state with the error message.
      emit(CardError(errorMessage: error.toString()));
    }
  }
}
