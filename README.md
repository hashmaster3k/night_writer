# Night Writer Program Project

#### What is this?
This is a simple english to braille and back to english translator.

#### How does it work?
In the texts folder, you will find 'message.txt' file. Open the file and enter the desired message to be change into braille. Run the following code in terminal from the main program directory.
```
#ruby ./lib/runner.rb message.txt braille.txt

```
This will create a new file called 'braille.txt' along with the translated message inside. To convert 'braille.txt' message back into english, run the following in terminal:
```
#ruby ./lib/runner.rb braille.txt original_message.txt
```
Yet another file called 'original_message.txt' is created with the same text as 'message.txt'.

#### Limitations
- Currently, the program only runs on lowercase letters as well as basic punctuation (! , . ? '). The program will not translate:

  - capital letters
  - numbers
  - contractions


- The program will only accept 'message.txt' as the first argument in terminal to translate from. From there, the naming of the other files will not matter as long as they match.
