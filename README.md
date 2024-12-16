# README: Sistema de Gerenciamento de Hospedagem

## Descrição
Este projeto consiste na implementação de um banco de dados relacional para um sistema de gerenciamento de hospedagem. O objetivo é gerenciar informações sobre hóspedes, quartos, pagamentos, consumo de produtos e serviços, além de realizar operações como check-ins e check-outs. O sistema também suporta controle de acesso e funcionalidades adicionais como triggers, procedures, roles e índices para otimização de consultas.

---

## Estrutura do Banco de Dados

### **Schema**
O banco de dados utiliza um schema chamado `HOSPEDAGEM`.

### **Tabelas**
1. **Endereços**: Armazena os endereços relacionados aos hóspedes e colaboradores.
2. **Hóspedes**: Contém informações dos hóspedes.
3. **Fornecedores**: Registra os fornecedores do hotel.
4. **Quartos**: Detalha os quartos disponíveis, incluindo o tipo e o status.
5. **Produtos**: Lista produtos disponíveis para consumo pelos hóspedes.
6. **Pagamentos**: Define métodos de pagamento disponíveis.
7. **CheckIn**: Gerencia os check-ins realizados no hotel.
8. **Colaboradores**: Registra os colaboradores e suas funções.
9. **Serviços**: Lista os serviços oferecidos pelo hotel.
10. **CheckOut**: Registra os check-outs e pagamentos realizados.
11. **ConsumoProdutos**: Detalha o consumo de produtos por quarto.
12. **ConsumoServiços**: Detalha o consumo de serviços por quarto.
13. **LOGCheck**: Armazena logs de check-outs monitorados.

---

## Funcionalidades Implementadas

### **DDL (Data Definition Language)**
- Criação do schema `HOSPEDAGEM`.
- Definição de tabelas com restrições de integridade referencial (chaves primárias e estrangeiras).

### **DML (Data Manipulation Language)**
- Inserção de registros iniciais para endereços, hóspedes, fornecedores, quartos, produtos, pagamentos, colaboradores, check-ins, check-outs e consumo.

### **DQL (Data Query Language)**
1. **Procedures:**
   - `sp_insereEndereco`: Insere um novo endereço na tabela `Endereços`.
   - `sp_totalGastosQuarto`: Calcula a soma dos gastos com produtos e serviços por quarto.

2. **Triggers:**
   - `atualizaQuarto`: Atualiza automaticamente o status de um quarto para "Indisponível" após um check-in.
   - `monitoraCheckout`: Monitora check-outs e registra logs de consumo de produtos no `LOGCheck`.

3. **Roles:**
   - Criação de uma role `nivel1` com permissões específicas:
     - Visualizar todas as tabelas.
     - Inserir registros nas tabelas `Hospedes` e `Endereços`.

4. **Índices:**
   - Índice composto para otimizar a busca por `nome` e `email` na tabela `Hóspedes`.

5. **Consultas:**
   - Identificar hóspedes com pelo menos uma reserva.
   - Determinar métodos de pagamento nunca utilizados.

---

## Testes Realizados

### **Procedures e Triggers**
- **`sp_insereEndereco`**: Testada com a inserção de um novo endereço.
- **`atualizaQuarto`**: Verificado o status do quarto após um check-in.
- **`monitoraCheckout`**: Avaliado o registro de logs no `LOGCheck`.

### **Consultas**
- Seleção de métodos de pagamento não utilizados.
- Recuperação de hóspedes com reservas feitas.

### **Validação da Performance**
- Verificação do impacto dos índices na tabela `Hóspedes`.

---

## Como Utilizar

1. **Criação do Banco de Dados:**
   - Execute o script DDL para criar o schema e as tabelas.

2. **População de Dados:**
   - Utilize os comandos DML para inserir registros iniciais.

3. **Operações Avançadas:**
   - Utilize as procedures, triggers e roles conforme necessário.

4. **Consultas:**
   - Use os comandos DQL para consultar dados e validar operações.

---

## Observações
- O script foi testado em um ambiente MySQL. Certifique-se de usar uma versão compatível.
- As restrições de integridade referencial garantem a consistência dos dados em operações complexas.

