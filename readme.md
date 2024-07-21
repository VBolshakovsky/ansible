# Проект скриптов Ansible для автоматизации различных задач

Этот проект содержит набор скриптов Ansible для автоматизации различных задач, в целях обучения и личного использования. Рабочая среда для выполнения разворачивается с использованием контейнера Docker.

## Инструкции по установке и использованию

1. Установите Docker на вашей машине, если он еще не установлен.
2. Склонируйте этот репозиторий на свой компьютер.
3. Перейдите в директорию проекта.

### Запуск рабочей среды

Чтобы развернуть рабочую среду с помощью Docker, выполните следующие команды:

```bash
docker-compose up -d
```
Эта команда запустит контейнер Docker, необходимый для выполнения скриптов Ansible.

### Использование скриптов Ansible

1. Добавьте ваши хосты и настройки инвентаря в файле hosts.yaml и ansible.cfg.
2. Подключитесь к контейнеру при помощи [Remote SSH](https://code.visualstudio.com/docs/remote/ssh)
3. Запустите скрипты Ansible с помощью команд, обычно описанных в файлах playbooks.

Например: ansible-playbook ~/playbooks/playbook_example.yaml