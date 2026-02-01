import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba1/features/user/data/models/uv_model.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool _isLoading = false;

  Future<void> fetchUvIndex() async {
    setState(() => _isLoading = true);
    
    const url = 'https://uvindexapi.com/api/v1/forecast?latitude=-0.1807&longitude=-78.4678&timezone=Auto';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        
        // Usamos el modelo ya mapeado previamente usando postman
        final uvInfo = UvData.fromJson(jsonData);

        _showSnackBar(
          "UV: ${uvInfo.uvIndex} en ${uvInfo.timezoneName} (Hora: ${uvInfo.time})", 
          _getUvColor(uvInfo.uvIndex) // Color dinámico según el riesgo
        );
      } else {
        _showSnackBar("Error: ${response.statusCode}", Colors.orange);
      }
    } catch (e) {
      _showSnackBar("Error de conexión: $e", Colors.red);
    } finally {
      setState(() => _isLoading = false);
    }
  }
  // Función extra para ponerle color al SnackBar según el nivel de radiación
  Color _getUvColor(double uv) {
    if (uv < 3) return Colors.green;
    if (uv < 6) return Colors.yellow;
    if (uv < 8) return Colors.orange;
    if (uv < 11) return Colors.red;
    return Colors.purple;
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Datos UV Ecuador')),
      body: Center(
        child: _isLoading 
          ? const CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Presiona para obtener el índice UV en Quito'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: fetchUvIndex,
                  child: const Text('Consultar API'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Regresar al Menú'),
                ),
              ],
            ),
      ),
    );
  }
}