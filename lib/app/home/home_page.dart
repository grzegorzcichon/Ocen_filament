import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Ocen_filament/app/home/add_opinion/add_opinion_page_content.dart';
import 'package:Ocen_filament/app/home/filaments/filaments_page_conten.dart';
import 'package:Ocen_filament/app/home/my_account/my_account_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Builder(
          builder: (context) {
            if (currentIndex == 0) {
              return Text('Oceny filamentu', style: GoogleFonts.courgette());
            }

            if (currentIndex == 1) {
              return Text('Dodaj opinie i filamencie',
                  style: GoogleFonts.courgette());
            }

            if (currentIndex == 2) {
              var text =
                  Text('Twój panel sterowania', style: GoogleFonts.courgette());
              return text;
            }
            return const Center();
          },
        ),
      ),
      backgroundColor: Colors.lightGreen,
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const Center(
            child: FilamentsPageContent(),
          );
        }
        if (currentIndex == 1) {
          return const Center(
            child: AddFilamentPageContent(),
          );
        }

        return MyAccountPageContent(email: widget.user.email);
      }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.blur_circular_rounded),
              label: 'Filamenty',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box), label: 'Dodaj ocenę'),
            BottomNavigationBarItem(
                icon: Icon(Icons.co_present_rounded), label: 'Moje konto'),
          ],
          backgroundColor: Colors.blue[100]),
    );
  }
}
