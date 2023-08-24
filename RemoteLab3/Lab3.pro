%% TSAMPIRAS KONSTANTINOS (4508)
%-----------------------------------------------------------------------------------------

%-- ASKHSH 1

twice(C,N) :- hosted(Ia,Ya,C), 				% Check if we have same city twice
			  hosted(Ib,Yb,C), 				% Other I-th, Other Year, same City
			  dif(Ia,Ib), 					% If Ia \= Ib, then yes
			  K is Yb-Ya, 					% Year difference between the 2 competitions
			  N =< K.						% If the difference is less than the one I entered (K), yes

in2Cities(D) :- country(Ca,D), 				% Check if we have same country twice
				country(Cb,D), 				% but with different Cities
				dif(Ca,Cb). 				% If Ca \= Cb, then yes

in3Continents(I) :-	Ia is I,				%
					Ib is I+1,				% value assignment of I, I+1, and I+2 to Ia, Ib and Ic respectively
					Ic is I+2,				%
					hosted(Ia,Ya,Ca), 		% Check if I-th
					hosted(Ib,Yb,Cb),		% (I+1)-th	
					hosted(Ic,Yc,Cc),		% (I+2)-th Cities...
					country(Ca,Da),			% 
					country(Cb,Db),			% ...are in Countries...
					country(Cc,Dc),			% 
					continent(Da,Ha),		% 
					continent(Db,Hb),		% ...that are in...
					continent(Dc,Hc),		% 
					dif(Ha,Hb),				% 
					dif(Ha,Hc),				% ...different Continents
					dif(Hb,Hc).				% then yes

%-----------------------------------------------------------------------------------------

%-- ASKHSH 2

move(A,B,C) :- nextStation(L,A,B), 							% If Stations are next to each other
			   entranceFare(L,Fa), 							% You pay the Entrance Fare (Fa) of the Line
			   travelFare(L,Fb), 							% and the Travel Fare (Fb) of the Line
			   FPRICE is Fa+Fb, 							% The Final Price is (Fa+Fb)
			   FPRICE =< C.									% If Final Price is less than or equal to C, then yes.

move(A,B,C) :- nextStation(L,A,Ba),	 						% If Stations are not next to each other
			   dif(Ba,B), 									% Check if Destination and next Station are not the same
			   entranceFare(L,Fa), 							% You pay the Entrance Fare (Fa) of the Line
			   travelFare(L,Fb), 							% and the Travel Fare (Fb) of the Line
			   PPRICE is Fa+Fb, 							% The Partial Price is (Fa+Fb)
			   DIFF is C-PPRICE, 							% Diff is the Difference of C and the Partial Price
			   DIFF > 0, 									% If Diff is positive, we can continue
			   moveHelper(Ba,B,DIFF,L).						% checking with the remaining Stations.
					
moveHelper(A,B,CNEW,L) :-   nextStation(L,A,B), 			% Next station is our Destination, same Line
				   	    	travelFare(L,Fb), 				% Get Travel Fare (Fb) of the Line
				  	    	FPRICE is Fb, 					% Fb is the Final Price (C - the Partial Price = our CNew)
				  	    	FPRICE =< CNEW.					% If Final Price is less than or equal to CNew, then yes.

moveHelper(A,B,CNEW,L) :-   nextStation(L,A,Ba), 			% Next station is not our Destination, same Line
				  	   		dif(Ba,B),	 					% Check if Destination and next Station are not the same
				  			travelFare(L,Fb), 				% Get Travel Fare (Fb) of the Line
					  		PPRICE is Fb, 					% The Partial Price is Fb
					  		DIFF is CNEW-PPRICE, 			% Diff is the Difference of CNew and the Partial Price
						  	DIFF > 0, 						% If Diff is positive, we can continue
				  			moveHelper(Ba,B,DIFF,L).		% checking with the remaining Stations.

moveHelper(A,B,CNEW,L) :-   nextStation(La,A,B), 			% Next station is our Destination, other Line
				  			dif(La,L),	 					% Check if Destination and next Station are not in the same Line
					  		entranceFare(La,Fa), 			% Get Entrance Fare (Fa) of the other Line 
					  		travelFare(La,Fb), 				% Get Travel Fare (Fb) of the other Line
					  		FPRICE is Fa+Fb, 				% The Final Price is (Fa+Fb)
					  		FPRICE =< CNEW.					% If Final Price is less than or equal to CNew, then yes.

