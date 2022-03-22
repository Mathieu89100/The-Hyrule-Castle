#!/bin/bash
function basic_ch {
echo " Ma liste de personnage : \n  "

while IFS=',' read -r id_player name hp mp str int def res spd luck race class rarity; do

    if [[ "$id_player" -ne "id"  ]]; then
    
    
    name_class="class vide" 
    
    while IFS=',' read -r id_c name_c strength_c weakess_c attack_type_c alignment_c rarity_c;do

	#echo " comparaison $class et $id_c"
	
	if [[ "$class" = "$id_c" ]]; then
	  	    
            name_class=$name_c
	   # echo " $name_class est trouvé "
	    
	  # echo "pas de class trouvé "
	fi
    done < classes.csv
    #echo " $name_class"
    
    
    while IFS=',' read -r id_r name_r strength_r weakness_r rarity_r;do
	 if [[ "$race" = "$id_r" ]]; then
	     a=$name_r
	 fi
	 done < races.csv
        echo "$id_player $name $a $name_class"
   else 
       echo "id nom race class  "
    fi

    

done < players.csv
}
while :
do
    echo "COMBAT"
	read combat
	case $combat in
	            p) echo "PERSONNAGE"
		       read choix_de_personnage
		       case $choix_de_personnage in
			   l) echo "nom et classe de personnage"
			      basics=$(basic_ch)
			      echo "$basics"

		       esac
		       ;;
		    q) echo "Jeux arrêté" ; echo ; exit o
	esac
done
