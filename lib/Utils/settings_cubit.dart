import 'package:bloc/bloc.dart';

enum ThemeModeEvent { toggle }

class ThemeModeCubit extends Cubit<bool> {
  ThemeModeCubit() : super(false);

  void toggleTheme() {
    emit(!state);
  }
}
