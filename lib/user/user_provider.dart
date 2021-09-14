import 'package:provider/provider.dart';
import 'package:nid_flutter/user/create/user_create_model.dart';

final userCreateProvider = ChangeNotifierProvider(
  create: (context) => UserCreateModel(),
);

final userProviders = [
  userCreateProvider,
];
