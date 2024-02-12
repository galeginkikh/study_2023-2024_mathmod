---
## Front matter
lang: ru-RU
title: Git
subtitle: 
author:
  - Легиньких Галина
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 09 февраля 2024

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---

# Информация

## Докладчик

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

   Легиньких Галина Андреевна
   студент
   НФИбд-02-21
   Российский университет дружбы народов



:::
::: {.column width="30%"}

:::
::::::::::::::

# Выполнение

## Цель

Повторение Git и Markdown.

## 

Для начала я скачала виртуальную машину и создала среду.
(рис. [-@fig:001])

![Виртуальная машина](фото/1.png){ #fig:001 width=50% }

## 
Подключила Git для работы в консоли. Использовала инструкцию.(рис. [-@fig:002])

![Git](фото/2.png){ #fig:002 width=50% }



## 

Создала репозиторий курса на основе шаблона и разместила в директории ~/work/study/2023-2024/"Математическое моделирование"
(рис. [-@fig:003])

![Репозиторий](фото/3.png){ #fig:003 width=70% }

## 

Далее я выполнила ряд команд из инструкции:
rm package.json
echo mathmod > COURSE
make prepare


## 

Залила изменения на github с помощью команд:
git add .
git commit -am 'feat(main): make course structure'
git push

## 

Я попробовала ряд команд из файла git.

## 

Скачала VisualCode для создания отчетов.(рис. [-@fig:004])

![Markdown](фото/4.png){ #fig:004 width=70% }

## 

Сконвертировала пробный файл в docx и pdf. (рис. [-@fig:005])

![Репозиторий](фото/5.png){ #fig:005 width=70% }

## Вывод: я вспомнила как работать с git и что такое markdown.