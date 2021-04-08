#Github PAT
echo -n "Enter Github PAT: "
read token

# get random job-name
name=$(curl -s "https://random.justyy.workers.dev/api/random/?n=10&x=0" | cut -d'"' -f 2)
echo "Job name: $name"

echo -n -e "$ "
read command

curl -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $token" \
https://api.github.com/repos/tsadarsh/ucli/actions/workflows/7256091/dispatches \
-d "{\"ref\":\"main\",\"inputs\":{\"name\":\"$name\",\"command\":\"$command\"}}"

echo -n "Running."
id=''
timeout=15
while [ -z "$id" ]; do
	id=$(curl -s -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $token" \
	https://api.github.com/repos/tsadarsh/ucli/actions/artifacts | jq '.artifacts' | jq '.[]' | jq 'if .name == "'$name'" then .id else empty end'
)
	sleep 1
	echo -n '.'
	if [[ "$timeout" -le 0 ]]; then
		echo "Timed out...Retry Later"
		exit
	fi
	((timeout--))
done
echo "Job completed"

artifact_download_url=$(curl -s -I -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $token" \
https://api.github.com/repos/tsadarsh/ucli/actions/artifacts/$id/zip | grep location | awk {'print $2'})

wget -nv -O $name.zip "$artifact_download_url"

unzip -c "$name.zip" | less
rm "$name.zip"
