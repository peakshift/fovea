# -*- coding: utf-8 -*-

# Translitteration of a bulgarian letter to a latin letter
#
# @param letter {string} - s cylyric letter to look up 
# to transform it to a corresponding latin one. 
# We transform the strings that gets passed to unicode as 
# capital cylyric letters do not get lowered if 
# the string lower() method is used unless we convertd the  
# strings to unicode data types. 

def romanise(letter):
	bulgarian_alphabet = {
		u"а": "a", 
		u"б": "b", 
		u"в": "v", 
		u"г": "g", 
		u"д": "d", 
		u"е": "e", 
		u"ж": "zh", 
		u"з": "z", 
		u"и": "i", 
		u"й": "y", 
		u"к": "k", 
		u"л": "l", 
		u"м": "m", 
		u"н": "n", 
		u"о": "o", 
		u"п": "p", 
		u"р": "r", 
		u"с": "s", 
		u"т": "t", 
		u"y": "u", 
		u"ф": "f", 
		u"х": "kh", 
		u"ц": "ts", 
		u"ч": "ch", 
		u"ш": "sh", 
		u"щ": "sht", 
		u"ъ": "u", 
		u"ь": "'", 
		u"ю": "yu", 
		u"я": "ya",
	}

	unicode_letter = letter.decode('utf-8')
	lowercase_letter = unicode_letter.lower()
	print(bulgarian_alphabet[lowercase_letter])

romanise("Ю") # expects yu
romanise("ю") # expects yu
romanise("ж") # expects zh
romanise("х") # expects kh