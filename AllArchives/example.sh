#!/bin/tcsh

set out = "~/Desktop/Process.txt"

set dirs = (\
transmart-core-api \
transmart-core-db \
Rmodules \
transmart-legacy-db \
folder-management-plugin \
transmart-extensions \
transmart-gwas-plugin \
blend4j-plugin \
transmart-metacore-plugin \
transmartApp \
transmart-data \
tranSMART-ETL \
transmart-batch \
transmart-ICE \
transmart-rest-api \
RInterface \
GWAVA \
transmart-test \
)

echo "Mapping Command . . ." > $out

foreach dir ($dirs)
	pushd $dir
		echo "" >> $out
		echo "++ $dir ++" >> $out
		echo "++ $dir ++"
# -------------- actual commands
        git checkout release-1.2.5-Beta >> $out
		git commit -a -m "created tags for release" >> $out
        git push >> $out
		git status >> $out
# -------------- actual commands		
		echo "-- $dir --" >> $out
	popd
end

echo "DONE!"

# various log options
# git log --pretty=oneline v1.2.4...HEAD >> $out
# git log --pretty=full v1.2.4...HEAD >> $out
# git shortlog -s -n --all v1.2.4...HEAD >> $out

# various checking commands
# git status >> $out

# initial clone
# git clone git@github.com:tranSMART-Foundation/{$dir}.git >> $out

# to set remote = transmart
# git remote add transmart git@github.com:transmart/{$dir}.git >> $out

# to check diff with remote = transmart - already defined
#		git fetch transmart
#		git diff --name-only transmart/master >> $out

# create release branch (original)
#		git checkout -b release-1.2.5-Beta
#		git push -u origin release-1.2.5-Beta

# create release branch (incremental)
#		git fetch origin
#		git checkout -b release-1.2.5-Beta origin/release-1.2.5-Beta
