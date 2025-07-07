FROM python:3.13-alpine3.22

# Definindo o diretório de trabalho dentro do contêiner 
WORKDIR /app


# Copia o arquivo de requisitos e instala as depêndencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia e leva o .(tudo) - código da aplicação para dentro do contêiner
COPY . .

# Expõe a porta 8000 que a aplicação FastAPI irá escutar por padrão
EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

