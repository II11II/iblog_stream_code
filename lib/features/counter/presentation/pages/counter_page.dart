import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iblogs_roadmap/features/counter/domain/blocs/counter/counter_bloc.dart';
import 'package:iblogs_roadmap/features/counter/presentation/widgets/aimated_background.dart';
import 'package:iblogs_roadmap/inherited/inherited_model.dart';
import 'package:iblogs_roadmap/inherited/inherited_notifier.dart';
import 'package:iblogs_roadmap/inherited/inherited_widget.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    final theme = Theme.of(ctx);
    return MyInheritedNotifier(
      myNotifier: MyNotifier(),
      child: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () =>
                  ctx.read<CounterBloc>().add(const IncrementCounterEvent(incByNumber: 1)),
              child: const Icon(
                Icons.add,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            FloatingActionButton(
              onPressed: () =>
                  ctx.read<CounterBloc>().add(const DecrementCounterEvent(decByNumber: 1)),
              child: const Icon(
                Icons.remove,
              ),
              backgroundColor: Colors.red,
            ),
          ],
        ),
        body: ColorFullWidget(
          child: BlocSelector<CounterBloc, CounterState, int>(
            selector: (state) => state.number,
            builder: (_, number) {
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Counter App",
                      style: theme.textTheme.headline3,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(.2),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          height: 128,
                          child: Center(
                            child: ColoredBox(
                              color: Colors.transparent,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  AnimatedPositioned(
                                    top: number.isOdd ? 0 : 25,
                                    duration: const Duration(milliseconds: 200),
                                    child: Text(
                                      "$number",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 64),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox.shrink(),
                    // GestureDetector(
                    //   onTap: () {
                    //     MyInheritedNotifier.of(ctx).notifier!.counter += 1;
                    //   },
                    //   child: Builder(builder: (context) {
                    //     return Text(MyInheritedNotifier.of(ctx).notifier!.counter.toString(),
                    //         style: TextStyle(fontSize: 50));
                    //   }),
                    // ),


                  ],
                ),
              );
            },
          ),
        ),
      )
    );
  }
}
