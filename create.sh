# prepare setup information
read -p "please provide the new project's name: " artifactId
[ -z "$artifactId" ] && echo "cannot proceed without a project name" && exit 0
groupId=io.rjuelich.learn.java3d

# create archetype in local target folder
mvn clean archetype:create-from-project 

# install archetype in local catalogue
( cd target/generated-sources/archetype ; mvn clean install )

# create new project
( cd .. ; mvn archetype:generate -B -DarchetypeGroupId=${groupId} -DarchetypeArtifactId=jmonkey-template-archetype -DarchetypeVersion=1.0-SNAPSHOT -DgroupId=${groupId} -DartifactId=${artifactId} -Dversion=1.0-SNAPSHOT -Dpackage=${groupId} )

# clean up
rm ../${artifactId}/create.sh
rm ../${artifactId}/.classpath
rm ../${artifactId}/.project
rm -Rf ../${artifactId}/.settings

rm ../${artifactId}/README.MD
mv ../${artifactId}/artifact-readme.md ../${artifactId}/README.MD
