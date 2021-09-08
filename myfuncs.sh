function hw() {
	vim ~/.mybin/vimHelp
}

function h {
    echo    "⌘ + d: 垂直分屏"
    echo    "⌘ + shift + d: 水平分屏。"
    echo    "⌘ + ]和⌘ + [在最近使用的分屏直接切换."
    echo    "⌘ + opt + 方向键切换到指定位置的分屏"
    echo    "⌘ + 数字: 切换标签页"
    echo    "⌘ + 方向键 按方向切换标签页。"
    echo    "shift + ⌘ + s: 保存当前窗口快照。"
    echo    "⌘ + opt + b: 快照回放。很有意思的功能，你可以对你的操作根据时间轴进行回放。可以拖动下方的时间轴，也可以按左右方向键"
	  echo    "ctrl + o 返回上次的缓存文件"
	cat ~/.mybin/vimHelp
}

function ff {
	source ~/.bash_profile
	source ~/.zshrc
}
function ffs {
	source ~/.myfuncs.sh
}

function newfunc {
	vim ~/.myfuncs.sh
}

function proxy {
	export http_proxy="http://127.0.0.1:1087"
	export https_proxy="http://127.0.0.1:1087"
}

function unproxy {
	unset http_proxy
	unset https_proxy
}

function lsofi {
	lsof -i:$1
}

function pi {
	ssh pi@118.25.13.120 -p 1235 -o ServerAliveInterval=30
}

function loopurl {
	for ((i=1;i<=$1;i++)); 
	do   
		curl -v --header "Connection: keep-alive" $2;
		echo $2
	done
}

function showMe {
	git log --author=$user --pretty=tformat: --numstat | awk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added-lines: %s removed-lines : %s total-lines: %s\n",add,subs,loc }' -
}

function ios {
	xcrun instruments -w A9B40433-90ED-4F3F-A1D9-71E3CF4839A7
}

function showAll {
	alluser=$(git log --format='%aN' | sort -u)
	while read -r user
	do 
		a="$user --- $(git log --author=$user --pretty=tformat: --numstat | awk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added-lines: %s removed-lines : %s total-lines: %s\n",add,subs,loc }' -)"
		# echo $a | awk '{printf "%-30s%-15s %-20s \n", $1,$2}'
		echo $a
	done
}

function blog {
	open "https://www.yuque.com/yunfengsay/hdensz"

}

function killport {
	echo "killing $1"
	echo "running kill -9 $(lsof -t -i:$1)"
	kill -9 $(lsof -t -i:$1)
	echo "done"
	# lsof -i:$1 | awk 'NR==1 {next} {print $2 }'
}

function posttolog {
	data=$(echo $(cat $1))
  curl -X POST \
  https://faas-preview.pre-fx.alibaba-inc.com/api/writelog \
  -H 'cache-control: no-cache' \
  -H 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
  -H 'postman-token: 93d6836c-1aeb-9073-2333-5f376fe389b3' \
  -F data="{\"data\": $data}"
}

function timer {
	timegap=$1
	shift
	while true
	do
		$@ 
		sleep $timegap;
		now=$(date +"%T") 
		echo ""
		echo "------ $now -----"
	done
}


function analizeCode {
	giturl=$1
	repoName=$(basename $giturl)
	mkdir -p ~/.codeTmp 
	tmpName=~/.codeTmp/$repoName
	git clone $giturl $tmpName || echo $tmpName 已下载过 && true
	cd $tmpName
	find ./src -name "*.ts" | xargs cat > all.ts
	statements=('if (' 'for (' '.map' '.filter' 'return ' '? ' '=')		
	for element in ${statements[@]}
	do
		echo $element
		mkdir -p ./analized
		f=./analized/$element.statement
		echo ''> $f
		grep -nrw $element ./src > $f
	done
}

function gitFindAll {
	git log -S $1 --source --all -p
}

function note {
	vim ~/mynote
}

function newhs {
	filepath=$1.hs
	touch $filepath 
	chmod +x $filepath
	echo "#!/usr/local/bin/runhaskell" >> $filepath 
}

function json2ts {
	json=$(pbpaste -Prefer text)
	code=$(cat <<- EOF
		const interfaceDefinition = require('json-to-ts-interface');
		const res = interfaceDefinition($json, {})
		console.log(res)	
		EOF
	)
	node -e $code
}
database=$(dirname $0)/database
function db_set {
	echo "$1,$2" >> database
}

function db_get {
	grep "^$1," database | sed -e "s/^$1,//" | tail -n 1
}

gitfirst() {
	branch=refs/heads/master
	git log --reverse --pretty=%H $branch | head -1 | xargs git checkout
}
gitnext() {
	branch=`git symbolic-ref refs/remotes/origin/HEAD`
	if [ -z "$1" ]; then
		n=1
	else
		n=$1
	fi
	git log --reverse --pretty=%H $branch | grep -A $n $(git rev-parse HEAD) | tail -1 | xargs git checkout
}
gitprev() {
	branch=`git symbolic-ref refs/remotes/origin/HEAD`
	if [ -z "$1" ]; then
		n=1
	else
		n=$1
	fi
	git checkout HEAD~$n 
}
gitlast() {
	branch=`git symbolic-ref refs/remotes/origin/HEAD`
	git log --pretty=%H $branch | head -1 | xargs git checkout
}

screenToIOS() {
 screencapture -i /tmp/screencapture.png && xcrun simctl addmedia $(xcrun simctl list | grep Booted | awk -F '[()]+' '{print $2}') /tmp/screencapture.png
}

watchClipboard() {
	oldvalue=null
	while true 
	do
		if [[ $oldvalue != $(clipboard) ]]; then
    $@
		oldvalue=$(clipboard)
		sleep 1	
		fi	
	done
}
