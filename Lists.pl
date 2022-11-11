% Сумма ряда всех чисел в списке
% Сумма элементов пустого списка равна нулю и если только список не пуст, то мы делим его на две части элемент и хвост. Обработаем рекурсивно хвост, в результате получим сумму элементов части списка без учета первого элемента. Добавим первый элемент чтобы получить окончательный результат.
sum_list([], 0):-!.
sum_list([Head|Tail], S):-sum_list(Tail, Tails), S is Tails+Head.

% Определение максимального элемента ряда
% Список разделяется на голову и хвост. Рекурсивно вычисляется наибольший элемент хвоста и сравнивается с первым элементом для определения результата для всего списка.
max_list([MaxElem], MaxElem):-!.
max_list([H|T], MaxElem):-max_list(T, TailMaxElem),
TailMaxElem > H, !, MaxElem = TailMaxElem;
MaxElem = H.

% Формирование нового списка из тех элементов старого списка, которые стоят на нечетных позициях. 
new_list([], []):- !.
new_list([L], [L]):- !.
new_list([H, _ | T], List):- new_list(T, L), List = [H | L].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Сумма двух элементов
sum(H, L, D):-D is H+L.

% Задом наперед список
reverse(List, ReverseList):-
   reverse(List, [], ReverseList). % вызов вспомогательной функции с пустым буфером
reverse([], Buffer, Buffer):-!.  % точка останова и заполнение ReverseList
reverse([Head|Tail], Buffer, ReverseList):-
   reverse(Tail, [Head|Buffer], ReverseList).

% Вспомогательная функция
processing(0, 0):-!.
processing(H, H_INV):- H > 0, H_INV = -H; H < 0, H_INV is H / -1.

% Инвертирование списка
invert([], []):-!.
invert([H|T],[H_INV|T_INV]):-processing(H, H_INV), invert(T, T_INV).


% Суммирование списков поэлементно
sum_element([],[], 0):-!.
sum_element([L], [O], [T]):- T is L + O, !.
sum_element([H|T], [R|K], New_List):-sum_element(T, K, L), sum(H, R, Y), New_List = [Y|L].

% Формирование нового списка из тех элементов старого списка, которые стоят на четных позициях
new_list_chet([], []):- !.
new_list_chet([_], []):- !.
new_list_chet([_, H|T], New):- new_list_chet(T, L), New = [H|L].

% Вычисление минимального элемента списка
min_list([MinElem], MinElem):-!.
min_list([Head|Tail], MinElem):-
   min_list(Tail, TailMinElem),
   TailMinElem < Head, !, MinElem = TailMinElem;
   MinElem = Head.

work:- write("Введите два списка одинаковой длины:"), nl, read([H|T]), read([H1|T1]), reverse([H1|T1], List), write("Второй список инвертировали! "), nl, write(List), sum_element([H|T], List, New_List),nl, write("Суммируем списки поэлементно!"), nl, write("Результат:"), nl, write(New_List), nl, new_list_chet(New_List, New_chet), write("Формируем список из элементов, которые стоят на четных позициях!"), nl, write("Результат:"), nl, write(New_chet), nl, write("Вывод минимального элемента листа!"), nl, min_list(New_chet, X), write(X), nl, write("Конец!").

