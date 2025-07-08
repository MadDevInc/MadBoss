# Configuração do GitHub Pages para MadBoss

Este documento descreve como configurar o GitHub Pages para hospedar automaticamente a wiki do MadBoss.

## Pré-requisitos

- Repositório público no GitHub
- Acesso de administrador ao repositório
- Workflow file já criado (`.github/workflows/deploy-wiki.yml`)

## Passos para Configuração

### 1. Habilitar GitHub Actions

1. Vá para o seu repositório no GitHub
2. Clique na aba **"Actions"**
3. Se for a primeira vez, clique em **"I understand my workflows, go ahead and enable them"**

### 2. Configurar Pages

1. No repositório, clique em **"Settings"**
2. Na barra lateral, clique em **"Pages"**
3. Em **"Source"**, selecione **"GitHub Actions"**
4. Salve as configurações

### 3. Configurar Permissões

1. Ainda em **"Settings"**, clique em **"Actions"** na barra lateral
2. Clique em **"General"**
3. Em **"Workflow permissions"**, selecione:
   - ✅ **"Read and write permissions"**
   - ✅ **"Allow GitHub Actions to create and approve pull requests"**
4. Clique em **"Save"**

### 4. Primeira Deploy

1. Faça um commit com as modificações na branch `main`
2. O workflow será executado automaticamente
3. Aguarde a conclusão (geralmente 2-5 minutos)
4. A wiki estará disponível em: `https://[seu-usuario].github.io/MadBoss/`

## Verificação

### Status do Workflow

1. Vá para **"Actions"** no repositório
2. Verifique se o workflow **"Build and Deploy Wiki"** aparece
3. Se houver erro, clique no workflow para ver os detalhes

### Site Funcionando

1. Acesse a URL: `https://[seu-usuario].github.io/MadBoss/`
2. Verifique se a página inicial carrega corretamente
3. Teste alguns links da navegação

## Troubleshooting

### Workflow com Erro

Se o workflow falhar:

1. Verifique os logs em **"Actions"**
2. Problemas comuns:
   - Permissões insuficientes
   - Erro no `mkdocs.yml`
   - Dependências faltando

### Página 404

Se o site mostrar erro 404:

1. Verifique se GitHub Pages está habilitado
2. Confirme que o source está como "GitHub Actions"
3. Aguarde alguns minutos para propagação

### Deploy Lento

O primeiro deploy pode demorar até 10 minutos. Deployments subsequentes são mais rápidos.

## Atualizações Automáticas

A partir da configuração inicial:

1. **Push para `main`** → Deploy automático
2. **Pull Request** → Preview (sem deploy)
3. **Merge de PR** → Deploy automático

## Domínio Customizado (Opcional)

Para usar um domínio próprio:

1. Em **"Settings" > "Pages"**
2. Em **"Custom domain"**, adicione seu domínio
3. Configure DNS do seu domínio apontando para GitHub Pages
4. Habilite **"Enforce HTTPS"**

## Estrutura de URLs

Após o deploy, as páginas estarão disponíveis em:

- **Home**: `https://[usuario].github.io/MadBoss/`
- **Tutoriais**: `https://[usuario].github.io/MadBoss/tutorials/`
- **API**: `https://[usuario].github.io/MadBoss/api/`
- etc.

## Monitoramento

### Analytics (Opcional)

Para adicionar Google Analytics:

1. Obtenha um ID do Google Analytics
2. No `mkdocs.yml`, substitua `G-YOUR-ANALYTICS-ID` pelo seu ID real
3. Faça commit das mudanças

### Status Page

Monitore o status em:
- **GitHub Status**: [githubstatus.com](https://www.githubstatus.com/)
- **Actions**: Aba Actions do seu repositório

## Backup

O GitHub mantém backup automático, mas recomendamos:

1. **Clone local** do repositório sempre atualizado
2. **Backup da configuração** (`mkdocs.yml`, workflows)

!!! success "Pronto!"
    Após seguir estes passos, sua wiki estará online e se atualizará automaticamente a cada commit na branch main.

!!! tip "Dica"
    Bookmark a URL da sua wiki para acesso rápido durante o desenvolvimento.
