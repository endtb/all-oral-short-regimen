#!/bin/bash

set -x 

password="password"

lab_hematology_template=(

				"Lab, Hematocrit"
				"Lab, Mean Red Blood Cell volume"
				"Lab, WBC"
				"Lab, lymphocytes"
				"Lab, Absolute neutrophil count"
				"Lab, Neutrophils"
				"Lab, Erythrocyte sedimentation rate"
				"Lab, Prothombon time"
				"Lab, INR"
				"Lab, Activated partial thromboplastin time"
)

lab_biochemistry_template=(
				"Lab, Potassium"
				"Lab, Magnesium"
				"Lab, Ionized Calcium"
				"Lab, Urea"
				"Lab, Uric Acid"
				"Lab, Creatinine"
				"Lab, Creatinine clearance"
				"Lab, Glucose"
				"Lab, Glucose (Fasting)"
				"Lab, HbA1c"
				"Lab, TSH"
				"Lab, Lipase"
				"Lab, ALT (SGPT)"
				"Lab, GGT"
				"Lab, Total Bilirubin"
				"Lab, Serum Albumin"
)

delete_lab_hematology_template() {
                                for item in "${lab_hematology_template[@]}";
                                        do
                                                 mysql -uroot -p$password openmrs -e "delete from concept_set where concept_id=(select concept_id from concept_name where name='$item') and concept_set=(select concept_id from concept_name where name='Lab, Haematology');"
                                        done
}

delete_lab_biochemistry_template() {
                                for item in "${lab_biochemistry_template[@]}";
                                        do
                                                 mysql -uroot -p$password openmrs -e "delete from concept_set where concept_id=(select concept_id from concept_name where name='$item') and concept_set=(select concept_id from concept_name where name='Lab, Biochemistry');"
                                        done
}


delete_lab_hematology_template
delete_lab_biochemistry_template
