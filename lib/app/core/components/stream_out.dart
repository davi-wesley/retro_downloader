import 'package:flutter/material.dart';
import 'package:retroDownloader/app/core/components/loading.dart';

class StreamOut<T> extends StatelessWidget {
  final Stream<T> stream;
  final Widget Function(BuildContext context, T data) child;
  final Function? preFunction;
  final bool condition;
  final Function? request;
  final Widget? loading;
  final double columnLength;

  const StreamOut({
    super.key,
    required this.stream,
    required this.child,
    this.preFunction,
    this.condition = true,
    this.request,
    this.loading,
    this.columnLength = 1,
  });

  @override
  Widget build(BuildContext context) {
    if (condition && preFunction != null) preFunction!.call();
    return StreamBuilder<T>(
      stream: stream,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.active || snapshot.hasData) {
          return child(_, snapshot.requireData);
        } else {
          return loading ?? const LoadingStacked();
        }
      },
    );
  }
}

class StreamOutNull<T> extends StatelessWidget {
  final Stream<T?> stream;
  final Widget Function(BuildContext context, T? data) child;
  final Function? preFunction;
  final bool condition;
  final Function? request;
  final Widget? loading;
  final double columnLength;

  const StreamOutNull({
    super.key,
    required this.stream,
    required this.child,
    this.preFunction,
    this.condition = true,
    this.request,
    this.loading,
    this.columnLength = 1,
  });

  @override
  Widget build(BuildContext context) {
    if (condition && preFunction != null) preFunction!.call();
    return StreamBuilder<T?>(
      stream: stream,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.active || snapshot.hasData) {
          return child(_, snapshot.requireData);
        } else {
          return loading ?? const LoadingStacked();
        }
      },
    );
  }
}
