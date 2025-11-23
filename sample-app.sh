#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp sample_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

cat > tempdir/Dockerfile << 'EOF'
FROM tiangolo/uwsgi-nginx-flask:python3.9
COPY ./static /app/static/
COPY ./templates /app/templates/
COPY sample_app.py /app/main.py
EXPOSE 5050
ENV LISTEN_PORT 5050
CMD ["python", "/app/main.py"]
EOF

cd tempdir
docker build -t sampleapp .
docker run -t -d -p 5050:5050 --name samplerunning sampleapp
docker ps -a
