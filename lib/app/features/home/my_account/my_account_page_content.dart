import 'package:Ocen_filament/app/cubit/root_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Jesteś zalogowany jako $email '),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                context.read<RootCubit>().singOut();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 15))),
              child: Text(
                'Wyloguj',
                style: GoogleFonts.domine(),
              )),
        ],
      ),
    );
  }
}
