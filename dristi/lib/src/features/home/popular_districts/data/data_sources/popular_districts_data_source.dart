import 'package:dristi/src/features/home/popular_districts/data/data_sources/popular_districts_data_source_impl.dart';
import 'package:dristi/src/features/home/popular_districts/data/model/popular_districts_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final popularDistrictDataSourceProvider = Provider<PopularDistrictDataSource>(
  (ref) {
    return PopularDistrictDataSourceImp();
  },
);

abstract class PopularDistrictDataSource {
  Future<PopularDistrictsResponseModel> popularDistrictComponents(
      String appLanguage);
}
