-- TSAMPIRAS KONSTANTINOS
f :: Float -> Float -> Integer
f x y = 
	if abs(x) < 1.2 || sin(x) > 0.5 
		then floor(x^2-2*x*y^2+5*y-3) 
	else ceiling(sqrt(x^2-cos(y))**(1/y))

val :: Integer -> Integer
val n
	| n <= 9 && n `mod` 2 == 1 = n
	| n <= 9 && n `mod` 2 /= 1 = 1  
	| otherwise = val (n `div` 10) * val (n `mod` 10)

