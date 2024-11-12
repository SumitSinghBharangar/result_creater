import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.maxLine,
    this.iconData,
    required this.hintText,
    this.validator,
    this.removeFocusOutside,
    this.isNumber,
    this.onChanged,
    this.autofocus,
    this.bottomPadding,
    this.enabled,
    this.noKeyboard,
    this.onFocused,
    this.onTap,
    this.isReadOnly,
  });

  final TextEditingController? controller;
  final IconData? iconData;
  final int? maxLine;
  final String hintText;
  final String? Function(String? value)? validator;
  final bool? removeFocusOutside;
  final bool? isNumber;

  final void Function(String value)? onChanged;
  final bool? autofocus;
  final bool? bottomPadding;
  final bool? enabled;
  final bool? noKeyboard;
  final bool? isReadOnly;
  final VoidCallback? onFocused;
  final VoidCallback? onTap;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.addListener(() {
        setState(() {
          _focused = _focusNode.hasFocus;
        });

        if (widget.onFocused != null) {
          if (_focused) {
            widget.onFocused!();
          }
        }
        if (widget.noKeyboard ?? false) {
          _focusNode.unfocus();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: (widget.bottomPadding ?? true) ? 20 : 0),
      child: GestureDetector(
        onTap: () {
          _focusNode.requestFocus();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastEaseInToSlowEaseOut,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(_focused ? .4 : .2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              if (widget.iconData != null)
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    widget.iconData,
                    color: Colors.black,
                  ),
                ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: TextFormField(
                  enabled: widget.enabled,
                  maxLines: widget.maxLine,
                  onChanged: widget.onChanged,
                  onTap: widget.onTap,
                  autofocus: widget.autofocus ?? false,
                  keyboardType: (widget.noKeyboard ?? false)
                      ? TextInputType.none
                      : (widget.isNumber ?? false)
                          ? TextInputType.number
                          : null,
                  inputFormatters: (widget.isNumber ?? false)
                      ? [FilteringTextInputFormatter.digitsOnly]
                      : null,
                  onTapOutside: (widget.removeFocusOutside ?? false)
                      ? (_) {
                          _focusNode.unfocus();
                        }
                      : null,
                  validator: widget.validator,
                  focusNode: _focusNode,
                  controller: widget.controller,
                  readOnly: widget.isReadOnly ?? false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: widget.hintText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
