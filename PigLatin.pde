int space;
public void setup() 
{
	String[] lines = loadStrings("LowellHymn.txt");
	String currentLine = lines[0];
	ArrayList<String> words = new ArrayList<String>();
	ArrayList<String> word = new ArrayList<String>();
	for (int j = 0 ; j < currentLine.length(); j++) 
	{
	  if ( currentLine.charAt(j) != ' ' && currentLine.charAt(j) != ',' ) 
	  	word.add(currentLine.charAt(j));
	  else {
	  	words.add(word);
	  	word.clear();
	  }

	}
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
	println(words);
}
public void draw() {}

public void separate() {}

//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
public int findFirstVowel(String sWord) {
  for (int i = 0 ; i < sWord.length(); i++) 
    if ( sWord.charAt(i) == 'a' || sWord.charAt(i) == 'i' || sWord.charAt(i) == 'u' || sWord.charAt(i) == 'e' || sWord.charAt(i) == 'o')
      return(i);
  return -1;
}

//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
public String pigLatin(String sWord) {
	if ( findFirstVowel(sWord) == -1 )
		return sWord + "ay";
	else if ( findFirstVowel(sWord) == 0 )
		return sWord + "way";
  else if ( sWord.substring(0, 2).equals("qu") )
    return sWord.substring(2, sWord.length()) + "quay";
  else
    return sWord.substring(findFirstVowel(sWord)) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
}
