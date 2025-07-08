#!/bin/bash

# Script de desenvolvimento para MadBoss Wiki
# Este script facilita tarefas comuns de desenvolvimento

set -e

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função para imprimir mensagens coloridas
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Função para verificar se o comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Função de ajuda
show_help() {
    echo "MadBoss Development Script"
    echo ""
    echo "Uso: $0 [COMANDO]"
    echo ""
    echo "Comandos disponíveis:"
    echo "  setup       - Configuração inicial do ambiente"
    echo "  serve       - Executar servidor de desenvolvimento da wiki"
    echo "  build       - Construir a wiki para produção"
    echo "  lint        - Verificar problemas na documentação"
    echo "  clean       - Limpar arquivos temporários"
    echo "  update      - Atualizar dependências"
    echo "  help        - Mostrar esta ajuda"
    echo ""
}

# Configuração inicial
setup() {
    print_status "Configurando ambiente de desenvolvimento..."
    
    # Verificar Python
    if ! command_exists python3; then
        print_error "Python 3 não encontrado. Instale Python 3.8+ primeiro."
        exit 1
    fi
    
    # Verificar pip
    if ! command_exists pip3; then
        print_error "pip3 não encontrado. Instale pip primeiro."
        exit 1
    fi
    
    print_status "Instalando dependências Python..."
    pip3 install -r requirements.txt
    
    # Verificar Godot (opcional)
    if command_exists godot; then
        print_success "Godot encontrado: $(godot --version 2>/dev/null || echo 'versão não detectada')"
    else
        print_warning "Godot não encontrado no PATH. Certifique-se de instalá-lo para desenvolvimento do jogo."
    fi
    
    # Verificar Git
    if command_exists git; then
        print_success "Git encontrado: $(git --version)"
    else
        print_error "Git não encontrado. Instale Git primeiro."
        exit 1
    fi
    
    print_success "Configuração concluída!"
    print_status "Execute '$0 serve' para iniciar o servidor de desenvolvimento."
}

# Executar servidor de desenvolvimento
serve() {
    print_status "Iniciando servidor de desenvolvimento..."
    
    if [ ! -f "mkdocs.yml" ]; then
        print_error "mkdocs.yml não encontrado. Execute '$0 setup' primeiro."
        exit 1
    fi
    
    print_status "Servidor disponível em: http://localhost:8000"
    print_status "Pressione Ctrl+C para parar"
    
    mkdocs serve
}

# Construir wiki para produção
build() {
    print_status "Construindo wiki para produção..."
    
    if [ ! -f "mkdocs.yml" ]; then
        print_error "mkdocs.yml não encontrado. Execute '$0 setup' primeiro."
        exit 1
    fi
    
    mkdocs build
    
    print_success "Wiki construída em ./site/"
}

# Verificar problemas na documentação
lint() {
    print_status "Verificando problemas na documentação..."
    
    # Verificar links quebrados
    print_status "Verificando links..."
    if command_exists linkchecker; then
        linkchecker --check-extern docs/
    else
        print_warning "linkchecker não encontrado. Instale com: pip install linkchecker"
    fi
    
    # Verificar markdown
    if command_exists markdownlint; then
        print_status "Verificando sintaxe Markdown..."
        markdownlint docs/
    else
        print_warning "markdownlint não encontrado. Instale com: npm install -g markdownlint-cli"
    fi
    
    print_success "Verificação concluída!"
}

# Limpar arquivos temporários
clean() {
    print_status "Limpando arquivos temporários..."
    
    # Remover diretório de build
    if [ -d "site" ]; then
        rm -rf site/
        print_status "Removido: site/"
    fi
    
    # Remover cache Python
    find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
    find . -name "*.pyc" -delete 2>/dev/null || true
    print_status "Cache Python limpo"
    
    # Remover arquivos temporários do MkDocs
    if [ -d ".cache" ]; then
        rm -rf .cache/
        print_status "Removido: .cache/"
    fi
    
    print_success "Limpeza concluída!"
}

# Atualizar dependências
update() {
    print_status "Atualizando dependências..."
    
    if [ -f "requirements.txt" ]; then
        pip3 install --upgrade -r requirements.txt
        print_success "Dependências Python atualizadas!"
    fi
    
    print_status "Execute '$0 setup' se houver problemas."
}

# Comando principal
case "${1:-}" in
    setup)
        setup
        ;;
    serve)
        serve
        ;;
    build)
        build
        ;;
    lint)
        lint
        ;;
    clean)
        clean
        ;;
    update)
        update
        ;;
    help|--help|-h)
        show_help
        ;;
    "")
        print_error "Nenhum comando especificado."
        show_help
        exit 1
        ;;
    *)
        print_error "Comando desconhecido: $1"
        show_help
        exit 1
        ;;
esac
