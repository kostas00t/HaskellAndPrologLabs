-- TSAMPIRAS KONSTANTINOS (4508)
-----------------------------------------------------------------------------------------

-- ASKHSH 1

count :: Integer -> Int
count n = 
	if n < 0 -- if negative, make positive
		then count(-n)
	else if n <= 9 && (n == 0 || n == 3 || n == 6 || n == 9) 
		then 1
	else if n <= 9 && (n == 1 || n == 2 || n == 4 || n == 5 || n == 7 || n == 8)
		then 0
	else count (n `div` 10) + count (n `mod` 10)


-----------------------------------------------------------------------------------------
     
-- ASKHSH 2

kgcd :: Int->Int->Int->Int
kgcd m n k 
    | m <= n 
        = searchKthGCD m n m k
    | otherwise
        = searchKthGCD n m n k    
searchKthGCD :: Int -> Int -> Int -> Int -> Int
searchKthGCD m n i k =
    if (m `mod` i) == 0 && (n `mod` i) == 0 && k > 1 && i == 1 -- kth gcd not found 
        then 0    
    else if (m `mod` i) == 0 && (n `mod` i) == 0 && k == 1 -- kth gcd found
        then i
    else if (m `mod` i) == 0 && (n `mod` i) == 0 && k > 1 && i /= 1 -- found a gcd, not the one I'm looking for
        then searchKthGCD m n (i-1) (k-1)
    else searchKthGCD m n (i-1) k -- not a gcd


-----------------------------------------------------------------------------------------
     
-- ASKHSH 3

seconds :: (Int,Int)->(Int,Int,Int)->Int
seconds (d,mm) (h,m,s) = 
	if (mm < 1 || mm > 12) --check for valid month value
		then -1
	else if ((mm == 1 || mm == 3 || mm == 5 || mm == 7 || mm == 8 || mm == 10 || mm == 12) && (d < 1 || d > 31)) --check for valid day-month combination
		then -1
	else if ((mm == 4 || mm == 6 || mm == 9 || mm == 11) && (d < 1 || d > 30)) --check for valid day-month combination
		then -1
	else if (mm == 2 && (d < 1 || d > 28)) --check for valid day-month combination
		then -1
	else if (h > 23 || h < 0 || m > 59 || m < 0 || s > 59 || s < 0) --check for valid time value
		then -1
	else validDate (d,mm) + validTime (h,m,s) -- checks passed, calculate seconds 

validDate :: (Int,Int) -> Int
validDate (d,mm)
	| mm==1 = d*x - x		--days passed on Jan minus the date entered
	| mm==2 = 31*x + d*x - x		--days passed on Feb plus 31 full days from Jan minus the date entered
	| mm==3 = 28*x + 31*x + d*x - x			-- and so on
	| mm==4 = 28*x + 2*(31*x) + d*x - x
	| mm==5 = 30*x + 28*x + 2*(31*x) + d*x - x
	| mm==6 = 30*x + 28*x + 3*(31*x) + d*x - x
	| mm==7 = 2*(30*x) + 28*x + 3*(31*x) + d*x - x
	| mm==8 = 2*(30*x) + 28*x + 4*(31*x) + d*x - x
	| mm==9 = 2*(30*x) + 28*x + 5*(31*x) + d*x - x
	| mm==10 = 3*(30*x) + 28*x + 5*(31*x) + d*x - x
	| mm==11 = 3*(30*x) + 28*x + 6*(31*x) + d*x - x
	| mm==12 = 4*(30*x) + 28*x + 6*(31*x) + d*x - x
		where x = 24*60*60 -- 1 day = 24 hours*60 minutes/hour*60 seconds/minute

validTime :: (Int,Int,Int) -> Int
validTime (h,m,s) = 
	s + m*60 + h*60*60



-----------------------------------------------------------------------------------------
     
-- ASKHSH 4

sumfab :: (Int->Int->Int->Int)->Int->Int->Int
sumfab f a b = sumfab' f a a b 

sumfab' :: (Int -> Int -> Int -> Int) -> Int -> Int -> Int -> Int
sumfab' f a k b =
	if k == b -- step k, from a to b, if I reached b stop, else continue till I reach b
		then f a k b
	else sumfab' f a (k+1) b + f a k b 


-----------------------------------------------------------------------------------------
    