
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/api_provider.dart';
import 'HomeScreen.dart';

class ApiData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API List'),
      ),
      body: Center(
        child: Consumer<ApiProvider>(
          builder: (context, apiProvider, child) {
            if (apiProvider.isLoading) {
              return const  CircularProgressIndicator();
            }

            final apis = apiProvider.apis;
            return ListView.builder(
              itemCount: apis.length,
              itemBuilder: (context, index) {
                final api = apis[index];
                return ListTile(
                  title: Text(api.api),
                  subtitle: Text(api.description),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ApiProvider>(context, listen: false).fetchApis();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
