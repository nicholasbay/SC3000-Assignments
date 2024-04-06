/* Knowledge Base for Exercise 1 */


/* Constants */
sumsum.									% Company named 'sumsum'
appy.									% Company named 'appy'
stevey.									% Person named 'stevey'
galactica_s3.							% Product named 'galactica_s3'


/* Predicates */
competitor(sumsum, appy).				% 'sumsum' is a competitor of 'appy'
develop(sumsum, galactica_s3).			% 'sumsum' develops 'galactica_s3'
boss(stevey, appy).						% 'stevey' is a boss of 'appy'
steal(stevey, galactica_s3, sumsum).	% 'stevey' steals 'galactica_s3' from 'sumsum'


/* Relations */
competitor(X,Y) :-						% Defines the relation: 'X' is a competitor of 'Y'
	competitor(Y,X),					% Inversely, 'Y' is a competitor of 'X'
	atom(X),							% Ensure 'X' is an atom (company name)
	X\=Y.								% Ensure 'X' and 'Y' are different

rival(X,Y) :-							% Defines the relation: 'X' is a rival of 'Y'
	competitor(X,Y),					% 'X' is a competitor of 'Y'
	X\=Y.								% Ensure 'X' and 'Y' are different

business(X) :-							% Defines the relation: 'X' is a business
	smartphonetechnology(X).			% 'X' is involved in smartphone technology

smartphonetechnology(X) :- 				% Defines the relation: 'X' is involved in smartphone technology
	develop(_,X).						% 'X' is developed by some company

unethical(X) :-							% Defines the relation: 'X' is unethical
	boss(X,Y),							% 'X' is a boss of 'Y'
	rival(Y,Z),							% 'Y' is a competitor of 'Z'
	Y\=Z,								% Ensure 'Y' and 'Z' are different companies
	steal(X,A,Z),						% 'A' steals product 'A' from 'Z'
	business(A).						% 'A' is a business (involved in smartphone technology)