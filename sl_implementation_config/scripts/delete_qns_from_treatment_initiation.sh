set -x 

password="password"

ti_new_treatment_eligibility=(
				"TI, Eligible for new drugs"
				"TI, Date of eligibility for new drugs"
				"TI, Indication for new TB drugs"
				"TI, What is the situation of the patient?"
				"TI, Additional comments (on why the patient is being started on new TB drugs)"
				"TI, Has the Treatment with New Drugs Consent Form been explained and signed"
)

ti_treatment_initiation_details=(
				"Facility patient ID"
				"TI, Type of treatment regimen"
				"TI, First line drug regimen type"
				"TI, Second line regimen drug type"
				"TI, Reason for not starting treatment"
				"TI, Date of death before treatment start"
				"RETURN VISIT DATE"
				"TI, Reason for next assessment"
				"TI, Other assessment reason"
)

delete_ti_new_treatment_eligibility() {
						for item in "${ti_new_treatment_eligibility[@]}";
                                                do
                                                mysql -uroot -p$password openmrs -e "delete from concept_set where concept_id=(select concept_id from concept_name where name='$item') and concept_set=(select concept_id from concept_name where name='TI, New treatment eligibility');"
                                        done

}

delete_ti_new_treatment_eligibility() {
                                                mysql -uroot -p$password openmrs -e "delete from concept_set where concept_id=(select concept_id from concept_name where name='TI, Pregnancy') and concept_set=(select concept_id from concept_name where name='Treatment Initiation Template');"

}

delete_ti_treatment_initiation_details() {
						for item in "${ti_treatment_initiation_details[@]}";
                                                do
                                                mysql -uroot -p$password openmrs -e "delete from concept_set where concept_id=(select concept_id from concept_name where name='$item') and concept_set=(select concept_id from concept_name where name='TI, Treatment initiation details');"
                                        	done


}

delete_ti_new_treatment_eligibility
delete_ti_treatment_initiation_details
