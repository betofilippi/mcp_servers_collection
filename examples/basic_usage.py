"""
Exemplo básico de uso do MCP Gateway
"""

import requests
import json

# URL do gateway
GATEWAY_URL = "http://localhost:8002"

def call_mcp(server, tool, args=None):
    """Chama uma ferramenta em um servidor MCP"""
    response = requests.post(
        f"{GATEWAY_URL}/call",
        json={
            "server": server,
            "tool": tool,
            "args": args or {}
        }
    )
    return response.json()

# Exemplos de uso

# 1. NocoDB - Listar bases
print("=== NocoDB: Listando bases ===")
result = call_mcp("nocodb", "list_bases")
print(json.dumps(result, indent=2))

# 2. NocoDB - Criar registro
print("\n=== NocoDB: Criando registro ===")
result = call_mcp("nocodb", "create_record", {
    "table_id": "tbl_example",
    "record_data": {
        "name": "Teste",
        "email": "teste@example.com"
    }
})
print(json.dumps(result, indent=2))

# 3. Filesystem - Listar arquivos (quando disponível)
print("\n=== Filesystem: Listando arquivos ===")
try:
    result = call_mcp("filesystem", "list_directory", {
        "path": "/home/user/documents"
    })
    print(json.dumps(result, indent=2))
except Exception as e:
    print(f"Erro: {e}")

# 4. GitHub - Listar repositórios (quando disponível)
print("\n=== GitHub: Listando repos ===")
try:
    result = call_mcp("github", "list_repos", {
        "username": "betofilippi"
    })
    print(json.dumps(result, indent=2))
except Exception as e:
    print(f"Erro: {e}")