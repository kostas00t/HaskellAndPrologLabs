-- TSAMPIRAS KONSTANTINOS (4508)
-----------------------------------------------------------------------------------------

-- ASKHSH 1


nearest :: [Int]->Int->Int
nearest s n = indexFinder (delta s n) (minIntList (delta s n)) -- call indexFinder

delta :: [Int] -> Int -> [Int]	-- creates a list with the absolute differences for each value on the list with n
delta (h:t) n = abs(h-n):delta t n -- absolute difference of head and n, appends to a list, continue 
delta [] n = []					-- reached the end of the list, stop (append nothing and stop)

minIntList :: [Int] -> Int 		-- finds the minimum of a list (in our case, the list generated from delta)
minIntList (h:[]) = h 			-- when the tail is empty, returns as minimum the head
minIntList (h:t) = min h (minIntList t) -- compares till you find the minimum, then returns that value

indexFinder :: [Int] -> Int -> Int 	-- finds the index value of the minimum difference (in case of multiple 
indexFinder (h:t) n = 			-- equal minimum differences, we stop at the first instance we find)
	if h==n 					-- when you find the minimum, add 1 and stop
		then 1
	else 1 + indexFinder t n 	-- if you haven't find it yet, add 1 and continue


-----------------------------------------------------------------------------------------
     
-- ASKHSH 2

smooth :: [Int]->Int->[Int]
smooth s k = sumDivMaker s k 	-- call sumDivMaker
	
sumDivMaker :: [Int] -> Int -> [Int] -- calculates the average of those sums and adds them to a list
sumDivMaker (h:t) k =
	if (length t)+1 < k 		-- stop if the length of the list is less than k
		then []
	else if ((length t) >= k)   -- valid k, call sum' and divide k to find average, add it to a list
		then ((sum' (h:t) k) `div` k):(sumDivMaker t k)
	else ((sum' (h:t) k) `div` k):(sumDivMaker [] k) -- last avg calculation, stop list
sumDivMaker [] k = []			-- when the list is empty, returns an empty list

sum' :: [Int] -> Int -> Int 	-- finds the sum of the k first values on a list
sum' (h:t) k =
	if k <= 0 					-- add 0 to the sum, if k less or equal to 0
		then 0
	else h + (sum' t (k-1))		-- k positive, then add head value to the sum, call again with k-1
sum' [] k = 0					-- when the list is empty, add 0 and stop

-----------------------------------------------------------------------------------------
     
-- ASKHSH 3

swap :: String->String
swap s = joiner(swapper(spliter s)) -- call joiner, swapper and spliter 
	
spliter :: String -> [String] 		-- splits the string into substrings, with delimiter ' '
spliter [] = [""]						
spliter (h:t) = 
	if h == ' ' 					-- when you find a ' ', 
		then "":(spliter t)			-- stop the previous string and continue with the rest of the string
    else (h:head (spliter t)):tail (spliter t) -- no ' ', concatenate the characters

swapper :: [String] -> [String] 		
swapper (a:b:t) = b:a:swapper t 	-- swaps the 2 first strings, then continues with the next 2 and so on...
swapper (a:t) = a:swapper t 		-- if there's only one left, just append it
swapper [] = [] 					-- if there's none left, stop

joiner :: [String] -> String
joiner (h:[]) = h 					-- if it's the last string, just append it 
joiner (h:t) = h ++ " " ++ (joiner t) -- if it's not the last, add a space and continue with the next string


-----------------------------------------------------------------------------------------
     
-- ASKHSH 4

mapi :: [u]->(u->Int->v)->[v]
mapi s f = calculator s f 1 (length(s)) 	-- call calculator with: list s, function f, a counter starting from 1 and the size of list s 

calculator :: [u] -> (u -> Int -> v) -> Int -> Int -> [v] 	
calculator (h:t) f count size =				
    if count <= size						-- while I'm not at the end of the list, do: h (head value from the list) `function`...
        then (h `f` count):calculator t f (count+1) size -- ...count (1,2,3,...,size of the list) and recall calculator with count+1
    else []    								-- if count>size, stop
calculator [] f count size = [] 			-- when list empty, stop

