# B. Канонический путь

|                   |                                |
|-------------------|--------------------------------|
|Ограничение времени|1 секунда                       |
|Ограничение памяти |64Mb                            |
|Ввод               |стандартный ввод или input.txt  |
|Вывод              |стандартный вывод или output.txt|

По заданной строке, являющейся абсолютным адресом в Unix-системе, вам необходимо получить канонический адрес.

В Unix-системе “.” соответсвутет текущей директории, “..” — родительской директории, при этом будем считать, что любое количество точек подряд, большее двух, соответствует директории с таким названием (состоящем из точек). “/” является разделителем вложенных директорий, причем несколько “/” подряд должны интерпретироваться как один “/”.

Канонический путь должен обладать следующими свойствами:

1. всегда начинаться с одного “/”
1. любые две вложенные директории разделяются ровно одним знаком “/”
1. путь не заканчивается “/” (за исключением корневой директории, состоящего только из символа “/”)
1. в каноническом пути есть только директории, т.е. нет ни одного вхождения “.” или “..” как соответствия текущей или родительской директории

## Формат ввода

Вводится строка с абсолютным адресом, её длина не превосходит 100.

## Формат вывода

Выведите канонический путь.

### Пример 1

***Ввод***

```text
/home/
```

***Вывод***

```text
/home
```

### Пример 2

***Ввод***

```text
/../
```

***Вывод***

```text
/
```

### Пример 3

***Ввод***

```text
/home//foo/
```

***Вывод***

```text
/home/foo
```

## Примечания

В первом примере необходимо убрать “/” в конце строки

Во втором примере нельзя подняться выше корневой директории

В третьем примере несколко подряд идущих “/” должны замениться на один, а также необходимо убрать “/” в конце строки
