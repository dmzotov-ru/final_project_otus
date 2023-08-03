# Курсовой проект

## Описание инфраструктуры и CI/CD процесса

В Yandex Cloud (YC) поднят сервер Gitlab и кластер Kubernetes.

В Gitlab через отделную ветку делается push изменений, после чего запускается CI.

Если CI проходит успешно, то автоматом происходит деплой на DEV окружение.

В PROD окружение код попадает после ручного запуска.

В CI производится сборка docker образов проекта, запуск в docker-compose, тестирование приложения crawler и ui, тегирование образов тегом 'latest', push образов в docker hub, деплоймент микросервисов в неймспейсе dev кластера kubernetes.

В CD производится сборка docker образов проекта, запуск в docker-compose, тестирование приложения crawler и ui, тегирование образов тегом '1.0', push образов в docker hub, деплоймент микросервисов в неймспейсе prod кластера kubernetes.

UI приложения в неймспейсе dev доступен по адресу http://dev.otus.space. Grafana доступна по ссылке http://dev.otus.space/grafana. Prometheus доступен по ссылке http://dev.prometheus.otus.space

UI приложения в неймспейсе prod доступен по адресу http://otus.space. Grafana доступна по ссылке http://otus.space/grafana. Prometheus доступен по ссылке http://prometheus.otus.space

## Запуск

- Скачать репозиторий и перейти в каталог terraform ```git clone https://github.com/dmzotov-ru/final_project_otus.git && cd ./final_project_otus/terraform```

- Развернуть ресурсы в YC ```terraform init && terraform apply -auto-approve```

- Скопировать на инстанс Gitlab в каталог /opt файл kubeconfig 

- Настроить в Gitlab проект и склонировать проект из Github

- Зарегистрировать доменное имя

- Настроить зону DNS в YC под доменное имя и создать DNS записи для окружений dev и prod

- Создать отдельную ветку с main ветки, внести изменения в код и сделать push в Gitlab. В Gitlab автоматически запустится CI процесс

- В случае, если необходимо задеплоить код в prod, необходимо запустить pipeline в окружении production вручную.
