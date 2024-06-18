import 'package:dristi/l10n/localizations.dart';
import 'package:equatable/equatable.dart';

class LanguageState extends Equatable {
  const LanguageState({
    this.language = AppLanguages.en,
  });

  final AppLanguages language;

  LanguageState copyWith({
    AppLanguages? language,
  }) {
    return LanguageState(
      language: language ?? this.language,
    );
  }

  @override
  List<Object?> get props => [language];
}
