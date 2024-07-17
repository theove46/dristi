import 'package:dristi/src/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  const ThemeState({
    this.theme = AppTheme.systemDefault,
  });

  final AppTheme theme;

  ThemeState copyWith({
    AppTheme? theme,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object?> get props => [theme];
}
