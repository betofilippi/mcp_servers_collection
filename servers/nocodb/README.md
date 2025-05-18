# NocoDB MCP Server

Servidor MCP para integração com NocoDB API v2.

## Instalação

O servidor NocoDB está disponível em um repositório separado:

🔗 **[github.com/betofilippi/nocodb_mcp_server](https://github.com/betofilippi/nocodb_mcp_server)**

## Configuração no Gateway

Para usar este servidor com o MCP Gateway, adicione ao `mcp_servers.yaml`:

```yaml
servers:
  - name: nocodb
    command: python /path/to/nocodb_mcp_server.py
    description: NocoDB Database Server
    env_vars:
      NOCODB_BASE_URL: https://nocodb.example.com/api/v2
      NOCODB_API_KEY: your_token_here
    enabled: true
```

## Funcionalidades

- ✅ Gerenciamento completo de bases, tabelas e registros
- ✅ Views, filtros e ordenação
- ✅ Operações em lote
- ✅ Webhooks e compartilhamento
- ✅ Busca global
- ✅ Sistema de comentários
- ✅ Upload de arquivos

## Exemplos

```python
# Listar bases
result = call_mcp("nocodb", "list_bases")

# Criar registro
result = call_mcp("nocodb", "create_record", {
    "table_id": "tbl_123",
    "record_data": {
        "name": "João",
        "email": "joao@email.com"
    }
})

# Buscar registros
result = call_mcp("nocodb", "list_records", {
    "table_id": "tbl_123",
    "where": "(Status,eq,Ativo)",
    "limit": 10
})
```