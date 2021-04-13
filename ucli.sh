# User's Github PAT
echo -n "Enter Github PAT: "
read token

# Get command to ezecute
echo -n -e "$ "
read command

number=$(curl -s -H "Authorization: token $token" https://api.github.com/repos/tsadarsh/ucli/issues \
-d "{\"title\":\"$command\"}" | jq '.number')

echo -n "Running."
state="open"
timeout=15
while [ "$state" != "closed" ]; do
	state=$(curl -s -H "Accept: application/vnd.github.v3+json" -H "Authorization: token $token" \
	https://api.github.com/repos/tsadarsh/ucli/issues/$number | jq '.state' | cut -d '"' -f 2)

	sleep 1
	echo -n '.'
	if [[ "$timeout" -le 0 ]]; then
		echo "Timed out...Retry Later"
		exit
	fi
	((timeout--))
done
echo "Job completed"

curl -s -g http://52.186.148.162 | less
echo "JOB NUMBER: $number"
