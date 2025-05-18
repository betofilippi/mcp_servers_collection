# MCP Servers Collection

Uma coleção de servidores MCP (Model Context Protocol) prontos para uso, com gateway unificado para gerenciar múltiplos servidores.

## 🚀 Servidores Disponíveis

### 1. NocoDB
- **Descrição**: Integração completa com NocoDB API v2
- **Repo**: [github.com/betofilippi/nocodb_mcp_server](https://github.com/betofilippi/nocodb_mcp_server)
- **Funcionalidades**: CRUD completo, views, filtros, webhooks, etc.

### 2. Filesystem (Em breve)
- **Descrição**: Operações em arquivos e diretórios
- **Funcionalidades**: Ler, escrever, criar, deletar arquivos

### 3. GitHub (Em breve)
- **Descrição**: Integração com API do GitHub
- **Funcionalidades**: Repos, issues, PRs, commits

### 4. Memory (Em breve)
- **Descrição**: Armazenamento persistente em memória
- **Funcionalidades**: Key-value store, listas, dados estruturados

## 🌐 MCP Gateway Universal

O Gateway permite gerenciar múltiplos servidores MCP através de uma API REST unificada.

### Instalação

```bash
pip install -r requirements_gateway.txt
```

### Configuração

Edite `mcp_servers.yaml`:

```yaml
servers:
  - name: nocodb
    command: python /path/to/nocodb_mcp_server.py
    description: NocoDB Database Server
    env_vars:
      NOCODB_BASE_URL: https://nocodb.example.com/api/v2
      NOCODB_API_KEY: your_token
    enabled: true
```

### Uso

1. Iniciar o gateway:
```bash
python mcp_gateway_simple.py
```

2. Chamar via API:
```bash
curl -X POST http://localhost:8002/call \
  -H "Content-Type: application/json" \
  -d '{
    "server": "nocodb",
    "tool": "list_bases",
    "args": {}
  }'
```

## 📚 Documentação

- [Gateway completo](MCP_GATEWAY_DOCS.md)
- [Exemplos de uso](examples/)
- [Desenvolvimento de novos servidores](docs/development.md)

## 🛠️ Estrutura do Projeto

```
mcp_servers_collection/
├── README.md
├── mcp_gateway_simple.py      # Gateway principal
├── mcp_servers.yaml          # Configuração dos servidores
├── requirements_gateway.txt   # Dependências
├── Dockerfile.gateway        # Para deploy
├── servers/                  # Servidores MCP individuais
│   ├── nocodb/
│   ├── filesystem/
│   ├── github/
│   └── memory/
├── examples/                 # Exemplos de uso
└── docs/                    # Documentação adicional
```

## 🤝 Contribuindo

1. Fork o repositório
2. Crie sua branch: `git checkout -b meu-servidor`
3. Adicione seu servidor em `servers/`
4. Atualize `mcp_servers.yaml`
5. Faça PR

## 📄 Licença

MIT - veja LICENSE para detalhes