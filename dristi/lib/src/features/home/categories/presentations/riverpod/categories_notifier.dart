import 'package:dristi/src/core/loggers/logger.dart';
import 'package:dristi/src/features/home/categories/domain/use_cases/categories_use_cases.dart';
import 'package:dristi/src/features/home/categories/presentations/riverpod/categories_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesNotifier extends Notifier<CategoriesState> {
  late CategoriesUseCase useCase;

  @override
  CategoriesState build() {
    useCase = ref.read(categoriesUseCaseProvider);
    return const CategoriesState();
  }

  Future<void> getCategoriesComponents(String appLanguage) async {
    try {
      state = state.copyWith(
        status: CategoriesStatus.loading,
      );

      final response = await useCase.getCategoriesComponents(appLanguage);

      if (response.isNotEmpty) {
        state = state.copyWith(
          data: response,
          status: CategoriesStatus.success,
        );
      } else {
        state = state.copyWith(
          status: CategoriesStatus.failure,
        );
      }
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      state = state.copyWith(
        status: CategoriesStatus.failure,
      );
    }
  }
}
