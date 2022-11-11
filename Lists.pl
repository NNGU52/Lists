% ����� ���� ���� ����� � ������
% ����� ��������� ������� ������ ����� ���� � ���� ������ ������ �� ����, �� �� ����� ��� �� ��� ����� ������� � �����. ���������� ���������� �����, � ���������� ������� ����� ��������� ����� ������ ��� ����� ������� ��������. ������� ������ ������� ����� �������� ������������� ���������.
sum_list([], 0):-!.
sum_list([Head|Tail], S):-sum_list(Tail, Tails), S is Tails+Head.

% ����������� ������������� �������� ����
% ������ ����������� �� ������ � �����. ���������� ����������� ���������� ������� ������ � ������������ � ������ ��������� ��� ����������� ���������� ��� ����� ������.
max_list([MaxElem], MaxElem):-!.
max_list([H|T], MaxElem):-max_list(T, TailMaxElem),
TailMaxElem > H, !, MaxElem = TailMaxElem;
MaxElem = H.

% ������������ ������ ������ �� ��� ��������� ������� ������, ������� ����� �� �������� ��������. 
new_list([], []):- !.
new_list([L], [L]):- !.
new_list([H, _ | T], List):- new_list(T, L), List = [H | L].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ����� ���� ���������
sum(H, L, D):-D is H+L.

% ����� ������� ������
reverse(List, ReverseList):-
   reverse(List, [], ReverseList). % ����� ��������������� ������� � ������ �������
reverse([], Buffer, Buffer):-!.  % ����� �������� � ���������� ReverseList
reverse([Head|Tail], Buffer, ReverseList):-
   reverse(Tail, [Head|Buffer], ReverseList).

% ��������������� �������
processing(0, 0):-!.
processing(H, H_INV):- H > 0, H_INV = -H; H < 0, H_INV is H / -1.

% �������������� ������
invert([], []):-!.
invert([H|T],[H_INV|T_INV]):-processing(H, H_INV), invert(T, T_INV).


% ������������ ������� �����������
sum_element([],[], 0):-!.
sum_element([L], [O], [T]):- T is L + O, !.
sum_element([H|T], [R|K], New_List):-sum_element(T, K, L), sum(H, R, Y), New_List = [Y|L].

% ������������ ������ ������ �� ��� ��������� ������� ������, ������� ����� �� ������ ��������
new_list_chet([], []):- !.
new_list_chet([_], []):- !.
new_list_chet([_, H|T], New):- new_list_chet(T, L), New = [H|L].

% ���������� ������������ �������� ������
min_list([MinElem], MinElem):-!.
min_list([Head|Tail], MinElem):-
   min_list(Tail, TailMinElem),
   TailMinElem < Head, !, MinElem = TailMinElem;
   MinElem = Head.

work:- write("������� ��� ������ ���������� �����:"), nl, read([H|T]), read([H1|T1]), reverse([H1|T1], List), write("������ ������ �������������! "), nl, write(List), sum_element([H|T], List, New_List),nl, write("��������� ������ �����������!"), nl, write("���������:"), nl, write(New_List), nl, new_list_chet(New_List, New_chet), write("��������� ������ �� ���������, ������� ����� �� ������ ��������!"), nl, write("���������:"), nl, write(New_chet), nl, write("����� ������������ �������� �����!"), nl, min_list(New_chet, X), write(X), nl, write("�����!").

