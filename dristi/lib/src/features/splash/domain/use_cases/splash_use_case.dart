import 'package:dristi/src/features/splash/domain/entities/splash_entity.dart';
import 'package:dristi/src/features/splash/domain/repositories/splash_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashUseCaseProvider = Provider(
  (ref) {
    return SplashUseCase(
      ref.read(splashRepositoryProvider),
    );
  },
);

class SplashUseCase {
  SplashUseCase(this.repository);

  final SplashRepository repository;

  Future<void> setFirstTime(bool value) async {
    await repository.setFirstTime(value);
  }

  Future<List<SplashEntity>> getSplashComponents() async {
    return repository.getSplashComponents();
  }

  Future<(String, dynamic)> buttonSubmit() async {
    return repository.buttonSubmit();
  }
}
