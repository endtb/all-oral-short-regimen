#/bin/sh

set -x 

password="password"

followup_clinical_examination=(
				"Pulse"
				"Respiratory rate"
				"Followup, Currently Pregnant"
				"Followup, Pregnancy form case ID number"
)

delete_qns_followup_clinical_examination() {
                                         for item in "${followup_clinical_examination[@]}";
                                        do
                                                 mysql -uroot -p$password openmrs -e "delete from concept_set where concept_id=(select concept_id from concept_name where name='$item' and concept_name_type='FULLY_SPECIFIED') and concept_set=(select concept_id from concept_name where name='Followup, Clinical Examination');"
                                        done

}

mysql -uroot -p$password openmrs -e "delete from concept_set where concept_id=(select concept_id from concept_name where name='Followup, Colorblindness Screen Result' and concept_name_type='FULLY_SPECIFIED') and concept_set=(select concept_id from concept_name where name='Followup, Colorblindness Screen');"

delete_qns_followup_clinical_examination
