FROM python:3.12-alpine

# Diretório de trabalho
WORKDIR /app

# Copiar os arquivos do projeto
COPY . /app/

# Definir variáveis de ambiente
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Instalar dependências do sistema e configurar o ambiente virtual
RUN apk add --upgrade --no-cache postgresql-client && \
    apk add --upgrade --no-cache --virtual .tmp-build-deps \
        build-base postgresql-dev musl-dev && \
    pip install --upgrade pip && \
    pip install -r requirements.txt && \
    apk del .tmp-build-deps

# Expor a porta do servidor Django
EXPOSE 8000

# Comando padrão para o contêiner
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]