moveHelper(A,B,CNEW,L) :-   nextStation(La,A,Ba), 			% Next station is not our Destination, other Line
				  			dif(Ba,B), 						% Check if Destination and next Station are not the same					
				  			dif(La,L),	 					% Check if Destination and next Station are not in the same Line
					  		entranceFare(La,Fa), 			% Get Entrance Fare (Fa) of the other Line 
					  		travelFare(La,Fb), 				% Get Travel Fare (Fb) of the other Line
					  		PPRICE is Fa+Fb, 				% The Partial Price is (Fa+Fb)
					  		DIFF is CNEW-PPRICE, 			% Diff is the Difference of CNew and the Partial Price
					  		DIFF > 0,						% If Diff is positive, we can continue
				  			moveHelper(Ba,B,DIFF,La).		% checking with the remaining Stations.


%-----------------------------------------------------------------------------------------

%-- ASKHSH 3

f(N,M,Y) :- N =< 0, Y = 0.						% Basic Case 1, N not positive, then Y=0.
f(N,M,Y) :- M =< 0, Y = 0.						% Basic Case 2, M not positive, then Y=0.
f(N,M,Y) :- N < M, Y = 0.						% Basic Case 3, N less than M, then Y=0.
f(N,M,Y) :- M = 1, Y = 1.						% Basic Case 4, M equal to 1, then Y=1.
f(N,M,Y) :- M = N, Y = 1.						% Basic Case 5, M equal to N, then Y=1.

f(N,M,Y) :- DIFF is N-M, 						% DIFF = N-M,
			J = M, 								% J = M,
			fHelper(DIFF,J,Y).					% Call fHelper (for anything else).
							
fHelper(DIFF,J,Y) :- J =:= 1, 					% if J =:= 1, 
				   	 f(DIFF,J,Y).				% call f.
							
fHelper(DIFF,J,Y) :- f(DIFF,J,Ya),				% If J =\= 1 (call f),
				     E is J-1, 					% decrease J by 1 (E=J-1) and then,
				   	 fHelper(DIFF,E,Yb), 		% recall fHelper, until J =:= 1,
				   	 Y is Ya+Yb.				% Final Y is Ya+Yb.



%-----------------------------------------------------------------------------------------

%-- ASKHSH 4

p(N) :- divisorFinder(N,N).

divisorFinder(N,K) :- K > 1, 						% searchs for divisors
		  N mod K =\= 0, 							% if it's not a divisor, continue searching
		  L is K-1, 								%
		  divisorFinder(N,L).						%
divisorFinder(N,K) :- K > 1, 						%
		  N mod K =:= 0, 							% if it is,
		  D is K-1, 								% call primeSqCheck
		  primeSqCheck(K,D), 						%
		  L is K-1, 								%
		  divisorFinder(N,L).						%
divisorFinder(N,1).									%

primeSqCheck(K,D) :- D > 1, 						% checks is the divisor found, 
		  SQ is D*D, 								% is the square of a prime
		  SQ =\= K, 								%
		  L is D-1, 								% 
		  primeSqCheck(K,L).						%
primeSqCheck(K,D) :- D > 1, 						%
		  SQ is D*D, 								%
		  SQ =:= K, 								%
		  compositeChecker(D), 						% check if D is actually a composite
   		  L is D-1, 								%
  		  primeSqCheck(K,L).						%
primeSqCheck(K,1).

compositeChecker(N) :-  N > 1, 						% Takes a number greater than 1,
		 				K is N-1, 					% and checks if its composite,
		 				compositeFinder(N,K).		% by calling compositeFinder.

compositeFinder(N,K) :- K > 1, 						% 
		  				N mod K =\= 0, 				% Checks if a number is composite,
		  				L is K-1, 					% if it is then it returns yes.
		  				compositeFinder(N,L).		% 
compositeFinder(N,K) :- K > 1, 						% if it's a prime, it returns no
		  				N mod K =:= 0.				% and stops.



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
