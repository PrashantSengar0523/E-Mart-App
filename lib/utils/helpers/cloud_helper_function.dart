import 'package:flutter/material.dart';

class TCloudHelperFunctions {
  static Widget? checkMultiRecordsState({
    required AsyncSnapshot snapshot,
    Widget ?loader,
    Widget ?nothingFound,
    Widget ?error,
  }) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      if(loader!=null)return loader;
      return const CircularProgressIndicator();
    } else if (snapshot.hasError) {
        if(error!=null)return error;
      return const Center(child: Text('Something went wrong'));
    } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
        if(nothingFound!=null)return nothingFound;
      return const Center(child:Text('No Data Found'));
    } else {
      return null;
    }
  }
}
