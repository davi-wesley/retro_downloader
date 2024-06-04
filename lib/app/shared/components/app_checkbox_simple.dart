import 'package:flutter/material.dart';

class AppCheckboxSimple extends StatefulWidget {
  final bool? value;
  final void Function(bool) onChanged;
  final bool disable;

  const AppCheckboxSimple({
    required this.value,
    required this.onChanged,
    this.disable = false,
    super.key,
  });

  @override
  State<AppCheckboxSimple> createState() => _AppCheckboxSimpleState();
}

class _AppCheckboxSimpleState extends State<AppCheckboxSimple> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.disable ? () {} : () => widget.onChanged.call(!(widget.value ?? false)),
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          border: Border.all(
            color: (widget.value ?? false)
                ? widget.disable
                    ? const Color(0xFFBEC9D7)
                    : const Color(0xFF00AEC7)
                : const Color(0xFF848A90),
          ),
          color: (widget.value ?? false)
              ? widget.disable
                  ? const Color(0xFFBEC9D7)
                  : const Color(0xFF00AEC7)
              : const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(2),
        ),
        child: const Center(
          child: Icon(
            Icons.check,
            size: 13,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
