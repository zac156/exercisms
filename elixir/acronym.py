test_string = 'HyperText Transfer Protocol'

output = ''
word_boundary = True

for char in test_string:
    if char == ' ':
        word_boundary = True
        continue

    if word_boundary:
        output += char
        word_boundary = False
        continue

    if char.isupper():
        output += char
        continue

print output