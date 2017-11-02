module Stoyanov_Dima_A3200 where

-- Стоянов Дима

-- Задание:
-- Написать функцию hasPair :: Integer -> Bool, которая проверяет,
-- есть ли в десятичной записи заданного числа две подряд идущие одинаковые цифры.
-- Например, hasPair 1001 => True, а hasPair 1212 => False.

-- Функция hasPair вызывает вспомогательную функцию
-- hasPair' с двумя аргументами, 1 аргумент хранит
-- последний рассмотренный разряд, а 2 аргумент -
-- остаток исходного числа, после отбрасывания n младших разрядов.
-- Если на очередном шаге текущий младший разряд совпадает с 2 аргументом
-- функции, тогда число содержит подряд идущие одинаковые цифры.
-- Если на очередном шаге остаток числа равен 0, тогда число
-- не содержит подряд идущих одинаковых цифр.

hasPair :: Integer -> Bool
hasPair n = hasPair' (mod n 10) (quot n 10) where
  hasPair' m n | n == 0          = False
             | n `mod` 10 == m = True
             | otherwise       = hasPair' (mod n 10) (quot n 10)


-- Тесты
main :: [Bool]
main = [
        hasPair 1123123,
        not (hasPair (-123456789)),
        hasPair 12432534663242322,
        not (hasPair 1023),
        hasPair (-12988520),
        hasPair 123324451,
        not (hasPair 0),
        not (hasPair 5),
        not (hasPair (-9))
        ]