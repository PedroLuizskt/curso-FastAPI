# FastZero API

Uma API RESTful completa para gerenciamento de tarefas (To-Do List), desenvolvida com foco em **arquitetura moderna, testes automatizados e integração contínua**. 

Este projeto serve como uma implementação de referência para boas práticas em desenvolvimento backend com Python, utilizando o ecossistema mais atual do FastAPI.

---

## 🛠️ Tecnologias e Ferramentas

O projeto foi construído utilizando as ferramentas mais modernas e eficientes do ecossistema Python:

* **Framework Web:** [FastAPI](https://fastapi.tiangolo.com/) (Alta performance e tipagem estática).
* **Banco de Dados:** PostgreSQL.
* **ORM & Migrações:** SQLAlchemy 2.0 (modo Dataclass) e Alembic.
* **Validação de Dados:** Pydantic V2.
* **Segurança:** Autenticação JWT (JSON Web Tokens) e Hashing de senhas moderno com `pwdlib` (Argon2).
* **Infraestrutura:** Docker e Docker Compose.
* **Testes:** Pytest com **Testcontainers** (garantindo testes de integração contra um banco PostgreSQL real e efêmero).
* **Integração Contínua (CI):** GitHub Actions.
* **Qualidade de Código:** Ruff (Linter/Formatter) e Taskipy (Task runner).

---

## Funcionalidades (Features)

* **Gestão de Usuários:** Criação, leitura, atualização e deleção de contas com verificação de permissões.
* **Autenticação:** Sistema de login seguro com geração e renovação de tokens JWT (Bearer).
* **Gestão de Tarefas (CRUD):** * Criação de tarefas atreladas ao usuário logado.
  * Listagem com paginação e filtros combinados (título, descrição, estado).
  * Atualização parcial (PATCH) e deleção.
* **Status de Tarefas:** Suporte a diferentes estados (draft, todo, doing, done, trash).

---

## Como executar o projeto (Via Docker)

A aplicação está totalmente conteinerizada, o que significa que você não precisa instalar o Python ou o PostgreSQL na sua máquina local, apenas o **Docker** e o **Docker Compose**.

1. **Clone o repositório:**
   ```bash
   git clone [https://github.com/PedroLuizskt/curso-FastAPI.git](https://github.com/PedroLuizskt/curso-FastAPI.git)
   cd curso-FastAPI
   ```

2. **Suba a infraestrutura:**
   O script de inicialização (`entrypoint.sh`) aplicará as migrações do banco de dados automaticamente.
   ```bash
   docker compose up -d --build
   ```

3. **Acesse a aplicação:**
   * A API estará rodando em: `http://localhost:8000`
   * A documentação interativa (Swagger UI) estará em: `http://localhost:8000/docs`

4. **Para parar os containers:**
   ```bash
   docker compose down
   ```

---

## Como executar a Suíte de Testes

O projeto possui uma cobertura de testes rigorosa. Utilizamos o **Testcontainers**, o que significa que ao rodar os testes, um container PostgreSQL real será criado, os testes serão executados contra ele, e depois ele será destruído automaticamente.

### 📊 Relatório de Cobertura Atual

| Módulo / Arquivo | Cobertura | Status |
| :--- | :--- | :--- |
| `app.py` (Entrypoint) | 100% | ✅ |
| `models.py` & `database.py` | 100% | ✅ |
| `routers/todo.py` (Core Business) | 100% | ✅ |
| `routers/auth.py` (Autenticação) | 100% | ✅ |
| `security.py` & `routers/users.py` | 91% - 95% | ✅ |
| **Total Geral** | **97%** | 🏆 (28 testes passando em ~ 14s) |

*Certifique-se de que o Docker Desktop (ou daemon) esteja rodando na sua máquina.*

1. Instale as dependências (caso queira rodar localmente fora do container da API):
   ```bash
   pipx install poetry
   poetry install
   ```

2. Execute os testes via Taskipy:
   ```bash
   poetry run task test
   ```

---

## ⚙️ Integração Contínua (CI)

O projeto conta com uma esteira de CI/CD configurada via **GitHub Actions**. A cada `push` ou `pull_request` para a branch principal, uma máquina virtual Linux é instanciada para:
1. Configurar o ambiente Python e Poetry.
2. Injetar as variáveis de ambiente seguras (Secrets).
3. Levantar o banco de dados de teste via Testcontainers.
4. Executar toda a suíte de testes com validação de cobertura (Coverage).

---
*Desenvolvido por Pedro Luiz.*
---
