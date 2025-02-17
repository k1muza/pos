import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final graphQLClientProvider = Provider<GraphQLClient>((ref) {
  final httpLink = HttpLink('http://18.201.166.166/graphql/');

  return GraphQLClient(
    cache: GraphQLCache(), // Basic in-memory cache or custom
    link: httpLink, // or link if you have combined links
  );
});