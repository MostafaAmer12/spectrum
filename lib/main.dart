import 'package:bot_toast/bot_toast.dart';
import 'package:educational_kids_game/core/services/cache_services.dart';
import 'package:educational_kids_game/core/services/get_it_service.dart';
import 'package:educational_kids_game/core/services/simple_bloc_observer_service.dart';
import 'package:educational_kids_game/features/auth/data/repos_impl/auth_repos_impl.dart';
import 'package:educational_kids_game/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:educational_kids_game/features/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserverService();
  getItService();
  await CacheService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(
              getIt.get<AuthReposImpl>(),
            ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(),
          home: const SplashView(),
        ));
  }
}
