#!/bin/bash
repo=$1
if [$1 == ];
then
echo "invalid"
exit 1  
fi

arr=(${repo//:/ })
repopath=${arr[1]}
arr2=(${repopath//.git/ })
finalpath=${arr2[0]}
echo ${finalpath}
arr3=(${finalpath//// })
repouser=${arr3[0]}
reponame=${arr3[1]}
echo ${reponame}

rm -f ${repouser}.tar.gz
rm -rf ${finalpath}
git clone ${repo} ${finalpath}
tar zcvf ${repouser}.tar.gz ${repouser}
