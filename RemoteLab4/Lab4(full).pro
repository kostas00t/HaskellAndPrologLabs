%% TSAMPIRAS KONSTANTINOS (4508)
%-----------------------------------------------------------------------------------------

%-- ASKHSH 1

...(N,M,K,L) :- N =:= 0,				% if N==0 then 
				L = []. 				% return an empty list
...(N,M,K,L) :- COUNTER is N-1, 		% else, set COUNTER = N-1
				I is M+K, 				% set I = M + K
				L = [M|TAIL], 			% List with head M and TAIL
				...(COUNTER,I,K,TAIL).	% recall for the rest.


%-----------------------------------------------------------------------------------------

%-- ASKHSH 2

common(X,Y,L) :- commonHelper(X, Y, L, 1).								% Call the commonHelper with parameter Index=1
commonHelper([],[],L,Index) :- L = [].									% if I'm done with both lists X and Y, return an empty list
commonHelper([],Y,L,Index) :- L = [].									% if I'm done with list X, return an empty list
commonHelper(X,[],L,Index) :- L = [].									% if I'm done with list Y, return an empty list
commonHelper([Ha|Ta],[Ha|Tb],L,Index) :- L = [Index|T], 				% else if lists X and Y have the same head, add Index to L 
								   		 Index2 is Index+1, 			% Index++
								   		 commonHelper(Ta,Tb,T,Index2).	% recall commonHelper with parameters the tails of X and Y, L=(Tail of L)=T and Index++
commonHelper([Ha|Ta],[Hb|Tb],L,Index) :- Index2 is Index+1, 			% else if lists X and Y have not the same head, Index++
								   		 commonHelper(Ta,Tb,L,Index2).	% recall commonHelper with parameters the tails of X and Y, L and Index++


%-----------------------------------------------------------------------------------------

%-- ASKHSH 3

freq(L,S) :- freqHelper(L,S).

freqHelper([],[]).
freqHelper(L,LO) :- msort(L,LS),
    				freq2(LS,LS,[],LO).
    				
freq2([],_,L,L).
freq2([H|T],LI,LT,L) :- member(_*H,LT), 
						!,
    					freq2(T,LI,LT,L).
freq2([H|T],LI,LT,L) :- findall(I,nth0(I,LI,H),LO),
    					length(LO,N),
    					append(LT,[N*H],L1),
    					freq2(T,LI,L1,L).

%-----------------------------------------------------------------------------------------

%-- ASKHSH 4


count(L,C) :- countHelperA(L,0,C). 								% call countHelperA
		
countHelperA([],K,C) :- C=K.									% if list empty, return counters' value
countHelperA([Ha],K,C) :- C=K.									% if list has only 1 item, return counters' value
countHelperA([Ha,Hb|T],K,C) :-  A is Hb*2, 						% else set A=2*Hb
						 		Ha > A, 						% if Ha>A=2*Hb
						 		L is K+1, 						% L=K+1
						 		countHelperB([Ha|T], L, Ca), 	% call countHelperB to check if Ha greater than doubled values of the remaining list
						 		countHelperA([Hb|T], Ca, C).	% call countHelperA with the next item on the list, pass the current count value
countHelperA([Ha,Hb|T],K,C) :-  A is Ha*2, 						%
						 		Hb > A, 						% same but with Hb>2*Ha
						 		L is K+1, 						%
								countHelperB([Ha|T], L, Ca), 	%
								countHelperA([Hb|T], Ca, C).	%
countHelperA([Ha,Hb|T],K,C) :-  A is Hb*2, 						% 
							    Ha =< A, 						% if Ha=<A, just continue, don't touch the counter
							    countHelperB([Ha|T], K, Ca), 	%
							    countHelperA([Hb|T], Ca, C).	%
countHelperA([Ha,Hb|T],K,C) :-  A is Ha*2, 						%
						 		Hb =< A, 						% same but with Hb=<2*Ha
						 		countHelperB([Ha|T], K, Ca),	%
						 		countHelperA([Hb|T], Ca, C).	%

countHelperB([],K,C) :- C=K.									% if list empty, return counters' value
countHelperB([Ha],K,C) :- C=K.									% if list has only 1 item, return counters' value
countHelperB([Ha,Hb|T],K,C) :-  A is Hb*2, 						% the same logic with countHelperA, but for the remaining values of the list (Tail)
						 		Ha > A, 						% if Ha>A=2*Hb
								L is K+1, 						% L=K+1
								countHelperB([Ha|T], L, C).		%
countHelperB([Ha,Hb|T],K,C) :-  A is Ha*2, 						%
						 		Hb > A, 						% same but with Hb>2*Ha
						 		L is K+1, 						% 
						 		countHelperB([Ha|T], L, C).		%
countHelperB([Ha,Hb|T],K,C) :-  A is Hb*2, 						%
						 		Ha =< A, 						% if Ha=<A, just continue, don't touch the counter
						 		countHelperB([Ha|T], K, C).		%
countHelperB([Ha,Hb|T],K,C) :-  A is Ha*2, 						%
						 		Hb =< A, 						% same but with Hb=<2*Ha
						 		countHelperB([Ha|T], K, C).		%
