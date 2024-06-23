import 'package:dristi/src/features/hotels_list/data/data_sources/hotels_list_data_source_impl.dart';
import 'package:dristi/src/features/hotels_list/data/models/hotels_list_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelsListDataSourceProvider = Provider<HotelsListDataSource>(
  (ref) {
    return HotelsListDataSourceImp();
  },
);

abstract class HotelsListDataSource {
  Future<HotelsListResponseModel> getHotelsListComponents(String appLanguage);
}
