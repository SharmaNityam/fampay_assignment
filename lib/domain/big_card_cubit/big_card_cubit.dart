import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BigCardCubit extends Cubit<bool?> {
  // When the Cubit is created, I initialize the state to null and load the saved visibility state.
  BigCardCubit() : super(null) {
    _initializeVisibilityState();
  }

  // This private method helps me load the saved visibility state from SharedPreferences.
  Future<void> _initializeVisibilityState() async {
    final prefs = await SharedPreferences.getInstance();
    final isVisible = prefs.getBool('bigCardVisibility');
    // If there's no saved value, I'll assume the big card should be visible by default.
    emit(isVisible ?? true);
  }

  // This method lets me toggle the visibility of the big card.
  void toggleVisibility() {
    if (state != null) {
      emit(!state!);
    }
  }

  // This method allows me to hide the big card permanently and save that preference.
  Future<void> hidePermanently() async {
    emit(false);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('bigCardVisibility', false);
  }
}
