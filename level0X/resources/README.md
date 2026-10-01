# 𝕃𝕖𝕧𝕖𝕝 [XX]

## 🎯 Objetivo
[Descreva brevemente o objetivo deste nível. Ex: Escalar privilégios assumindo o controle do fluxo de execução de um binário local para ler a flag do próximo usuário.]

## 🔍 Análise da Vulnerabilidade
- **Tipo:** _[Ex: Stack Buffer Overflow / Format String / Off-by-one / ROP]_
- **Arquivo Alvo:** `[Caminho ou nome do executável SUID]`
- **Mitigações Ativas:** _[Ex: Nenhuma / NX habilitado / Stack Canary / ASLR]_
- **Comportamento:** [Explique a lógica do programa, qual entrada ele recebe e onde reside a falha de segurança estrutural. Ex: O programa utiliza uma função insegura para ler a entrada do usuário sem verificar os limites, permitindo corromper o layout da memória adjacente.]

## 💻 Passos para Exploração (Exploit)

1.  **Reconhecimento e Análise Estática:**
    [Descreva a investigação inicial do binário utilizando ferramentas como `objdump`, `readelf` ou `checksec` para entender a estrutura e as proteções ativas.]
    ```bash
    # [Comando(s) de reconhecimento utilizado(s)]
    ```

2.  **Mapeamento da Memória (Análise Dinâmica):**
    [Detalhe o processo de depuração com o GDB para mapear a stack frame, encontrar o offset exato para sobrescrever o RIP/EIP ou vazar endereços de memória.]
    ```bash
    # [Comandos do GDB, breakpoints ou cálculos de offset]
    ```

3.  **Construção do Payload:**
    [Explique como o artefato de exploração foi montado. Detalhe os componentes lógicos, como padding, shellcode injetado, endereços de gadgets (ROP) ou formato de strings maliciosas.]

4.  **Execução do Ataque:**
    [Mostre o comando final que entrega o payload no binário vulnerável, acionando a falha e subvertendo o fluxo de execução.]
    ```bash
    # [Comando de execução do exploit, ex: ./executavel $(python -c 'print("payload")')]
    ```
    > [Adicione uma breve nota sobre o resultado. Ex: O programa foi desviado para o shellcode, abrindo um shell interativo com os privilégios do alvo.]

## 🚩 Solução / Flag
[Descreva a obtenção da flag após a exploração bem-sucedida.]
```bash
cat /home/flag[XX]/.pass
# [Espaço reservado para a flag obtida]
```

## 🛡️ Prevenção (Como corrigir)

1. **[Solução em Código]:** [Explique como o código-fonte C deveria ser reescrito para evitar a vulnerabilidade. Ex: Substituir o uso de `gets()` por `fgets()` e sanitizar adequadamente a entrada do usuário.]

2. **[Mitigações de Sistema/Compilador]:** [Mencione quais flags de compilação ou configurações de sistema operacional impediriam o vetor de ataque utilizado. Ex: Compilar o binário com proteções PIE e garantir que a stack não seja executável (NX).]
