echo '\n\n requesting all heroes'
curl localhost:3000/heroes

echo '\n\n requesting flash'
curl localhost:3000/heroes/1

echo '\n\n requesting with wrong body'
curl --silent -X POST \
    --data-binary '{"invalid": "data"}' \
    localhost:3000/heroes

echo '\n\n creating Eric Johnson'
CREATE=$(curl --silent -X POST \
    --data-binary '{"name": "Eric Johnson", "age": 56, "power": "Powerful Ears"}' \
    localhost:3000/heroes)

echo $CREATE

ID=$(echo $CREATE | jq .id)

echo '\n\n requesting chapolin'
curl localhost:3000/heroes/$ID