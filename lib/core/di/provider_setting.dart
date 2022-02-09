import 'package:hive_flutter/adapters.dart';
import 'package:jet_news_app/data/data_source/fake/interest_fake_data_source.dart';
import 'package:jet_news_app/data/data_source/fake/news_fake_data_source.dart';
import 'package:jet_news_app/data/data_source/local/interest_local_data_source.dart';
import 'package:jet_news_app/data/data_source/local/news_local_data_source.dart';
import 'package:jet_news_app/data/repository/interest_repository_impl.dart';
import 'package:jet_news_app/data/repository/news_repository_impl.dart';
import 'package:jet_news_app/domain/repository/interest_repository.dart';
import 'package:jet_news_app/domain/repository/news_repository.dart';
import 'package:jet_news_app/domain/usecase/interest/interest_check_use_case.dart';
import 'package:jet_news_app/domain/usecase/interest/interest_load_use_case.dart';
import 'package:jet_news_app/domain/usecase/news/news_bookmark_use_case.dart';
import 'package:jet_news_app/domain/usecase/news/news_favorite_use_case.dart';
import 'package:jet_news_app/domain/usecase/news/news_load_use_case.dart';
import 'package:jet_news_app/domain/usecase/news/news_share_use_case.dart';
import 'package:jet_news_app/presentation/news_home/news_home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> providerSetting() async {
  await Hive.initFlutter();
  Hive.openBox<int>('interest');
  Hive.openBox<String>('bookmark');
  Hive.openBox<String>('favorite');

  final List<SingleChildWidget> independentProvider = [
    Provider<NewsFakeDataSource>(create: (context) => NewsFakeDataSource()),
    Provider<InterestFakeDataSource>(
        create: (context) => InterestFakeDataSource()),
    Provider<NewsLocalDataSource>(create: (context) => NewsLocalDataSource()),
    Provider<InterestLocalDataSource>(
        create: (context) => InterestLocalDataSource()),
  ];

  final List<SingleChildWidget> dependentProvider = [
    // Repository
    Provider<NewsRepository>(
        create: (context) => NewsRepositoryImpl(
            context.read<NewsFakeDataSource>(),
            context.read<NewsLocalDataSource>())),
    Provider<InterestRepository>(
        create: (context) => InterestRepositoryImpl(
            context.read<InterestFakeDataSource>(),
            context.read<InterestLocalDataSource>())),

    // News UseCase
    ProxyProvider<NewsRepository, NewsLoadUseCase>(
        update: (context, repository, _) => NewsLoadUseCase(repository)),
    ProxyProvider<NewsRepository, NewsBookmarkUseCase>(
        update: (context, repository, _) => NewsBookmarkUseCase(repository)),
    ProxyProvider<NewsRepository, NewsFavoriteUseCase>(
        update: (context, repository, _) => NewsFavoriteUseCase(repository)),
    ProxyProvider<NewsRepository, NewsShareUseCase>(
        update: (context, repository, _) => NewsShareUseCase(repository)),

    // Interest UseCase
    ProxyProvider<InterestRepository, InterestLoadUseCase>(
        update: (context, repository, _) => InterestLoadUseCase(repository)),
    ProxyProvider<InterestRepository, InterestCheckUseCase>(
        update: (context, repository, _) => InterestCheckUseCase(repository)),
  ];

  List<SingleChildWidget> viewModels = [
    ChangeNotifierProvider(
        create: (context) => NewsHomeViewModel(context.read<NewsLoadUseCase>(),
            context.read<NewsBookmarkUseCase>())),
  ];

  List<SingleChildWidget> globalProviders = [
    ...independentProvider,
    ...dependentProvider,
    ...viewModels,
  ];

  return globalProviders;
}
