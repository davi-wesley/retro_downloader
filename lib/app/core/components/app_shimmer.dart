import 'package:flutter/material.dart';
import 'package:retroDownloader/app/core/components/app_text_box.dart';
import 'package:retroDownloader/app/core/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final Widget child;
  final bool enable;

  const AppShimmer({super.key, required this.child, this.enable = true});

  @override
  Widget build(BuildContext context) {
    return !enable
        ? child
        : IgnorePointer(
            ignoring: true,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[100]!,
              period: const Duration(milliseconds: 800),
              child: child,
            ),
          );
  }
}

class AppShimmerBox extends StatelessWidget {
  final double columnLength;
  final EdgeInsets? margin;

  const AppShimmerBox({super.key, this.margin, this.columnLength = 1});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        margin: margin ?? const EdgeInsets.only(top: 26),
        width: double.maxFinite,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(0xFFF4F6FB),
        ),
      ),
    );
  }
}

class AppShimmerField extends StatelessWidget {
  final double columnLength;

  const AppShimmerField({super.key, this.columnLength = 1});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: AppTextBox(
        label: 'Carregando...',
        columnLength: columnLength,
      ),
    );
  }
}

class AppShimmerTable extends StatelessWidget {
  final double columnLength;
  final double height;
  final EdgeInsets? margin;

  const AppShimmerTable({
    super.key,
    this.columnLength = 1,
    this.height = 400,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: AppShimmer(
        child: Container(
          width: double.maxFinite,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black),
          ),
          child: Table(
            textDirection: TextDirection.ltr,
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: const TableBorder(
              horizontalInside: BorderSide(
                width: 1,
                color: Color(0xFFE5EBF1),
                style: BorderStyle.solid,
              ),
              verticalInside: BorderSide(
                width: 1,
                color: Color(0xFFE5EBF1),
                style: BorderStyle.solid,
              ),
            ),
            children: [
              TableRow(
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.black),
                  ),
                  color: Color(0xFFFFFFFF),
                ),
                children: ['']
                    .map(
                      (e) => Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            e,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppShimmerTitleBox extends StatelessWidget {
  final String title;
  final double? columnLength;

  const AppShimmerTitleBox(
    this.title, {
    this.columnLength,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 4, top: 16),
            child: Text(
              title.toUpperCase(),
              style: AppTheme.text.labelMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF006877),
                fontSize: 12,
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 1,
            color: const Color(0xFFE5EBF1),
          ),
        ],
      ),
    );
  }
}
