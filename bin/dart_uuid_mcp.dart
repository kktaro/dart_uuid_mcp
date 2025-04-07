import 'package:dart_uuid_mcp/dart_uuid_mcp.dart';

Future<void> main(List<String> arguments) async {
  final server = UuidMcpServer();
  await server.setup();
}
