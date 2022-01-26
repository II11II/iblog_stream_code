import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iblogs_roadmap/features/counter/data/datasources/counter_local_datasource.dart';
import 'package:iblogs_roadmap/features/counter/data/datasources/counter_remote_datasource.dart';
import 'package:iblogs_roadmap/features/counter/data/repostories/counter_repository.dart';
import 'package:iblogs_roadmap/features/counter/presentation/pages/counter_page.dart';

import 'counter/domain/blocs/counter/counter_bloc.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(
            counterRepository: CounterRepository(
                localDataSource: CounterLocalDataSource(),
                remoteDataSource: CounterRemoteDataSource()))
          ..add(GetCounterEvent()),
        child: const CounterPage(),
      ),
    );
  }
}
