import 'package:provider/provider.dart';
import 'package:nid_flutter/app/app_service.dart';
import 'package:nid_flutter/like/create/like_create_model.dart';
import 'package:nid_flutter/like/destroy/like_destroy_model.dart';

final likeCreateProvider =
    ChangeNotifierProxyProvider<AppService, LikeCreateModel>(
  create: (context) => LikeCreateModel(
    appService: context.read<AppService>(),
  ),
  update: (context, appService, likeCreateModel) =>
      LikeCreateModel(appService: appService),
);

final likeDestroyProvider =
    ChangeNotifierProxyProvider<AppService, LikeDestroyModel>(
  create: (context) => LikeDestroyModel(
    appService: context.read<AppService>(),
  ),
  update: (context, appService, likeCreateModel) =>
      LikeDestroyModel(appService: appService),
);

final likeProviders = [
  likeCreateProvider,
  likeDestroyProvider,
];
