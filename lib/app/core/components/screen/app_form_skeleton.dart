import 'package:flutter/material.dart';
import 'package:retroDownloader/app/core/components/utils/h.dart';

class AppFormSkeleton extends StatefulWidget {
  final List<Widget> children;
  final List<Widget>? childrenBelowTabs;
  final Function? onNew;
  final Function? onFile;
  final Function? onSave;
  final Function? onDelete;
  final Function? onSearch;
  final Function? onPrint;
  final bool Function()? onExit;
  final Function? onHelp;
  final bool hasFormCrud;
  final EdgeInsets? padding;
  final Axis formDirection;
  final bool hasProgressBar;

  const AppFormSkeleton({
    super.key,
    this.onNew,
    this.onFile,
    this.onSave,
    this.onDelete,
    this.onSearch,
    this.onPrint,
    this.onExit,
    this.onHelp,
    this.padding,
    this.formDirection = Axis.horizontal,
    this.hasFormCrud = true,
    this.childrenBelowTabs,
    this.hasProgressBar = false,
    required this.children,
  });

  @override
  State<AppFormSkeleton> createState() => _AppFormSkeletonState();
}

class _AppFormSkeletonState extends State<AppFormSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            const H(8),
            Container(
              padding: widget.padding ?? EdgeInsets.zero,
              width: double.infinity,
              child: Wrap(
                direction: widget.formDirection,
                // spacing: 8,
                children: widget.children,
              ),
            ),
            if (widget.childrenBelowTabs != null) ...{
              const H(8),
              Container(
                padding: widget.padding ?? EdgeInsets.zero,
                width: double.infinity,
                child: Wrap(
                  direction: widget.formDirection,
                  // spacing: 8,
                  children: widget.childrenBelowTabs!,
                ),
              ),
            },
            const H(16),
          ],
        ),
      ],
    );
  }
}
