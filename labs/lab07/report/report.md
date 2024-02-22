---
## Front matter
title: "Отчет по лабораторной работе №7"
subtitle: "Модель эффективности рекламы"
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

Изучить и построить модель эффективности рекламы.

# Теоретическое введение. 

Организуется рекламная кампания нового товара или услуги. Необходимо, чтобы прибыль будущих продаж с избытком покрывала издержки на рекламу. Вначале расходы могут превышать прибыль, поскольку лишь малая часть потенциальных покупателей будет информирована о новинке. Затем, при увеличении числа продаж, возрастает и прибыль, и, наконец, наступит момент, когда рынок насытиться, и рекламировать товар станет бесполезным. [3]

Предположим, что торговыми учреждениями реализуется некоторая продукция, о которой в момент времени $t$ из числа потенциальных покупателей $N$ знает лишь $n$ покупателей. Для ускорения сбыта продукции запускается реклама по радио, телевидению и других средств массовой информации. После запуска рекламной кампании информация о продукции начнет распространяться среди потенциальных покупателей путем общения друг с другом. Таким образом, после запуска рекламных объявлений скорость изменения числа знающих о продукции людей пропорциональна как числу знающих о товаре покупателей, так и числу покупателей о нем не знающих

Модель рекламной кампании описывается следующими величинами.
Считаем, что $\frac{dn}{dt}$ - скорость изменения со временем числа потребителей, узнавших о товаре и готовых его купить, $t$ - время, прошедшее с начала рекламной кампании, $N$ - общее число потенциальных платежеспособных покупателей, $n(t)$ - число  уже информированных клиентов. Эта величина пропорциональна числу покупателей, еще не знающих о нем, это описывается следующим образом: $\alpha _1(t)(N-n(t))$, где $\alpha _1>0$ -  характеризует интенсивность рекламной кампании (зависит от затрат на рекламу в данный момент времени).
Помимо этого, узнавшие о товаре потребители также распространяют полученную информацию среди потенциальных покупателей, не знающих о нем (в этом случае работает т.н. сарафанное радио). Этот вклад в рекламу описывается величиной  $\alpha _2(t)n(t)(N-n(t))$. эта величина увеличивается с увеличением потребителей узнавших о товаре.
Математическая модель распространения рекламы описывается уравнением:

$$\frac{dn}{dt} = (\alpha _1(t) + \alpha _2(t)n(t))(N-n(t))$$

При $\alpha _1(t) >> \alpha _2(t)$ получается модель типа модели Мальтуса, решение которой имеет вид (рис. [-@fig:001]): 

