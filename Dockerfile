FROM python:3.6-alpine as build

RUN apk --update --upgrade add --no-cache g++ gcc musl-dev jpeg-dev zlib-dev libffi-dev cairo-dev pango-dev gdk-pixbuf-dev

COPY requirements.txt .
RUN pip install -r requirements.txt

FROM python:3.6-alpine

COPY --from=build /usr/local/lib/python3.6/site-packages /usr/local/lib/python3.6/site-packages

WORKDIR /opt/sshsysmon
COPY . .

ENTRYPOINT ["python3", "sshmon"]
