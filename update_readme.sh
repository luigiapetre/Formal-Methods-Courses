ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
#brew install ghi
echo "# Formal-Methods-Courses" > README.md
echo "Here we collect worldwide courses teaching formal methods" >> README.md
ghi list | grep -io '[0-9][0-9]*' | xargs -n1  ghi show > tmp.txt
cat tmp.txt | sed 's/Course code, if applicable:/* Course code, if applicable:/g' | sed 's/University hosting the course:/* University hosting the course:/g' | sed 's/Contact person:/* Contact person/g' | sed 's/Concepts taught:/* Concepts taught:/g' | sed 's/Tools used:/* Tools used:/g' | sed 's/Webpage:/* Webpage:/g' | sed 's/Year\/Level:/* Year\/Level:/g' | sed 's/@.*//' | sed 's/#[0-9][0-9]*:/# /g' | sed 's/\]//'  | sed 's/\[/    * Country: /g' | sed 's/1 comment://' | sed 's/⁕ labeled by //' | sed 's/    \*/\*/g' | sed '/^$/d' | sed 's/#/\'$'\n ##/g' >> README.md
rm tmp.txt
