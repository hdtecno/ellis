# Use a imagem oficial do Python como base
FROM python:3.11-slim

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de requisitos e instala as dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o contêiner
COPY . .

# Expõe a porta em que a aplicação irá rodar
EXPOSE 8000

# Comando para iniciar a aplicação Gunicorn
CMD ["uvicorn", "app:app","--host", "0.0.0.0", "--port","8000", "--reload"]
