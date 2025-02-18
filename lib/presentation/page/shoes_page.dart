
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/controller/cubit/shoes_cubit.dart';
import 'package:shoes_store/injection_container.dart';
import 'package:shoes_store/presentation/widgets/shoes_item.dart';

/// Page that displays the list of shoes

class ShoesPage extends StatelessWidget {
  const ShoesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShoesCubit>(
      create: (_) => sl<ShoesCubit>()..getShoes(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Shoes Store"),
        ),
        body: BlocBuilder<ShoesCubit, ShoesState>(
          builder: (context, state) {
            if (state is ShoesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ShoesLoaded) {
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  // Adjust the childAspectRatio as needed for your design
                  childAspectRatio: 0.75,
                ),
                itemCount: state.shoes.length,
                itemBuilder: (context, index) {
                  final shoe = state.shoes[index];
                  return ShoeItem(shoe: shoe);
                },
              );
            } else if (state is ShoesError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}