import re

def getWords(sentence, letter):
	#str_regex = r"\b" + re.escape(letter) + r"\w+|\b\w+" + re.escape(letter) + r"\b"
	#str_regex = r"(\b[\S&&[^t]]\S*t\b)|(\bt\S*[\S&&[^t]]\b)" 

	print(str_regex)
	return re.findall(str_regex, sentence, re.I)

def extractFloats(s):
	return re.findall(r"[-+]?\d*\.\d+", s, re.I)

def main():
	s = "The tires can tolerate temperatures between -32.5 and 110. That why they cost 149.95 dollars each."
	print(s)
	res = extractFloats(s)
	print("Result: ", res)

	t = "The TART program runs on Tuesdays and Thursdays, but it does not start until next week."
	res = getWords(t, "t")
	print ("Result: ", res)

if __name__ == "__main__":
	main()


#(^(\bT\w+t))?((\bt\w+)|(\b\w+t\b))