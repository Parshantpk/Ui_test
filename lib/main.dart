import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ui_test/blocs/cat_bloc/cat_bloc.dart';
import 'package:ui_test/blocs/me_bloc/me_bloc.dart';
import 'package:ui_test/repositories/cat_repository.dart';
import 'package:ui_test/widgets/nav_bar.dart';
import 'repositories/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => CatBloc(
                  catRepository: CatRepository(),
                )..add(LoadCatEvent())),
        BlocProvider(
            create: (_) => MeBloc(
                  catRepository: CatRepository(),
                )..add(LoadMeEvent())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: Colors.blue,
        ),
        home: const NavBar(),
      ),
    );
  }
}
