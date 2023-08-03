FROM python:3.6.15-slim-buster

WORKDIR app
COPY . .

RUN pip install -r requirements-test.txt
RUN pip install -r requirements.txt

ENV EXCLUDE_URLS='.*github.com'
CMD [ "python3", "-u", "crawler/crawler.py", "https://vitkhab.github.io/search_engine_test_site/" ] 
