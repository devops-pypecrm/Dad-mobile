import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Phone number input with a country-code (flag + dial code) picker on the
/// left, in the same row — mirrors Dad-frontend's `QuickAddLeadDialog`,
/// which the Create/Edit Lead screens on mobile previously lacked. The
/// picker's own selection sheet has a live search box built in (typing
/// filters the country list as you go), so "type to filter, tap to choose"
/// comes from the package rather than anything custom here.
///
/// Renders as one pill-shaped field (matching [AppTheme]'s input styling)
/// with the code picker and the number field visually fused — not two
/// separate boxes side by side.
class PhoneCountryCodeField extends StatelessWidget {
  const PhoneCountryCodeField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.initialCountryCode = 'IN',
    this.onCountryChanged,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final String initialCountryCode;
  final ValueChanged<CountryCode>? onCountryChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBrandColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CountryCodePicker(
            onChanged: onCountryChanged,
            initialSelection: initialCountryCode,
            favorite: const ['+91', 'IN'],
            showFlag: true,
            showDropDownButton: true,
            flagWidth: 24,
            padding: const EdgeInsets.only(left: 4),
            textStyle: Theme.of(context).textTheme.bodyLarge,
            pickerStyle: PickerStyle.bottomSheet,
            searchDecoration: InputDecoration(
              hintText: 'Search country or code',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: kBrandColor.withValues(alpha: 0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          Container(width: 1, height: 28, color: kBrandColor.withValues(alpha: 0.2)),
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.phone,
              validator: validator,
              decoration: InputDecoration(
                labelText: label,
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
