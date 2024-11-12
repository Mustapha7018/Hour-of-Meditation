import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/hom_palette.dart';
import '../themes/font_styles.dart';

class CustomSearchField extends StatefulWidget {
  final Function(String) onSearch;
  final bool showCloseIcon;

  const CustomSearchField({
    super.key,
    required this.onSearch,
    this.showCloseIcon = false,
  });

  @override
  _CustomSearchFieldState createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final TextEditingController _controller = TextEditingController();
  bool _isFocused = false;
  final List<String> _suggestions = [
    "Why can't I play audio?",
    "Why is my account locked?",
    "Why can't I see content?"
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _isFocused = _controller.text.isNotEmpty;
    });

    widget.onSearch(_controller.text);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FocusScope(
          onFocusChange: (hasFocus) {
            setState(() {
              _isFocused = hasFocus || _controller.text.isNotEmpty;
            });
          },
          child: TextField(
            controller: _controller,
            cursorColor: AppColor.greyscale900,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/icons/search.png',
                  color: _isFocused ? Colors.black : Colors.grey,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  widget.showCloseIcon 
                      ? 'assets/icons/close_icon.png'
                      : 'assets/icons/tune.png',
                ),
              ),
              hintText: 'Search',
              hintStyle: FontStyles.bodyLarge.copyWith(
                color: AppColor.greyscale400,
              ),
              filled: true,
              fillColor:
                  _isFocused ? Colors.grey.shade200 : Colors.grey.shade100,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.black, width: 1.5),
              ),
            ),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 8),
        if (_isFocused && _controller.text.isNotEmpty)
          ..._suggestions
              .where((suggestion) => suggestion
                  .toLowerCase()
                  .contains(_controller.text.toLowerCase()))
              .map((suggestion) => ListTile(
                    title: Text(suggestion),
                    onTap: () {
                      setState(() {
                        _controller.text = suggestion;
                        _isFocused = false;
                      });

                      widget.onSearch(suggestion);
                    },
                  ))
              .toList(),
      ],
    );
  }
}