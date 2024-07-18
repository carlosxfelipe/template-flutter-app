import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HorizontalCardList extends StatefulWidget {
  const HorizontalCardList({super.key});

  @override
  HorizontalCardListState createState() => HorizontalCardListState();
}

class HorizontalCardListState extends State<HorizontalCardList> {
  final Dio _dio = Dio();
  final List<Map<String, dynamic>> _pokemonList = [];
  bool _isLoading = false;
  int _offset = 0;
  final int _limit = 10;

  @override
  void initState() {
    super.initState();
    _fetchPokemon();
  }

  Future<void> _fetchPokemon() async {
    setState(() {
      _isLoading = true;
    });

    final response = await _dio.get('https://pokeapi.co/api/v2/pokemon',
        queryParameters: {'offset': _offset, 'limit': _limit});

    List<Map<String, dynamic>> newPokemonList = [];

    for (var result in response.data['results']) {
      final pokemonResponse = await _dio.get(result['url']);
      newPokemonList.add({
        'name': pokemonResponse.data['name'],
        'image': pokemonResponse.data['sprites']['front_default'],
        'types': pokemonResponse.data['types']
            .map((typeInfo) => typeInfo['type']['name'])
            .toList(),
      });
    }

    setState(() {
      _pokemonList.addAll(newPokemonList);
      _offset += _limit;
      _isLoading = false;
    });
  }

  Color _getColorByType(String type) {
    switch (type) {
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.yellow;
      case 'psychic':
        return Colors.purple;
      case 'ice':
        return Colors.lightBlueAccent;
      case 'dragon':
        return Colors.indigo;
      case 'dark':
        return Colors.brown;
      case 'fairy':
        return Colors.pink;
      case 'normal':
        return Colors.grey;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!_isLoading && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            _fetchPokemon();
            return true;
          }
          return false;
        },
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _pokemonList.length + (_isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _pokemonList.length) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final pokemon = _pokemonList[index];
            final primaryType = pokemon['types'][0];

            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: _getColorByType(primaryType),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(pokemon['image']),
                    const SizedBox(height: 8),
                    Text(
                      pokemon['name'].toString().toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
