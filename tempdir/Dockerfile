FROM tiangolo/uwsgi-nginx-flask:python3.9
COPY ./static /app/static/
COPY ./templates /app/templates/
COPY sample_app.py /app/main.py
EXPOSE 5050
ENV LISTEN_PORT 5050
CMD ["python", "/app/main.py"]
