import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddFilamentPageContent extends StatelessWidget {
  const AddFilamentPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Dodaj swoją opinie o drukarce 3D',
      style: GoogleFonts.courgette(),
    );
  }
}
