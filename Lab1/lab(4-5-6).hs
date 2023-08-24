-- TSAMPIRAS KONSTANTINOS
g :: Double -> Double -> Integer
g a b
	| sqrt(3-sin(a)-cos(b)) < 1.75 && b > 0 = ceiling(abs(1/a)**(a*b))
	| otherwise = floor(b^3-2*a+3*a^3*b+8)

prd :: Integer -> Integer
prd n = 
	if n <= 9 && n `mod` 2 == 1 
		then n
	else if n <= 9 && n `mod` 2 /= 1 
		then 1 
	else prd (n `div` 10) * prd (n `mod` 10)