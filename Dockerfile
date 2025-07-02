# Use uma imagem base do Python
FROM python:3.13.5-alpine3.22

# Defina o diretório de trabalho
WORKDIR /app

# Copie o arquivo de requirements e instale as dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copie o restante dos arquivos da aplicação
COPY . .

# Exponha a porta em que a aplicação irá rodar
EXPOSE 8000

# Comando para rodar a aplicação usando Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
