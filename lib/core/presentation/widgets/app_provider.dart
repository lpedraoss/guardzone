import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProvider<T extends BlocBase<S>, S> extends StatelessWidget {
  const AppProvider({
    super.key,
    required this.builder,
    required this.create,
    this.listener,
  });

  final T Function(BuildContext context) create;

  final Widget Function(BuildContext context, S state) builder;

  final void Function(BuildContext context, S state)? listener;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: create,
      child: Builder(
        builder: (_) {
          if (listener != null) {
            return BlocConsumer<T, S>(builder: builder, listener: listener!);
          }
          return BlocBuilder<T, S>(builder: builder);
        },
      ),
    );
  }
}