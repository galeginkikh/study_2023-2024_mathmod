---
## Front matter
title: "Отчет по лабораторной работе №1"
subtitle: "Git"
author: "Легиньких Галина Андреевна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы
Повторение Git и Markdown.

# Теоретическое введение

По ходу лабораторной работы.

# Выполнение лабораторной работы

**1.**  Для начала я скачала виртуальную машину и создала среду.
(рис. [-@fig:001])

![Виртуальная машина](foto/1.png){ #fig:001 width=70% }

**2.** Подключила Git для работы в консоли. Использовала инструкцию.(рис. [-@fig:002])

![Git](foto/2.png){ #fig:002 width=70% }

**3.** Создала репозиторий курса на основе шаблона и разместила в директории ~/work/study/2023-2024/"Математическое моделирование"
(рис. [-@fig:003])

![Репозиторий](foto/3.png){ #fig:003 width=70% }

**4.** Далее я выполнила ряд команд из инструкции:
rm package.json
echo mathmod > COURSE
make prepare

**5.** Залила изменения на github с помощью команд:
git add .
git commit -am 'feat(main): make course structure'
git push

**6.** Я попробовала ряд команд из файла git.

**7.** Скачала VisualCode для создания отчетов.(рис. [-@fig:004])

![Markdown](foto/4.png){ #fig:004 width=70% }

**8.** Сконвертировала пробный файл в docx и pdf. (рис. [-@fig:005])

![Репозиторий](foto/5.png){ #fig:005 width=70% }

Вывод: я вспомнила как работать с git и что такое markdown.





