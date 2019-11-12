set @concept7_id = (select concept_id from concept_name where name = "Monthly Clinical Examination Log for the all-oral STR" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED");
call add_concept_set_members((select concept_id from concept_name where name = "All Observation Templates" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED"), @concept7_id, 25);
