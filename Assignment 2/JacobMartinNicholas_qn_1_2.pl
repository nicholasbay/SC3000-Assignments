/* Knowledge Base for Exercise 1 Part 2 */


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
competitor(CompanyX, CompanyY) :-		% Defines the relation: 'CompanyX' is a competitor of 'CompanyY'
	competitor(CompanyY, CompanyX),		% Inversely, 'CompanyY' is a competitor of 'CompanyX'
	atom(CompanyX),						% Ensure 'CompanyX' is an atom (company name)
	CompanyX \= CompanyY.				% Ensure 'CompanyX' and 'Y' are different

rival(CompanyX,CompanyY) :-					% Defines the relation: 'CompanyX' is a rival of 'CompanyY'
	competitor(CompanyX, CompanyY),		% 'CompanyX' is a competitor of 'CompanyY'
	CompanyX \= CompanyY.				% Ensure 'CompanyX' and 'CompanyY' are different

business(Product) :-					% Defines the relation: 'Product' is part of a business
	smartphonetechnology(X).			% 'Product' has smartphone technology

smartphonetechnology(Product) :- 		% Defines the relation: 'Product' has smartphone technology
	develop(_, Product).				% 'Product' is developed by some company

unethical(Person) :-					% Defines the relation: 'Person' is unethical
	boss(Person, CompanyX),				% 'CompanyX' is a boss of 'CompanyY'
	rival(CompanyX, CompanyY),			% 'CompanyX' is a rival of 'CompanyY'
	CompanyX \= CompanyY,				% Ensure 'CompanyX' and 'CompanyY' are different companies
	steal(Person, Product, CompanyY),	% 'Person' steals 'Product' from 'CompanyY'
	business(Product).					% 'Product' is part of a business