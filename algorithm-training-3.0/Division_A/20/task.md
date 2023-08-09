# 20. Машинки

|                   |                                |
|-------------------|--------------------------------|
|Ограничение времени|2 секунды                       |
|Ограничение памяти |256Mb                           |
|Ввод               |стандартный ввод или input.txt  |
|Вывод              |стандартный вывод или output.txt|

Петя, которому три года, очень любит играть с машинками. Всего у Пети $N$ различных машинок, которые хранятся на полке шкафа так высоко, что он сам не может до них дотянуться. Одновременно на полу комнаты может находиться не более $K$ машинок. Петя играет с одной из машинок на полу и если он хочет поиграть с другой машинкой, которая также находится на полу, то дотягивается до нее сам. Если же машинка находится на полке, то он обращается за помощью к маме. Мама может достать для Пети машинку с полки и одновременно с этим поставить на полку любую машинку с пола. Мама очень хорошо знает своего ребенка и может предугадать последовательность, в которой Петя захочет играть с машинками. При этом, чтобы не мешать Петиной игре, она хочет совершить как можно меньше операций по подъему машинки с пола, каждый раз правильно выбирая машинку, которую следует убрать на полку. Ваша задача состоит в том, чтобы определить минимальное количество операций. Перед тем, как Петя начал играть, все машинки стоят на полке.

## Формат ввода

В первой строке содержаться три числа $N$, $K$ и $P$ ($1≤K≤N≤100000, 1≤P≤500000$). В следующих $P$ строках записаны номера машинок в том порядке, в котором Петя захочет играть с ними.

## Формат вывода

Выведите единственное число: минимальное количество операций, которое надо совершить Петиной маме.

## Пример

***Ввод***

```text
3 2 7
1
2
3
1
3
1
2
```

***Вывод***

```text
4
```

## Примечания

Операция 1: снять машинку 1  
Операция 2: снять машинку 2  
Операция 3: поднять машинку 2 и снять машинку 3  
Операция 4: поднять машинку 3 или 1 и снять машинку 2