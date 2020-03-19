# -*- coding: utf-8 -*-

def romanise(letter):
	"""Translitteration of a bulgarian letter to a latin letter.

	We transform the strings that gets passed to unicode, as
	capital cylyric letters do not get lowered if
	the string.lower() method is used, unless we convertd the
	strings to unicode data types first.

    Args:
        text (str): A cylyric letter to look up to transform it to a corresponding latin one.

    Returns:
        str: The corresponding latin letter if successul, otherwise the initial character

    """

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

	lowercase_letter = letter.lower()

	return bulgarian_alphabet[lowercase_letter] if lowercase_letter in bulgarian_alphabet else letter

def cyr_to_latin(text):
	"""Transform sentences that are in cyrillic into sentences using latin letters

	The words in the sentence are broken down into letters,
	each letter is converted to latin using the function romanise,
	and the letters are reformed into a whole sentence

    Args:
        text (str): The sentence to be converted

    Returns:
        str: Converted string is returned.

    """

	word_list = text.split()

	for index, word in enumerate(word_list):
		word_translation = "".join(romanise(x) for x in word)

		word_list[index] = word_translation

	return " ".join(str(text) for text in word_list)


# sentence = 'ТАКСА ЗА ВЪТРЕШНОБАНКОВ ПРЕВОДЕЛ'
# print(cyr_to_latin(sentence)) # taksa za vutreshnobankov prevodel
