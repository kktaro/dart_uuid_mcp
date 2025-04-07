import 'package:mcp_dart/mcp_dart.dart';
import 'package:uuid/uuid.dart';

final class UuidMcpServer {
  final McpServer server = McpServer(
    Implementation(name: 'example-uuid-server', version: '1.0.0'),
    options: ServerOptions(
      capabilities: ServerCapabilities(tools: ServerCapabilitiesTools()),
    ),
  );

  Future<void> setup() async {
    server.tool(
      'get-uuid-with-message',
      description: 'Get a Sample UUID with Message',
      inputSchemaProperties: {
        'messageArg': {'type': 'string'},
      },
      callback: ({args, extra}) async {
        final message = args!['messageArg'] as String;
        final uuid = Uuid().v4();
        return CallToolResult(content: [
          TextContent(text: '$message: $uuid'),
        ]);
      },
    );

    await server.connect(StdioServerTransport());
  }
}
