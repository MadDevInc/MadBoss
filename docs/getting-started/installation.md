# Instalação

Este guia te ajudará a configurar todo o ambiente necessário para desenvolver o MadBoss.

## Pré-requisitos

### Software Obrigatório

=== "Windows"

    1. **Godot 4.4**
        - Baixe em [godotengine.org](https://godotengine.org/download)
        - Extraia o executável em uma pasta de sua escolha
        - Adicione ao PATH (opcional)

    2. **Git**
        - Baixe em [git-scm.com](https://git-scm.com/download/win)
        - Use as configurações padrão durante a instalação

    3. **Editor de Código** (opcional)
        - [Visual Studio Code](https://code.visualstudio.com/)
        - [Vim](https://www.vim.org/)
        - Ou qualquer editor de sua preferência

=== "Linux"

    1. **Godot 4.4**
        ```bash
        # Ubuntu/Debian
        sudo apt update
        sudo apt install godot

        # Ou baixe diretamente do site oficial
        wget https://downloads.tuxfamily.org/godotengine/4.4/Godot_v4.4-stable_linux.x86_64.zip
        unzip Godot_v4.4-stable_linux.x86_64.zip
        chmod +x Godot_v4.4-stable_linux.x86_64
        ```

    2. **Git**
        ```bash
        # Ubuntu/Debian
        sudo apt install git

        # Fedora
        sudo dnf install git

        # Arch
        sudo pacman -S git
        ```

=== "macOS"

    1. **Godot 4.4**
        - Baixe em [godotengine.org](https://godotengine.org/download)
        - Ou use Homebrew:
        ```bash
        brew install godot
        ```

    2. **Git**
        ```bash
        # Com Homebrew
        brew install git

        # Ou use o Xcode Command Line Tools
        xcode-select --install
        ```

### Software Opcional

#### Para Desenvolvimento da Wiki

Se você quiser contribuir com a documentação:

```bash
# Python 3.x
python --version  # Deve ser 3.8+

# Pip
pip --version
```

#### Editores Recomendados

| Editor | Extensões Godot | Vantagens |
|--------|----------------|-----------|
| **VS Code** | `godot-tools` | Integração completa, debug |
| **Vim/Neovim** | `vim-godot` | Leve, personalizável |
| **Emacs** | `gdscript-mode` | Poderoso, personalizável |

## Configuração do Git

Configure suas informações pessoais:

```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@exemplo.com"
```

### Configurações Recomendadas

```bash
# Configurar editor padrão
git config --global core.editor "code --wait"  # VS Code
# ou
git config --global core.editor "vim"          # Vim

# Configurar comportamento de merge
git config --global merge.tool "vimdiff"

# Configurar linha de comando colorida
git config --global color.ui auto

# Configurar push padrão
git config --global push.default simple
```

## Clone do Repositório

```bash
# Clone o repositório principal
git clone https://github.com/MadDev/MadBoss.git

# Entre na pasta
cd MadBoss

# Configure upstream (se for um fork)
git remote add upstream https://github.com/MadDev/MadBoss.git
```

## Configuração do Godot

### Primeira Execução

1. Abra o Godot Engine
2. Na tela inicial, clique em **"Import"**
3. Navegue até a pasta `MadBoss/game/`
4. Selecione o arquivo `project.godot`
5. Clique em **"Import & Edit"**

### Configurações do Editor

Recomendamos as seguintes configurações:

#### Editor → Editor Settings

- **Network → Language Server → Use Language Server**: ✅ Enabled
- **Text Editor → Behavior → Auto Indent**: ✅ Enabled
- **Text Editor → Appearance → Show Line Numbers**: ✅ Enabled
- **Text Editor → Appearance → Show Minimap**: ✅ Enabled

#### Project → Project Settings

- **Input Map**: Configure conforme necessário
- **Layer Names → 2D Physics**: Configure as camadas do jogo
- **Rendering → Textures → Canvas Textures → Filter**: Off (para pixel art)

## Verificação da Instalação

### Teste do Godot

1. No Godot, pressione **F5** ou clique no botão **"Play"**
2. Se for a primeira vez, ele perguntará qual cena usar como main
3. Selecione a cena principal do jogo
4. O jogo deve abrir sem erros

### Teste do Git

```bash
# Verifique o status do repositório
git status

# Deve mostrar algo como:
# On branch main
# Your branch is up to date with 'origin/main'.
# nothing to commit, working tree clean
```

### Teste da Wiki (Opcional)

Se você instalou as dependências Python:

```bash
# Entre na pasta do projeto
cd MadBoss

# Instale as dependências
pip install -r requirements.txt

# Execute o servidor de desenvolvimento
mkdocs serve

# Acesse http://localhost:8000
```

## Solução de Problemas

### Godot não encontra o projeto

- Verifique se você está na pasta correta (`MadBoss/game/`)
- Certifique-se de que o arquivo `project.godot` existe
- Tente abrir o Godot como administrador/sudo

### Erros de Git

```bash
# Redefina as configurações se necessário
git config --list
git config --global --unset user.name
git config --global --unset user.email
```

### Problemas com a Wiki

```bash
# Limpe o cache pip
pip cache purge

# Reinstale as dependências
pip install -r requirements.txt --force-reinstall
```

## Próximos Passos

Agora que você tem tudo instalado:

1. 📖 [Primeiro Setup](first-setup.md) - Configure o projeto
2. 🤝 [Contribuindo](contributing.md) - Aprenda o workflow
3. 🏗️ [Arquitetura](../development/architecture.md) - Entenda a estrutura

!!! success "Pronto!"
    Se chegou até aqui sem erros, você está pronto para começar a desenvolver! 🎉
