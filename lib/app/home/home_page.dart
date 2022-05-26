import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

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
              return Text('Jaki filament', style: GoogleFonts.courgette());
            }

            if (currentIndex == 1) {
              return Text('Dodaj drukarkę', style: GoogleFonts.courgette());
            }

            if (currentIndex == 2) {
              var text =
                  Text('Twój panel sterowania', style: GoogleFonts.courgette());
              return text;
            }
            return Center();
          },
        ),
      ),
      backgroundColor: Colors.lightGreen,
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return Center(
            child: Text('Dodaj swoją opinie o filamencie',
                style: GoogleFonts.courgette()),
          );
        }
        if (currentIndex == 1) {
          return Center(
            child: Text(
              'Dodaj swoją opinie o drukarce 3D',
              style: GoogleFonts.courgette(),
            ),
          );
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Jesteś zalogowany jako ${widget.user.email} '),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 15))),
                  child: Text(
                    'Wyloguj',
                    style: GoogleFonts.domine(),
                  )),
            ],
          ),
        );
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
                icon: Icon(Icons.add_box), label: 'Drukarki'),
            BottomNavigationBarItem(
                icon: Icon(Icons.co_present_rounded), label: 'Moje konto'),
          ]),
    );
  }
}
