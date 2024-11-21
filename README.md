# Default files to setup a Django and Docker project

If you want to setup a new project, you can use the following steps to do this, but before doing that:

- Remove the folder setup
- Remove the file manage.py

<br>

## First step

> Make sure that you have Docker installed in your environment.

Clone the repository and follow the steps below:

1 - Run the following command:

```bash
docker compose build
```

<br>

2 - Create a new project django:

```bash
docker compose run --rm app sh -c "django-admin startproject setup ."
```

<br>

3 - Create a new app if you want to:

```bash
docker compose run --rm app sh -c "python3 manage.py startapp base"
```

<br>

4 - Create a new super user:

```bash
docker compose run --rm app sh -c "python3 manage.py createsuperuser"
```

<br>

5 - Setup the file `/setup/settings.py` in your project:

<br>

Remember that you need to import the library os and change the database settings, like so:

<br>

```python
import os

# ...

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('DB_NAME'),
        'HOST': os.environ.get('DB_HOST'),
        'USER': os.environ.get('DB_USER'),
        'PASSWORD': os.environ.get('DB_PASSWORD'),
    }
}
```

---

## Setup your apps

Don't forget to add your new apps in the `settings.py`.

---
<br>
Developed by Fábio Carvalho, 2024.