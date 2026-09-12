# 02 — Componentes da solução

| Componente | Responsabilidade |
|---|---|
| Resource Group | Agrupar recursos do laboratório. |
| VM | Computação e execução do sistema operacional. |
| Image | Base do sistema operacional. |
| Size | Capacidade de CPU/memória da VM. |
| Managed Disk | Armazenamento persistente. |
| NIC | Interface de rede da VM. |
| Virtual Network | Rede virtual do ambiente. |
| Subnet | Segmentação da rede. |
| Public IP | Endereço público quando necessário. |
| NSG | Controle de tráfego por regras. |

## Relação entre os componentes

A VM utiliza uma interface de rede (NIC), a NIC é conectada a uma Subnet dentro de uma Virtual Network e pode utilizar um Public IP. O tráfego é controlado por regras de Network Security Group. O sistema operacional é armazenado em Managed Disk.
