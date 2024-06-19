import 'package:api/screen/apiscreen/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
TextEditingController controller = TextEditingController();

class ApiScreen extends StatelessWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final providerF = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(suffixIcon: IconButton(onPressed: () {

          }, icon: Icon(Icons.search)),
            focusedBorder: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
        ),
      ),

    ), body: provider.isLoading
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : GridView.builder(
      itemCount: provider.data['hits'].length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => Card(
          child: Image.network(
              fit: BoxFit.cover,
              '${provider.data['hits'][index]['largeImageURL']}')),
    ),
    );
  }
}
