# 28. Ход конём

|                   |                                |
|-------------------|--------------------------------|
|Ограничение времени|1 секунда                       |
|Ограничение памяти |64Mb                            |
|Ввод               |стандартный ввод или input.txt  |
|Вывод              |стандартный вывод или output.txt|

Дана прямоугольная доска $N × M$ ($N$ строк и $M$ столбцов). В левом верхнем углу находится шахматный конь, которого необходимо переместить в правый нижний угол доски. В данной задаче конь может перемещаться на две клетки вниз и одну клетку вправо или на одну клетку вниз и две клетки вправо.

Необходимо определить, сколько существует различных маршрутов, ведущих из левого верхнего в правый нижний угол.

## Формат ввода

Входной файл содержит два натуральных числа $N$ и $M$ ($1 ≤ N, M ≤ 50$).

## Формат вывода

В выходной файл выведите единственное число — количество способов добраться конём до правого нижнего угла доски.

### Пример 1

***Ввод***

```text
3 2
```

***Вывод***

```text
1
```

### Пример 2

***Ввод***

```text
31 34
```

***Вывод***

```text
293930
```