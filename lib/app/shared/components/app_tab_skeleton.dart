import 'package:flutter/material.dart';
import 'package:retroDownloader/app/shared/components/utils/w.dart';

class AppTabSkeleton extends StatefulWidget {
  final List<Widget>? children;
  final Widget? child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool scrollable;
  final double height;
  final AlignmentGeometry aligment;

  const AppTabSkeleton({
    required this.children,
    this.scrollable = false,
    this.height = 0,
    this.margin,
    this.padding,
    this.child,
    this.aligment = Alignment.centerLeft,
    super.key,
  });

  const AppTabSkeleton.child({
    required this.child,
    this.scrollable = false,
    this.height = 0,
    this.margin,
    this.padding,
    this.children,
    this.aligment = Alignment.centerLeft,
    super.key,
  });

  const AppTabSkeleton.scrollable({
    required this.children,
    this.scrollable = true,
    this.height = 200,
    this.margin,
    this.padding,
    this.child,
    this.aligment = Alignment.centerLeft,
    super.key,
  });

  @override
  State<AppTabSkeleton> createState() => _AppTabSkeletonState();
}

class _AppTabSkeletonState extends State<AppTabSkeleton> {
  @override
  Widget build(BuildContext context) {
    return widget.scrollable ? _scrollable() : _normal();
  }

  Widget _normal() {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        margin: widget.margin ?? const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        padding: widget.padding,
        width: double.infinity,
        child: Align(
          alignment: widget.aligment,
          child: Wrap(
            spacing: 8,
            children: (widget.children != null ? widget.children! : [widget.child])
                .map(
                  (e) => SizedBox(
                    width: getWidth(constraints.maxWidth, e),
                    child: e,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  double rowCount = 0;

  double? getWidth(double availablWidth, e) {
    try {
      if (e.columnLength == null) return null;
      final dividendo = (availablWidth - 32) / 6;
      final width = dividendo * e.columnLength;
      rowCount += e.columnLength;
      if (rowCount == 6) {
        rowCount = 0;
        return width;
      }
      return width - 8.0000000001;
    } catch (_) {}
    return null;
  }

  Widget _scrollable() {
    return Container(
      margin: widget.margin ?? const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      width: double.maxFinite,
      height: widget.height,
      child: ListView.separated(
        padding: widget.padding,
        scrollDirection: Axis.horizontal,
        itemCount: widget.children!.length,
        separatorBuilder: (_, i) => const W(8),
        itemBuilder: (_, i) => widget.children![i],
      ),
    );
  }
}
