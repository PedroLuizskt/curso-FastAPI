FROM python:3.13-slim

ENV POETRY_VIRTUALENVS_CREATE=false

# Caminho absoluto
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

RUN pip install poetry
RUN poetry config installer.max-workers 10

# Adicionado --no-root para evitar o erro de pasta ausente
RUN poetry install --no-interaction --no-ansi --without dev --no-root

EXPOSE 8000

# Formato recomendado para sinais do SO
CMD ["poetry", "run", "uvicorn", "--host", "0.0.0.0", "fast_zero.app:app"]