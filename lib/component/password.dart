import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

import "../theme/input.dart";

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;

  const PasswordField({super.key, this.controller});

  @override
  State<StatefulWidget> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _showPassword = false;

  void _toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: const [AutofillHints.password],
      decoration: inputDecoration.copyWith(
          label: Text(AppLocalizations.of(context)!.password),
          // hintText: AppLocalizations.of(context)!.password,
          prefixIcon: const Padding(
            padding: EdgeInsetsDirectional.only(start: 12),
            child: Icon(Icons.lock),
          ),
          suffixIcon: IconButton(
            onPressed: _toggleShowPassword,
            icon: _showPassword
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          )),
      obscureText: !_showPassword,
      controller: widget.controller,
    );
  }
}
