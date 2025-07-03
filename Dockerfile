FROM python:3.13.5-alpine3.21

# Instala dependências do sistema (se necessário para pacotes Python)
RUN apk add --no-cache gcc musl-dev libffi-dev

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de dependências
COPY requirements.txt .

# Instala as dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante da aplicação
COPY . .

# Expõe a porta (ajuste conforme seu app, ex: 8000 para FastAPI/Uvicorn)
EXPOSE 8000

# Comando para rodar a aplicação (ajuste conforme seu framework)
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]