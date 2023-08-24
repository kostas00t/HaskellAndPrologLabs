
%-----------------------------------------------------------------------------------------

%-- ASKHSH 1

twice(C,N) :- fail.

in2Cities(D) :- fail. 

in3Continents(I) :- fail.






%-----------------------------------------------------------------------------------------

%-- ASKHSH 2

move(A,B,C) :- fail.










%-----------------------------------------------------------------------------------------

%-- ASKHSH 3

f(N,M,Y) :- fail. 










%-----------------------------------------------------------------------------------------

%-- ASKHSH 4

p(N) :- fail.










%-----------------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------------

%-- MHN TROPOPOIHSETE TO PARAKATW TMHMA KWDIKA 

dif(X,Y) :- X \= Y.

hosted(1,1896,'Athens').
hosted(2,1900,'Paris').
hosted(3,1904,'St. Louis').
hosted(4,1908,'London').
hosted(5,1912,'Stockholm').
hosted(7,1920,'Antwerp').
hosted(8,1924,'Paris').
hosted(9,1928,'Amsterdam').
hosted(10,1932,'Los Angeles').
hosted(11,1936,'Berlin').
hosted(14,1948,'London').
hosted(15,1952,'Helsinki').
hosted(16,1956,'Melbourne').
hosted(17,1960,'Rome').
hosted(18,1964,'Tokyo').
hosted(19,1968,'Mexico City').
hosted(20,1972,'Munich').
hosted(21,1976,'Montreal').
hosted(22,1980,'Moscow').
hosted(23,1984,'Los Angeles').
hosted(24,1988,'Seoul').
hosted(25,1992,'Barcelona').
hosted(26,1996,'Atlanta').
hosted(27,2000,'Sydney').
hosted(28,2004,'Athens').
hosted(29,2008,'Beijing').
hosted(30,2012,'London').
hosted(31,2016,'Rio de Janeiro').


country('Melbourne','Australia').
country('Sydney','Australia').
country('Antwerp','Belgium').
country('Rio de Janeiro','Brazil').
country('Montreal','Canada').
country('Beijing','China').
country('Helsinki','Finland').
country('Paris','France').
country('Berlin','Germany').
country('Athens','Greece').
country('Rome','Italy').
country('Tokyo','Japan').
country('Mexico City','Mexico').
country('Amsterdam','Netherlands').
country('Seoul','South Korea').
country('Moscow','Soviet Union').
country('Barcelona','Spain').
country('Stockholm','Sweden').
country('London','United Kingdom').
country('St. Louis','United States of America').
country('Los Angeles','United States of America').
country('Atlanta','United States of America').
country('Munich','West Germany').

continent('Australia','Oceania').
continent('Belgium','Europe').
continent('Brazil','America').
continent('Canada','America').
continent('China','Asia').
continent('Finland','Europe').
continent('France','Europe').
continent('Germany','Europe').
continent('Greece','Europe').
continent('Italy','Europe').
continent('Japan','Asia').
continent('Mexico','America').
continent('Netherlands','Europe').
continent('South Korea','Asia').
continent('Soviet Union','Europe').
continent('Spain','Europe').
continent('Sweden','Europe').
continent('United Kingdom','Europe').
continent('United States of America','America').
continent('West Germany','Europe').



nextStation(green,X,Y) :- green(X,Y).
nextStation(red,X,Y) :- red(X,Y).
nextStation(blue,X,Y) :- blue(X,Y).
nextStation(yellow,X,Y) :- yellow(X,Y).

entranceFare(blue,10).
entranceFare(green,10).
entranceFare(red,60).
entranceFare(yellow,20).

travelFare(blue,15).
travelFare(green,15).
travelFare(red,5).
travelFare(yellow,8).


green(a1,b1).
green(b1,b2).
green(b2,c3).
green(c3,c4).
green(c4,b4).
green(b4,b5).
green(b5,b6).
green(b6,b7).
green(b7,a8).
green(a8,b8).
green(b8,c8).
green(b1,a1).
green(b2,b1).
green(c3,b2).
green(c4,c3).
green(b4,c4).
green(b5,b4).
green(b6,b5).
green(b7,b6).
green(a8,b7).
green(b8,a8).
green(c8,b8).
yellow(b1,c1).
yellow(c1,d1).
yellow(d1,e1).
yellow(e1,d2).
yellow(d2,d3).
yellow(d3,c4).
yellow(c4,d4).
yellow(d4,e4).
yellow(e4,f5).
yellow(f5,e5).
yellow(e5,d5).
yellow(d5,d6).
yellow(d6,c7).
yellow(c7,c8).
yellow(c8,d8).
yellow(d8,e8).
yellow(e8,f8).
yellow(c1,b1).
yellow(d1,c1).
yellow(e1,d1).
yellow(d2,e1).
yellow(d3,d2).
yellow(c4,d3).
yellow(d4,c4).
yellow(e4,d4).
yellow(f5,e4).
yellow(e5,f5).
yellow(d5,e5).
yellow(d6,d5).
yellow(c7,d6).
yellow(c8,c7).
yellow(d8,c8).
yellow(e8,d8).
yellow(f8,e8).
blue(d2,f1).
blue(f1,g1).
blue(g1,h1).
blue(h1,g2).
blue(g2,g3).
blue(g3,g4).
blue(g4,f5).
blue(f5,f6).
blue(f6,f7).
blue(f7,f8).
blue(f8,g7).
blue(g7,h8).
blue(f1,d2).
blue(g1,f1).
blue(h1,g1).
blue(g2,h1).
blue(g3,g2).
blue(g4,g3).
blue(f5,g4).
blue(f6,f5).
blue(f7,f6).
blue(f8,f7).
blue(g7,f8).
blue(h8,g7).
red(a2,b3).
red(b3,c3).
red(c3,d3).
red(d3,e3).
red(e3,e2).
red(e2,f2).
red(f2,f3).
red(f3,g3).
red(g3,h2).
red(h2,h3).
red(h3,h4).
red(h4,h5).
red(h5,h6).
red(h6,h7).
red(h7,g6).
red(g6,f6).
red(f6,e7).
red(e7,d7).
red(d7,d6).
red(d6,c6).
red(c6,b6).
red(b6,a7).
red(a7,a6).
red(a6,a5).
red(a5,a4).
red(a4,a3).
red(a3,a2).
red(b3,a2).
red(c3,b3).
red(d3,c3).
red(e3,d3).
red(e2,e3).
red(f2,e2).
red(f3,f2).
red(g3,f3).
red(h2,g3).
red(h3,h2).
red(h4,h3).
red(h5,h4).
red(h6,h5).
red(h7,h6).
red(g6,h7).
red(f6,g6).
red(e7,f6).
red(d7,e7).
red(d6,d7).
red(c6,d6).
red(b6,c6).
red(a7,b6).
red(a6,a7).
red(a5,a6).
red(a4,a5).
red(a3,a4).
red(a2,a3).
