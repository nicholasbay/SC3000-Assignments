/* Knowledge Base for Exercise 2 Part 1 */


/* Constants */
queen_elizabeth.                                % Person named 'queen_elizabeth'
prince_andrew.                                  % Person named 'prince_andrew'
prince_charles.                                 % Person named 'prince_charles'
prince_edward.                                  % Person named 'prince_edward'
princess_ann.                                   % Person named 'princess_ann'


/* Predicates */
male(prince_charles).                           % 'prince_charles' is a male
male(prince_andrew).                            % 'prince_andrew' is a male
male(prince_edward).                            % 'prince_edward' is a male

female(queen_elizabeth).                        % 'queen_elizabeth' is a female
female(princess_ann).                           % 'princess_ann' is a female

monarch(queen_elizabeth).                       % 'queen_elizabeth' is a monarch

child_of(prince_charles, queen_elizabeth).      % 'prince_charles' is a child of 'queen_elizabeth'
child_of(princess_ann, queen_elizabeth).         % 'princess_ann' is a child of 'queen_elizabeth'
child_of(prince_andrew, queen_elizabeth).       % 'prince_andrew' is a child of 'queen_elizabeth'
child_of(prince_edward, queen_elizabeth).       % 'prince_edward' is a child of 'queen_elizabeth'

older_sibling(prince_charles, princess_ann).    % 'prince_charles' is an older sibling of 'princeess_ann'
older_sibling(prince_charles, prince_andrew).   % 'prince_charles' is an older sibling of 'prince_andrew'
older_sibling(prince_charles, prince_edward).   % 'prince_charles' is an older sibling of 'prince_edward'
older_sibling(princess_ann, prince_andrew).     % 'princess_ann' is an older sibling of 'prince_andrew'
older_sibling(princess_ann, prince_edward).     % 'princess_ann' is an older sibling of 'prince_edward'
older_sibling(prince_andrew, prince_edward).    % 'prince_andrew' is an older sibling of 'princess_ann'


/* Relations */
son_of(Child, Parent) :-
    child_of(Child, Parent),                    % 'Child' is a child of 'Parent'
    male(Child).                                % 'Child' is a male

daughter_of(Child, Parent) :-
    child_of(Child, Parent),                    % 'Child' is a child of 'Parent'
    female(Child).                              % 'Child' is a female

succession_line(Child) :-
    monarch(Monarch),
    (
        son_of(Child, Monarch);
        daughter_of(Child, Monarch)
    ).
