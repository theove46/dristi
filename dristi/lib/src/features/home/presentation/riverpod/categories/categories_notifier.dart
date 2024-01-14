import 'package:dristi/src/core/utils/loggers/logger.dart';
import 'package:dristi/src/features/home/domain/use_cases/categories_use_cases.dart';
import 'package:dristi/src/features/home/presentation/riverpod/categories/categories_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesNotifier extends Notifier<CategoriesState> {
  late CategoriesUseCase useCase;

  @override
  CategoriesState build() {
    useCase = ref.read(categoriesUseCaseProvider);
    return const CategoriesState();
  }

  Future<void> getCategoriesComponents() async {
    try {
      final response = await useCase.getCategoriesComponents();

      if (response.$1.isEmpty) {
        state = state.copyWith(
          data: response.$2,
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
