# bin/bash

echo "Creating new project files, please enter the following information:"
read -p "Enter a new project name: " project
echo "Initializing new project ${project}."

cp ./xsl/test.xsl ./xsl/"${project}".xsl
cp -r ./xsl/test_project ./xsl/"${project}"

if [ -f ./xsl/"${project}.xsl" ]; 
    then
        echo "${project}.xsl file in sub directory ./xsl created"
    else
        echo "project file not found"
fi

if [ -d ./xsl/"${project}" ]; 
    then
        echo "./${project} directory in sub directory ./xsl created"
    else
        echo "project directory not found"
fi

echo "done"
