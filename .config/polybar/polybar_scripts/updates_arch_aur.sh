if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi


if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
# if ! updates=$(cower -u 2> /dev/null | wc -l); then
# if ! updates=$(trizen -Su --aur --quiet | wc -l); then
# if ! updates=$(pikaur -Qua 2> /dev/null | wc -l); then
# if ! updates=$(rua upgrade --printonly 2> /dev/null | wc -l); then
    updates_aur=0
fi

updates=$((updates_arch + updates_aur))
echo $updates_aur
echo $updates_arch


if [ "$updates" -gt 0 ]; then
    echo "$updates" 
else
    echo ""
fi
