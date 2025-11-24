import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hello_bus/core/theme/colors.dart';

class LinkedTextCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const LinkedTextCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  void _openTerms() {
    // TODO: Navigate to Terms of Service page
  }

  void _openPrivacy() {
    // TODO: Navigate to Privacy Policy page
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center, // Align checkbox & text center
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary, // Checkbox color when checked
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                color: AppColors.gray600,
                fontSize: 14,
              ),
              children: [
                const TextSpan(text: "I agree to the "),
                TextSpan(
                  text: "Terms of Service",
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = _openTerms,
                ),
                const TextSpan(text: " and "),
                TextSpan(
                  text: "Privacy Policy",
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = _openPrivacy,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
