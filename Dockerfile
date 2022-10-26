FROM python:3.8-alpine
WORKDIR /usr/src/app
LABEL maintainer="Mohamad Usama KUNNATHUR"
COPY ./techtrends/requirements.txt ./
RUN pip install -r requirements.txt
COPY ./techtrends ./
RUN python init_db.py
EXPOSE 3111
CMD [ "python", "app.py" ]