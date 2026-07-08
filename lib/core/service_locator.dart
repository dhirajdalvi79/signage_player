import 'package:get_it/get_it.dart';
import 'package:signage_player/core/dio_instance.dart';
import 'package:signage_player/features/media_playback/data/media_repo_impl.dart';
import 'package:signage_player/features/media_playback/data/response_data.dart';
import 'package:signage_player/features/media_playback/domain/media_repo.dart';

class ServiceLocator {
  ServiceLocator._();
  static final ServiceLocator _instance = ServiceLocator._();
  factory ServiceLocator() => _instance;
  final sl = GetIt.instance;

  void _init() {
    sl.registerSingleton<DioInstance>(DioInstance()..init());
    sl.registerSingleton<MockResponse>(MockResponse());

    sl.registerLazySingleton<MediaRepo>(
      () => MediaRepoImpl(dio: sl<DioInstance>(), mock: sl<MockResponse>()),
    );
  }

  void initialize() {
    _init();
  }
}
