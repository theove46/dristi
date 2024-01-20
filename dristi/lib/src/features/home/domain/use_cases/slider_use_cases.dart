import 'package:dristi/src/features/home/domain/entities/slider_entity.dart';
import 'package:dristi/src/features/home/domain/repositories/slider_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderUseCaseProvider = Provider(
  (ref) {
    return SliderUseCase(
      ref.read(sliderRepositoryProvider),
    );
  },
);

class SliderUseCase {
  SliderUseCase(this.repository);

  final SliderRepository repository;

  Future<(String, List<SliderEntity>?)> getSliderComponents() async {
    return repository.getSliderComponents();
  }
}
