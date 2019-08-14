# Общая структура проекта

## Типы виртуальных машин:
  
- DB (MongoDB/RabbitMQ)
- APP (UI/Crawler)
- GitLab (Server/Runner)
- Monitoring (Prometheus)

# Описание

Будет 2е среды, Stage - для разработки и Prod - для продуктивной среды

Для каждой среды будет создаваться 3 ВМ: DB, APP, Monitoring.

При помощи Packer будет подготавливаться шаблон ВМ для каждого из типов ВМ.

Terraform будет создавать ВМ каждого типа, из подготовленных Packer`ом шаблонов, для каждой среды.

Сервисный пользователь, который подготавливает ВМ именуется r2d2 =D.

1. Четыре машины в GCP:
- 1.1 App, машина на которую клонируются два репозитория: ui и crawler.
- 1.2 DB, машина с Reddit и MongoDB.
- 1.3 GitLab, машина для CI\CD.
- 1.4 Monitoring, Prometheus.

2. Структура папок
- Packer - Создание готового имаджа с необходимым софтов для терраформа
- Terraform - Описание инфраструктуры проекта
- Ansible - Плейбуки для автоматического деплоя проекта 

3. Логическое описание пайплайнов в GitLab
- Build
- Test 
- Push-to-registry
- Stage
- Prod

# Развертывание проекта

1. Нужно создать шаблоны ВМ
1.1 Для этого нужно пройти в директорию Packer
1.1.1. Создать файл variables.json из примера variables.json.example
1.1.2. запустить процесс сборки шаблонов, выполнив комаду packer build -var-file=variables.json db.json и packer build -var-file=variables.json docker.json
2. Далее нужно пройти в диреторию Terraform из корня репозитория
2.1. В проекте настроено удаленное хранение состояния инфраструктуры в GCP bucket, поэтому нужно или руками, или, также при помощи Terraform, создать buket
2.2. Для примера развернем среду Stage, для этого нужно пройти в директорию stage и выполнить команду Terraform apply
2.3. По итогу Terraform покажет внешние и внутренние адреса ВМ их нужно запомнить или записать для дальнейшей работы
3. Теперь нужно перейти в директорию Ansible из корня репозитория
3.1. Для работы Ansible нужно в имеющийся inventory файл подставить IP адреса, которые вывел Terraform, под каждый из типов серверов
3.2. 
4. Запустим GitLab
4.1 Перейдем в директорию terraform/gitlab/ и выполним terraform apply
4.2 После того как машинка создана, теперь нам необходимо поставить сам GitLab. Для этого занесем внешний IP в инвентори ансибл и запустим плейбук install-gitlab.yaml. Он поднимет ансибл через докер компоуз. 
4.3 Как только плейбук отработал, можно заходить по нашему внешнему IP и менять пароль для ROOT.
4.4 Сразу отключим регистрацию новых пользователей.
4.5 Создадим группу Otus.
4.6 Создадим два проекта под наши приложения.
4.7 В нашем репозитории сделали директорию apps, куда склонировали оба репозитория нашего приложения.
4.8 Теперь подключаем два ремоут репозитория гитлаба и смотрим как наши файлы появились в GitLab.
4.9 Установим два runner'а для наших проектов используя их токены.
4.10 Видим что наши пайплайны побежали.
4.11 Добавляем описание CI\CD Pipline через файл .gitlab-ci.yml
5. CI\CD
5.1 В пайплайне 5 этапов: сборка кода, его тестирование скриптами которые написал разработчик, push в удаленный docker hub и выкатка на нужное окружение.  
