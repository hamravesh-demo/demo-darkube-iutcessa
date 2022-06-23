FROM hub.hamdocker.ir/python:slim
RUN apt-get update && apt-get install -y libevent-dev python3-psycopg2 python3-dev libpq-dev build-essential vim htop
COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r ./requirements.txt
COPY ./ ./
CMD python manage.py migrate && python manage.py runserver 0.0.0.0:8000
