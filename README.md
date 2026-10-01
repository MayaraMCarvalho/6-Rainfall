# 🌧️️ RainFall
(42 São Paulo)

Available in: [🇺🇸 English](README.en.md)

![42 São Paulo](https://img.shields.io/badge/42-São_Paulo-black)
![Security](https://img.shields.io/badge/Focus-Cybersecurity-red)
![Language](https://img.shields.io/badge/Language-C_/_ASM_x86--64-blue)
![Status](https://img.shields.io/badge/Status-In_Progress-yellow)

Este projeto é uma introdução profunda à exploração de binários ELF (Executable and Linkable Format) em arquitetura x86-64. No formato **CTF (Capture The Flag)** local, o objetivo é explorar vulnerabilidades clássicas de corrupção de memória para escalar privilégios, enfrentando proteções de sistemas modernos.

## 📜 Índice

- [Visão Geral](#-visão-geral)
- [Estrutura do Desafio](#-estrutura-do-desafio)
- [Ferramentas Utilizadas](#-ferramentas-utilizadas)
- [Estrutura do Repositório](#-estrutura-do-repositório)
- [Modo de Uso](#-modo-de-uso)
- [Disclaimer](#-disclaimer)
- [Autora](#-autora)

---

## 📖 Visão Geral

**RainFall** joga você em uma Máquina Virtual Ubuntu vulnerável. Cada nível é um pequeno programa SUID escrito em C que lida mal com suas entradas. O objetivo é quebrar a execução desses binários, assumir o controle do fluxo (Execution Control) e ler a senha (`.pass`) do próximo nível.

À medida que você avança, mitigações reais de segurança (NX, Stack Canaries, ASLR, RELRO, PIE) são ativadas, exigindo técnicas de exploração cada vez mais sofisticadas.

### 🎯 Objetivos de Aprendizado

O projeto visa desenvolver o "mindset" de engenharia reversa e segurança de baixo nível:

1. **Read**: Desmontar pacientemente o binário e entender o layout da memória byte a byte.
2. **Exploit**: Dobrar o binário para executar código arbitrário (shellcode) ou reaproveitar código existente (ROP).
3. **Bypass**: Derrotar defesas modernas do compilador e do sistema operacional.

As principais competências trabalhadas incluem:

-  🕵️ **Engenharia Reversa:** Leitura fluente de Assembly x86-64 e uso de descompiladores.
-  🛡️ **Corrupção de Memória:** Stack Buffer Overflows, Off-by-one errors, Format String Attacks, Integer Overflows.
-  🧩 **Técnicas Avançadas:** Return-Oriented Programming (ROP), ret2libc, Stack Pivoting.
-  🧱 **Mitigações de SO:** Compreensão prática de ASLR, NX (DEP), Canaries, PIE e RELRO.

---

## 🏗️ Estrutura do Desafio

O projeto escala em complexidade a cada nível.

🟢 **Parte Obrigatória**
- **Level 00 a 09**: Fundamentos de Buffer Overflow, injeção de shellcode e formatação de strings em cenários progressivos.
- **Level 10 (Boss Fight)**: O teste final obrigatório. Todas as mitigações (NX, Canary, ASLR) ativadas simultaneamente. Exige encadeamento múltiplo de exploits (leaks de memória + ROP chain).

🔴 **Parte Bônus**
- **Bonus 01 a 05**: Desafios significativamente mais difíceis, introduzindo novos paradigmas como exploração de Heap (Use-After-Free, Heap Corruption) e bypass dinâmico.

🚩 **A Flag**

O objetivo de cada nível é explorar o binário para agir como o usuário do nível seguinte (`flagXX`). Ao conseguir uma shell ou executar comandos com esses privilégios, você deve ler o arquivo de senha:

  ```bash
  cat /home/flagXX/.pass
  ```
> Isso retornará o token para logar via SSH no próximo nível.

---

## 🛠️ Ferramentas Utilizadas

Durante a resolução dos desafios, você precisará dominar o ferramental interno da VM:

- **GDB (GNU Debugger):** O coração da análise dinâmica (leitura de registradores, stack frames e fluxo).
- **Objdump / Readelf:** Para análise estática profunda e extração de endereços base.
- **Ltrace / Strace:** Para interceptar chamadas de biblioteca e de sistema.
- **Checksec:** Para verificar quais proteções (NX, Canary, etc) estão ativas no binário.
- **ROPgadget:** Para localizar instruções de retorno úteis (gadgets) na construção de ROP Chains.

---

## 📂 Estrutura do Repositório

Seguindo as normas da 42, não versionamos binários. O repositório contém as flags e os scripts/recursos utilizados para a exploração.

```text
.
├── level00/
│   ├── flag            # A senha para o próximo nível
│   └── resources/      # Scripts Python, payloads e anotações do exploit
├── level01/
├── level02/
├── ...
└── README.md
```
---

## 🚩 Níveis e Vulnerabilidades (Mandatório)

| Nível |	Tipo de Vulnerabilidade / Conceito Chave |	Status |
| :---: | :--- | :---: |
| **00** | _A definir / (Reconhecimento)_ | ⏳ |
| **01** | _A definir / (Buffer Overflow)_ | ⏳ |
| **02** | _A definir / (Shellcode / Retorno para Stack)_ | ⏳ |
| **03** | _A definir / (Format String)_ | ⏳ |
| **04** | _A definir_ | ⏳ |
| **05** | _A definir_ | ⏳ |
| **06** | _A definir_ | ⏳ |
| **07** | _A definir_ | ⏳ |
| **08** | _A definir_ | ⏳ |
| **09** | _A definir_ | ⏳ |
| **10** | _A definir_ | ⏳ |

(Nota: Tabela a ser preenchida conforme o progresso no projeto).

---

## 🚀 Modo de Uso

Este projeto requer a ISO do RainFall fornecida pela 42.

### 1. **Conexão Inicial**
1.	Inicie a VM no VirtualBox.
2.	Identifique o IP da máquina na tela inicial.
3.	Conecte-se via SSH na porta 4242:
   
  ```bash
  ssh level00@<IP_DA_VM> -p 4242
  ```

> A senha inicial para o level00 é level00.

2. **Fluxo de Resolução**
1.	Analise o binário fornecido e seu código-fonte (se disponível).
2.	Use o GDB para mapear a stack e encontrar o vetor de ataque.
3.	Escreva um script (ou payload direto) que explore a falha para agir como flagXX.
4.	Leia o arquivo /home/flagXX/.pass.
5.	Saia e conecte-se no próximo nível via SSH com a nova senha.

---

## ⚠️ Disclaimer
Todo o conteúdo deste repositório foi desenvolvido para fins estritamente educacionais como parte do currículo da escola 42. As técnicas demonstradas aqui (exploração de binários, bypass de mitigações de memória) são realizadas em um ambiente deliberadamente vulnerável e isolado. O uso dessas técnicas em sistemas reais sem autorização explícita é ilegal e antiético.

---

## 👩🏻 Autora
**Mayara Carvalho**
<br>
[:octocat: @MayaraMCarvalho](https://github.com/MayaraMCarvalho) | 42 Login: `macarval`

---



