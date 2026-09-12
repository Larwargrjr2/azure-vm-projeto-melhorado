# ☁️ Microsoft Azure — Criando Máquinas Virtuais

![Azure](https://img.shields.io/badge/Microsoft-Azure-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)
![DIO](https://img.shields.io/badge/DIO-AZ--900-6C2A8A?style=for-the-badge)
![GitHub](https://img.shields.io/badge/GitHub-Portfolio-181717?style=for-the-badge&logo=github)

Projeto desenvolvido para o laboratório **Criando máquinas Virtuais na Azure**, da formação **Microsoft Azure — AZ-900 Certification**, com foco em compreender o provisionamento, os componentes, a conectividade, a segurança e o ciclo de vida de uma máquina virtual.

> **Importante:** este repositório é uma documentação técnica de laboratório. As imagens da pasta `images/` devem ser preenchidas com capturas reais do Portal do Azure caso o laboratório seja executado em uma assinatura Azure. Nenhuma implantação real é afirmada neste repositório sem evidência.

## 🎯 Objetivos

- Entender o papel das Azure Virtual Machines.
- Identificar os recursos criados junto com uma VM.
- Praticar a configuração de sistema operacional, tamanho, discos e rede.
- Compreender regras de entrada e o uso de Network Security Groups (NSG).
- Documentar um procedimento técnico reproduzível.
- Registrar boas práticas de segurança e controle de custos.
- Utilizar o GitHub como portfólio técnico.

## 🧠 Conceitos principais

| Conceito | Papel no laboratório |
|---|---|
| Resource Group | Agrupa recursos relacionados ao laboratório. |
| Virtual Machine | Recurso de computação que executa o sistema operacional. |
| Image | Define a imagem/base do sistema operacional. |
| VM Size | Define capacidade computacional como CPU e memória. |
| Managed Disk | Armazena o sistema operacional e, quando necessário, dados. |
| Virtual Network | Fornece conectividade de rede privada para os recursos. |
| Subnet | Segmenta logicamente a Virtual Network. |
| Public IP | Permite exposição pública quando realmente necessária. |
| Network Security Group | Controla regras de tráfego de entrada e saída associadas à rede. |

## 🏗️ Cenário do laboratório

A proposta é criar uma VM simples para estudo, evitando recursos desnecessários e mantendo a superfície de exposição reduzida.

```text
                 ┌──────────────────────┐
                 │   Usuário / Cliente   │
                 └──────────┬───────────┘
                            │
                       Internet
                            │
                 ┌──────────▼───────────┐
                 │     Public IP        │
                 └──────────┬───────────┘
                            │
                 ┌──────────▼───────────┐
                 │          NSG         │
                 │ regras de acesso    │
                 └──────────┬───────────┘
                            │
                 ┌──────────▼───────────┐
                 │    Virtual Network   │
                 │       + Subnet       │
                 └──────────┬───────────┘
                            │
                 ┌──────────▼───────────┐
                 │    Azure VM          │
                 │  Windows ou Linux    │
                 └──────────┬───────────┘
                            │
                     Managed Disk
```

Um diagrama em SVG também está disponível em `images/arquitetura.svg`.

## 🧪 Procedimento pelo Portal do Azure

### 1. Preparar o laboratório

1. Entrar no [Portal do Azure](https://portal.azure.com/).
2. Confirmar a assinatura que será utilizada.
3. Escolher uma região compatível com a atividade.
4. Definir um Resource Group para manter os recursos organizados.

### 2. Criar o Resource Group

Exemplo de nome:

```text
rg-az900-vm-lab
```

No Portal: **Resource groups → Create**.

Registrar no projeto a assinatura, a região e o nome do Resource Group escolhidos.

### 3. Criar a Virtual Machine

No Portal: **Virtual machines → Create → Azure virtual machine**.

Preencher, conforme a disponibilidade da assinatura:

```text
Resource group: rg-az900-vm-lab
VM name:        vm-az900-lab
Region:         [região escolhida]
Image:          [Windows Server ou Ubuntu]
Size:           [tamanho de laboratório disponível]
Authentication: [SSH para Linux / usuário e senha ou chave conforme a imagem]
```

> O tamanho disponível e o custo variam conforme região, assinatura e momento da criação. Para um laboratório, selecione uma opção pequena e adequada ao objetivo.

### 4. Configurar discos

Validar o disco de sistema operacional e a necessidade de discos adicionais.

Critérios para registro:

- Tipo do disco;
- Capacidade;
- Necessidade de persistência;
- Desempenho esperado;
- Custo.

### 5. Configurar rede

Verificar a Virtual Network, Subnet, Public IP e Network Security Group.

Regras comuns:

| Serviço | Porta | Observação |
|---|---:|---|
| SSH | 22/TCP | Administração de Linux. |
| RDP | 3389/TCP | Administração de Windows. |
| HTTP | 80/TCP | Tráfego web sem criptografia. |
| HTTPS | 443/TCP | Tráfego web criptografado. |

**Boa prática:** liberar somente as portas necessárias. Quando possível, restringir a origem por IP em vez de expor a porta para toda a Internet.

### 6. Revisar e criar

Antes de selecionar **Create**, validar:

- Assinatura;
- Resource Group;
- Região;
- Nome da VM;
- Imagem;
- Tamanho;
- Autenticação;
- Discos;
- Virtual Network e Subnet;
- Public IP;
- NSG e portas de entrada.

### 7. Validar a implantação

Após a criação, registrar evidências do recurso:

- Overview da VM;
- Resource Group;
- Networking;
- Disks;
- Status da máquina;
- Método de conexão;
- Regras do NSG.

## 🔐 Segurança

A segurança da VM deve ser tratada desde a criação. Para este laboratório, observar especialmente:

- Evitar portas abertas sem necessidade.
- Evitar acesso administrativo exposto para qualquer origem quando uma regra restrita for possível.
- Usar autenticação adequada à imagem escolhida.
- Manter sistema operacional e softwares atualizados.
- Não colocar senhas, chaves privadas ou tokens no GitHub.
- Excluir recursos que não sejam mais necessários para evitar custos.

Mais detalhes em `docs/03-seguranca-e-boas-praticas.md`.

## 💰 Controle de custos

Uma VM pode gerar custos enquanto os recursos associados permanecerem provisionados. Em um laboratório, é importante revisar os recursos criados e eliminá-los ao concluir os testes, quando não houver necessidade de preservá-los.

Checklist de encerramento:

```text
[ ] Desligar a VM quando não estiver em uso
[ ] Conferir discos associados
[ ] Conferir Public IP
[ ] Conferir NIC
[ ] Conferir NSG
[ ] Conferir outros recursos no Resource Group
[ ] Excluir o Resource Group quando o laboratório terminar
```

## 🛠️ Automação opcional com Azure CLI

A pasta `scripts/` contém exemplos didáticos para criação e limpeza de um laboratório por linha de comando. Eles **não substituem a execução pelo Portal** exigida pela atividade; servem para demonstrar como o mesmo conceito pode ser automatizado.

Arquivos:

- `scripts/01-criar-rg.cmd`
- `scripts/02-criar-vm.cmd`
- `scripts/03-consultar-vm.cmd`
- `scripts/04-excluir-lab.cmd`

Antes de executar, leia os comentários e substitua os valores indicados. É necessário ter o Azure CLI instalado e estar autenticado com `az login`.

## 📸 Evidências

Coloque suas capturas reais na pasta `images/` usando nomes como:

```text
01-resource-group.png
02-configuracao-vm.png
03-rede-e-nsg.png
04-discos.png
05-revisao.png
06-vm-criada.png
07-visao-geral.png
```

Depois, acrescente as imagens ao README, por exemplo:

```markdown
![VM criada no Portal do Azure](images/06-vm-criada.png)
```

## 📋 Checklist técnico

- [ ] Resource Group criado.
- [ ] VM configurada.
- [ ] Imagem escolhida.
- [ ] Tamanho definido.
- [ ] Disco revisado.
- [ ] Virtual Network e Subnet revisadas.
- [ ] NSG revisado.
- [ ] Portas de entrada avaliadas.
- [ ] Método de acesso testado.
- [ ] Evidências capturadas.
- [ ] Recursos removidos ao terminar, quando aplicável.

## 📁 Estrutura do projeto

```text
azure-criando-maquinas-virtuais/
├── README.md
├── ENTREGA-DIO.txt
├── .gitignore
├── docs/
│   ├── 01-processo-pratico.md
│   ├── 02-componentes.md
│   ├── 03-seguranca-e-boas-praticas.md
│   ├── 04-checklist-e-evidencias.md
│   └── 05-reflexao-final.md
├── scripts/
│   ├── 01-criar-rg.cmd
│   ├── 02-criar-vm.cmd
│   ├── 03-consultar-vm.cmd
│   └── 04-excluir-lab.cmd
└── images/
    └── arquitetura.svg
```

## 📚 Referências

- [Microsoft Learn — Criar uma máquina virtual do Windows no Portal do Azure](https://learn.microsoft.com/pt-br/azure/virtual-machines/windows/quick-create-portal)
- [Microsoft Azure — Virtual Machines](https://azure.microsoft.com/pt-br/products/virtual-machines/)
- [Microsoft Learn — Azure Virtual Machines](https://learn.microsoft.com/pt-br/azure/virtual-machines/)
- [Documentação do GitHub](https://docs.github.com/pt-br/)
- Laboratório **Criando máquinas Virtuais na Azure — DIO**

## 🎓 Conclusão

O laboratório demonstra que uma máquina virtual no Azure não é apenas um servidor: ela depende de recursos de rede, armazenamento, identidade/autenticação e regras de segurança que precisam ser planejados em conjunto.

A prática também reforça a importância de documentar configurações, registrar evidências e controlar o ciclo de vida dos recursos. Esse processo cria uma base para estudos posteriores de administração de ambientes Azure, redes, segurança, automação e arquitetura de aplicações em nuvem.

---

**Autor:** Larwargrjr  
**Formação:** Microsoft Azure — AZ-900 Certification  
**Plataforma:** DIO
