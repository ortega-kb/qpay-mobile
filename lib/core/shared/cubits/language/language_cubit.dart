
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../utils/constants.dart';

part 'language_state.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  LanguageCubit() : super (LanguageState(Constants.locale));

  void changeLanguage(String language) => emit(LanguageState(language));

  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    final language = json['language'] as String?;
    return language != null ? LanguageState(language): null;
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    return {'language': state.language};
  }
}