![График решения уравнения модели Мальтуса](foto/1.png){ #fig:001 width=70% }

В обратном случае $\alpha _1(t) << \alpha _2(t)$ получаем уравнение логистической кривой (рис. [-@fig:002]):

![График логистической кривой](foto/2.png){ #fig:002 width=70% }

# Задание

**Мой вариант 18.**

Постройте график распространения рекламы, математическая модель которой описывается следующим уравнением:

1.	$\frac{dn}{dt} = (0.61 + 0.000061n(t))(N-n(t))$
2.	$\frac{dn}{dt} = (0.000073 + 0.73n(t))(N-n(t))$
3.	$\frac{dn}{dt} = (0.7t + 0.6\cos{(t)} n(t))(N-n(t))$

При этом объем аудитории $N = 1224$, в начальный момент о товаре знает 14 человек. Для случая 2 определите в какой момент времени скорость распространения рекламы будет иметь максимальное значение.

# Выполнение лабораторной работы

## Julia

Код программы для первого случая $\frac{dn}{dt} = (0.61 + 0.000061n(t))(N-n(t))$ (рис. [-@fig:003]):

```
using Plots
using DifferentialEquations

N = 1224
n0 = 14

function ode_fn(du, u, p, t)
  (n) = u
  du[1] = (0.61 + 0.000061*u[1])*(N - u[1])
end

v0 = [n0]
tspan = (0.0, 30.0)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob, dtmax = 0.05)
n = [u[1] for u in sol.u]
T = [t for t in sol.t]

plt = plot(dpi = 300, title = "Эффективность рекламы ", legend = false)
plot!(plt, T, n, color = :blue)

savefig(plt, "model_1.png")
```

![График распространения рекламы для первого случая, построенный на языке Julia](foto/3.png){ #fig:003 width=70% }

Код программы для второго случая $\frac{dn}{dt} = (0.000073 + 0.73n(t))(N-n(t))$ (рис. [-@fig:004]):

```
using Plots
using DifferentialEquations

N = 1224
n0 = 14

function ode_fn(du, u, p, t)
  (n) = u
  du[1] = (0.000073 + 0.73*u[1])*(N - u[1])
end

v0 = [n0]
tspan = (0.0, 0.1)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob)
n = [u[1] for u in sol.u]
T = [t for t in sol.t]

max_dn = 0;
max_dn_t = 0;
max_dn_n = 0;
for (i, t) in enumerate(T)
  if sol(t, Val{1})[1] > max_dn
    global max_dn = sol(t, Val{1})[1]
    global max_dn_t = t
    global max_dn_n = n[i]
  end
end

plt = plot(dpi = 300, title = "Эффективность рекламы", legend = false)
plot!(plt, T, n, color = :blue)
plot!(plt, [max_dn_t], [max_dn_n], seriestype = :scatter, color = :red)

savefig(plt, "model_2.png")
```

![График распространения рекламы для второго случая, построенный на языке Julia](foto/4.png){ #fig:004 width=70% }

Код программы для третьего случая $\frac{dn}{dt} = (0.7t + 0.6\cos{(t)}  n(t))(N-n(t))$ (рис. [-@fig:005]):

```
using Plots
using DifferentialEquations

N = 1224 
n0 = 14

function ode_fn(du, u, p, t)
  (n) = u
  du[1] = (0.7*t + 0.6*cos(t)*u[1])*(N - u[1])
end

v0 = [n0]
tspan = (0.0, 0.1)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob, dtmax = 0.05)
n = [u[1] for u in sol.u]
T = [t for t in sol.t]

plt = plot(dpi = 300, title = "Эффективность рекламы ", legend = false)
plot!(plt, T, n, color = :blue)

savefig(plt, "model_3.png")
```

![График распространения рекламы для третьего случая, построенный на языке Julia](foto/5.png){ #fig:005 width=70%  }

## OpenModelica 

Код программы для первого случая $\frac{dn}{dt} = (0.61 + 0.000061n(t))(N-n(t))$ (рис. [-@fig:006]):

```
model lab7
Real N = 1224;
Real n;
initial equation
n = 14;
equation
der(n) = (0.61 + 0.00061*n)*(N-n);
end lab7;
```

![График распространения рекламы для первого случая, построенный с помощью OpenModelica](foto/6.png){ #fig:006 width=70% }

Код программы для второго случая $\frac{dn}{dt} = (0.000073 + 0.73n(t))(N-n(t))$ (рис. [-@fig:007]):

```
model lab7_2
Real N = 1224;
Real n;
initial equation
n = 14;
equation
der(n) = (0.000073 + 0.73*n)*(N-n);
end lab7_2;
```

![График распространения рекламы для второго случая, построенный с помощью OpenModelica](foto/7.png){ #fig:007 width=70% }

Код программы для третьего случая $\frac{dn}{dt} = (0.7t + 0.6\cos{(t)}  n(t))(N-n(t))$ (рис. [-@fig:008]):
))$:

```
model lab7_3
Real N = 1224;
Real n;
initial equation
n = 14;
equation
der(n) = (0.7 * time + 0.6*cos(time)*n)*(N-n);
end lab7_3;
```

![График распространения рекламы для третьего случая, построенный с помощью OpenModelica](foto/8.png){ #fig:008 width=70% }

# Анализ полученных результатов. Сравнение языков.

В итоге проделанной работы мы построили графики распространения рекламы для трех случаев на языках Julia и OpenModelica. Построение модели распространения рекламы на языке OpenModelica занимает значительно меньше строк, чем аналогичное построение на Julia. 
Кроме того, построения на языке OpenModelica проводятся относительно значения времени t по умолчанию, что упрощает нашу работу. 

# Вывод

В ходе выполнения лабораторной работы была изучена модель эффективности рекламы и в дальнейшем построена модель на языках Julia и Open Modelica.

# Список литературы. Библиография.

[1] Документация по Julia: https://docs.julialang.org/en/v1/

[2] Документация по OpenModelica: https://openmodelica.org/

[3] Мальтузианская модель роста: https://www.stolaf.edu//people/mckelvey/envision.dir/malthus.html
