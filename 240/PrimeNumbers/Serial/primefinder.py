# coding: utf-8
class PrimeFinder (object):
	def main(self):
		SRT = 1000000
		END = 2000000
		primes = []
		i = SRT
		count = 0
		while i < END:
			if (i%2 != 0):
				if self.isPrime(i):
					print(str(i) + " is prime!")
					primes.append(i)
					count += 1
				else:
					print(str(i))
			else:
				print(i)
			i += 1
		print(primes)
		print(str(count) + " prime numbers found.")
		
	def isPrime(self, x):
		count = 2
		while count < x:
			#print(count)
			if (x % count == 0 and count != x):
				return True
			count += 1
		return False

p = PrimeFinder()
p.main()