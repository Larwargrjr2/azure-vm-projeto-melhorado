# 03 — Segurança e boas práticas

## Princípios

### Menor privilégio

Permitir apenas o acesso necessário para o laboratório e restringir origens quando a arquitetura permitir.

### Minimizar exposição

Evitar Public IP quando ele não for necessário. Quando houver acesso público, revisar cuidadosamente as portas abertas.

### Administração

Windows normalmente utiliza RDP (3389/TCP) e Linux utiliza SSH (22/TCP). Essas portas não devem ser liberadas indiscriminadamente em ambientes reais.

### Credenciais

Não armazenar senhas, chaves privadas, tokens ou segredos no repositório.

### Custos

Excluir recursos do laboratório quando não houver necessidade de mantê-los.

## Checklist

- [ ] NSG revisado.
- [ ] Portas desnecessárias removidas.
- [ ] Origem das regras restringida quando possível.
- [ ] Credenciais protegidas.
- [ ] Recursos temporários removidos ao final.
