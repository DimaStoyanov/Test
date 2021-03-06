# HaskellTasks
Домашние задания курса по Хаскелю

<details> 
<summary><b>Задание 1 </b></summary>
Написать функцию <i>hasPair :: Integer -> Bool</i>, которая проверяет, есть ли в десятичной записи заданного числа две подряд идущие одинаковые цифры.    
 
 Например, <i>hasPair 1001 => True</i>, а <i>hasPair 1212 => False</i>.
   
   [Решение](Hw1.hs)
</details>

<details> 
<summary><b>Задания 2,3 </b></summary>
<b> Задание 2 </b>       

Назовем “производной” элемента числового списка разность между следующим в списке и данным элементом. Производной последнего элемента будем считать 0.   
Например, список производных элементов списка [3,1,2,5,7,6] будет список [-2,1,3,2,-1,0].   
Написать функцию <i>maxDeriv :: Real a => [a] -> Int</i>, которая в заданном списке числовых элементов находит индекс элемента с максимальной “производной”.   
Например, в вышеприведенном списке таким индексом будет 2, поскольку элемент с этим индексом имеет максимальную производную - 3.

<b> Задание 3 </b>   
В заданной строке символов будем считать числом произвольную последовательность цифр, слева и справа от которой не находится цифра.
Написать функцию <i>maxNumber :: String -> Integer</i>, выдающую числовое значение самого большого “числа” в строке.  
Например, результатом вызова функции с аргументом "0xFF55 00012 -100 19" должно быть 100. Если чисел в строке нет совсем, то это ошибка аргумента.


   [Решение](Hw2.hs)
</details>

<details> 
<summary><b>Задание 4 </b></summary>
Написать функцию <i>preHigher :: Ord a => [a] -> [Int]</i>, которая по заданному списку элементов выдает список индексов тех из них, которые строго меньше следующего.     

Например, в числовом списке [1, 2.2, 2.1, 3.14, 2.7, 1.618] числа, меньшие следующего в списке - это 1 и 2.1, поэтому вызов <i>preHigher [1, 2.2, 2.1, 3.14, 2.7, 1.618]</i> должен выдать список [0, 2] - список индексов этих элементов.


   [Решение](Hw4.hs)
</details>


<details> 
<summary><b>Задание 5 </b></summary>
Во задачах всех вариантов используется представление словаря в виде префиксного дерева (Trie, бор) без корневого элемента:

<i>data Trie = Empty | Node Char [Trie]   
type Dictionary = [Trie]</i>  
Например, словарь, содержащий слова “bit”, “byte”, “bite”, “site” будет представлен следующим образом (с точностью до порядка элементов списков):  
<i>[Node 'b' [Node 'i' [Node 't' [Empty,  
Node 'e' [Empty]]],  
Node 'y' [Node 't' [Node 'e' [Empty]]]],  
Node 's' [Node 'i' [Node 't' [Node 'e' [Empty]]]]]</i>  
           
Написать функцию <i>listWords :: Dictionary -> [String]</i>, которая выдает список всех слов в заданном словаре.
 

   [Решение](Hw5.hs)
</details>


<details> 
<summary><b>Задание 6 </b></summary>
<b> Задание 1 </b>  
В первой задаче каждого варианта требуется выбрать представление и определить тип данных  

<i>data Map key value = ..</i>  
для которого требуется реализовать стандартный набор методов для манипуляций с “отображением”:
<ul>
<i><li>get :: Eq k => k -> Map k v -> Maybe v</li>  
<li>put :: Eq k => (k, v) -> Map k v -> Map k v</li>  
<li>remove :: Eq k => k -> Map k v -> Map k v</li>  
<li>keys :: Map k v -> [k]</li>  
<li>values :: Map k v -> [v]</li></i>    
</ul>
Все вышеперечисленные функции имеют обычный для операций над отображениями смысл:
<ul>
<li>найти значение по ключу (<i>get</i>)</li>
<li>добавить или заменить существующую пару &lt;ключ,значение&gt; (<i>put</i>)</li>
<li>удалить пару с заданным ключом (<i>remove</i>)</li>
<li>выдать множество (список) всех ключей (<i>keys</i>)</li>
<li>выдать список всех значений (<i>values</i>)</li> 
</ul>  
Не следует сильно заботиться об эффективности представления и скорости работы функций, например, подойдет реализация в виде списка пар. 
 
Кроме этого в каждом из вариантов требуется определить дополнительную функцию.

Написать функцию <i>removeBy :: (k -> Bool) -> Map k v -> Map k v</i>, которая удаляет из заданного отображения те пары, ключи которых удовлетворяют критерию, заданному первым аргументом функции.  
Например, вызов <i>removeBy (&lt;0) m</i>  удалит из отображения m  те пары, ключи которых меньше нуля.

<b> Задание 2 </b>
 
Во второй задаче биномиальная куча определяется как список биномиальных деревьев, упорядоченный по возрастанию степеней.  
Как и положено в куче, все потомки каждого элемента больше или равны этому элементу.  
<i>type BinHeap e = [BinTree e]  
data BinTree e = BinTree e [BinTree e]</i>  

Аргументы типа данных BinTree представляют собой компоненты узла биномиальной кучи: содержащееся в узле значение и список поддеревьев.  
Написать функцию <i>replace :: Ord e => e -> BinHeap e -> BinHeap e</i>, которая меняет в куче минимальное значение на заданное первым аргументом новое значение и выдает модифицированную кучу.

   [Решение](Hw6.hs)
</details>

<details> 
<summary><b>Ход конем</b></summary>
 
Написать функцию, находяющую цикл коня, проходящего все поля шахматной доски и возвращающийся на исходную позицию
(полный перебор)


   [Решение](KnightsBruteForce.hs)
</details>


<details> 
<summary><b>Задание 7</b></summary>
 
Строка содержит натуральные числа, разделенные знаками '+', '-', '*', например, "12+23*2".
 
Написать функцию <i>addPars :: String -> String</i>, которая добавляет в строку круглые скобки таким образом, чтобы результат вычисления выражения стал максимальным.  
Например, для приведенной строки "12+23*2" результатом будет "((12+23)*2)" (с точностью до внешней пары скобок).  
Порядок выполнения операций в результирующей строке должен определяться только скобками, приоритеты операций не учитываются.    Функция должна выдавать результат за приемлемое время для строки, содержащей 10-12 операндов.


   [Решение](Hw7.hs)
</details>
