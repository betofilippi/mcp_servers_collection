# MCP Visual Manager 🎨

Uma ferramenta visual para gerenciar seus servidores MCP de forma intuitiva.

## 🚀 Como Usar

### 1. Iniciar o Gateway

Primeiro, inicie o gateway MCP em um terminal:

```bash
python mcp_gateway_simple.py
```

### 2. Abrir a Interface Visual

Abra o arquivo `visual_manager.html` no seu navegador:

- **Chrome/Edge**: Arraste o arquivo para o navegador
- **Firefox**: File → Open File
- **Safari**: File → Open File

Ou via terminal:
```bash
# macOS
open visual_manager.html

# Linux
xdg-open visual_manager.html

# Windows
start visual_manager.html
```

## 📋 Funcionalidades

### Dashboard Principal
- **Lista de Servidores**: Veja todos os servidores configurados
- **Status em Tempo Real**: Indicadores visuais do estado de cada servidor
- **Gerenciamento Fácil**: Iniciar, parar e configurar servidores

### Abas de Funcionalidade

#### 1. Overview
- Status do servidor
- Informações básicas
- Lista de ferramentas disponíveis

#### 2. Configuration
- Editar comando de execução
- Configurar variáveis de ambiente
- Alterar descrição

#### 3. Test Console
- Testar ferramentas do servidor
- Executar comandos
- Ver resultados em tempo real

#### 4. Logs
- Visualizar logs do servidor
- Monitorar erros
- Debug de problemas

## 🎨 Interface

### Elementos Visuais

- 🟢 **Verde**: Servidor rodando
- 🔴 **Vermelho**: Servidor parado
- 🟡 **Amarelo**: Servidor iniciando
- 🔵 **Azul**: Item selecionado

### Atalhos

- `ESC`: Fechar modais
- `Enter`: Confirmar ações
- Click na lista: Selecionar servidor

## 🛠️ Adicionar Novo Servidor

1. Clique em "➕ Add Server"
2. Preencha:
   - **Name**: Nome único do servidor
   - **Command**: Comando para executar
   - **Description**: Descrição do servidor
   - **Environment Variables**: Variáveis de ambiente
3. Clique em "Save"

## 📝 Exemplo de Configuração

### NocoDB Server
```
Name: nocodb
Command: python /path/to/nocodb_mcp_server.py
Description: NocoDB Database Integration
Environment Variables:
NOCODB_BASE_URL=https://your-nocodb.com/api/v2
NOCODB_API_KEY=your_api_key_here
```

### Filesystem Server
```
Name: filesystem
Command: mcp-server-filesystem
Description: File System Operations
Environment Variables:
ALLOWED_PATHS=/home/user/documents
```

## 🔧 Requisitos

- Gateway MCP rodando (porta 8002)
- Navegador moderno (Chrome, Firefox, Safari, Edge)
- Servidores MCP instalados

## 🐛 Troubleshooting

### Server não inicia
1. Verifique se o comando está correto
2. Confirme que o arquivo existe
3. Verifique as variáveis de ambiente

### Erro de conexão
1. Certifique-se que o gateway está rodando
2. Verifique se está na porta 8002
3. Teste com `curl http://localhost:8002/health`

### Interface não atualiza
1. Recarregue a página (F5)
2. Verifique o console do navegador (F12)
3. Reinicie o gateway

## 🚨 Segurança

- Não exponha o gateway para a internet
- Use tokens seguros nas variáveis de ambiente
- Rode apenas servidores confiáveis

## 🎯 Próximas Funcionalidades

- [ ] Dark mode
- [ ] Exportar/Importar configurações
- [ ] Métricas de performance
- [ ] Histórico de execuções
- [ ] Auto-discovery de servidores
- [ ] Integração com Docker

## 💡 Dicas

1. **Organização**: Use nomes descritivos para os servidores
2. **Backup**: Salve suas configurações regularmente
3. **Logs**: Monitore os logs para debug
4. **Testes**: Use o console de teste antes de produção

---

Feito com ❤️ para a comunidade MCP