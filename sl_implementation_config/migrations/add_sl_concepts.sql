call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "Monthly Clinical Examination Log for the all-oral STR", "Monthly Clinical Examination Log", 'N/A', 'MISC', TRUE);
set @concept1_id = @concept_id;
set @concept2_id = (select concept_id from concept_name where name = "Followup, Visit Date");
call add_concept_set_members((select concept_id from concept_name where name = "Monthly Clinical Examination Log for the all-oral STR"), @concept2_id, 1);
set @concept3_id = (select concept_id from concept_name where name = "Current month of treatment" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED");
call add_concept_set_members((select concept_id from concept_name where name = "Monthly Clinical Examination Log for the all-oral STR"), @concept3_id, 2);
set @concept4_id = (select concept_id from concept_name where name = "Followup, Clinical Examination");
call add_concept_set_members((select concept_id from concept_name where name = "Monthly Clinical Examination Log for the all-oral STR"), @concept4_id, 3);
set @concept5_id = (select concept_id from concept_name where name = "EKG, QTcF Interval" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED");
call add_concept_set_members((select concept_id from concept_name where name = "Monthly Clinical Examination Log for the all-oral STR"), @concept5_id, 4);
set @concept6_id = (select concept_id from concept_name where name = "Lab, Other test result" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED");
call add_concept_set_members((select concept_id from concept_name where name = "Monthly Clinical Examination Log for the all-oral STR"), @concept6_id, 5);