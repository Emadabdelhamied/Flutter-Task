import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {},
      onChanged: (value) {},
      style: const TextStyle(color: Colors.black),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search',
        hintStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.grey.shade200,
        enabledBorder: decoration(),
        focusedBorder: decoration(),
        errorBorder: decoration(),
        errorStyle: const TextStyle(color: Colors.white),
        focusedErrorBorder: decoration(),
      ),
      cursorColor: Colors.black,
    );
  }
}

OutlineInputBorder decoration() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.grey.shade200,
      ),
    );
