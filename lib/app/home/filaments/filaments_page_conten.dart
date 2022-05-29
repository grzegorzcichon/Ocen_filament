import 'package:Ocen_filament/app/home/filaments/cubit/filaments_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FilamentsPageContent extends StatelessWidget {
  const FilamentsPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilamentsCubit()..start(),
      child: BlocBuilder<FilamentsCubit, FilamentsState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(child: Text('Wystąpił błąd: ${state.errorMessage}'));
          }
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final documents = state.documents;

          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(document['name'],
                              style: GoogleFonts.courgette()),
                          Text(document['material'], style: GoogleFonts.rye()),
                        ],
                      ),
                      Text(document['rating'].toString()),
                    ],
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
