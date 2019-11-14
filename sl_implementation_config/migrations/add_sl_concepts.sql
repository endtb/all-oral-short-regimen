
-- Monthly Clinical Examination Log for the all-oral STR form
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
set @concept13_id = (select concept_id from concept_name where name = "Monthly Clinical Examination Log for the all-oral STR" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED");
call add_concept_set_members((select concept_id from concept_name where name = "All Observation Templates" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED"), @concept13_id, 25);

-- Answers to no recurrence on 6m PTO
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "6m PTO, If no recurrence", "If no recurrence", 'Coded', 'MISC', FALSE);
set @concept7_id = @concept_id;
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "6m PTO, Clinically without signs or symptoms of TB and culture negative", "No signs or symptoms of TB and culture negative", 'N/A', 'MISC', FALSE);
set @answerconcept8_id = @concept_id;
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "6m PTO, Clinically without signs or symptoms of TB and no culture done", "No signs or symptoms of TB and no culture done", 'N/A', 'MISC', FALSE);
set @answerconcept9_id = @concept_id;
call add_concept_answer (@concept7_id,@answerconcept8_id,1);
call add_concept_answer (@concept7_id,@answerconcept9_id,2);

-- Answers to recurrence on 6m PTO
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "6m PTO, If there is recurrence", "Recurrence", 'Coded', 'MISC', FALSE);
set @concept8_id = @concept_id;
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "6m PTO, Two positive cultures (taken on different days) irrespective of the presence of clinical signs or symptoms of TB", "Two positive cultures", 'N/A', 'MISC', FALSE);
set @answerconcept10_id = @concept_id;
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "6m PTO, One positive culture with clinical signs or symptoms or radiographic deterioration", "One positive culture", 'N/A', 'MISC', FALSE);
set @answerconcept11_id = @concept_id;
call add_concept_answer (@concept8_id,@answerconcept10_id,1);
call add_concept_answer (@concept8_id,@answerconcept11_id,2);

-- Addition to the 6MPTO from
delete from concept_set where concept_set = (select concept_id from concept_name where name = "6 month Post Treatment Outcome Template" and voided = 0 and locale = "en");

call add_concept_set_members((select concept_id from concept_name where name = "6 month Post Treatment Outcome Template"), (select concept_id from concept_name where name = "6m PTO, 6 month post treatment outcome date" and voided = 0 and locale = "en"), 0);
call add_concept_set_members((select concept_id from concept_name where name = "6 month Post Treatment Outcome Template"), (select concept_id from concept_name where name = "6m PTO, 6 month post treatment outcome" and voided = 0 and locale = "en"), 1);
call add_concept_set_members((select concept_id from concept_name where name = "6 month Post Treatment Outcome Template"), (select concept_id from concept_name where name = "6m PTO, If no recurrence" and voided = 0 and locale = "en"), 2);
call add_concept_set_members((select concept_id from concept_name where name = "6 month Post Treatment Outcome Template"), (select concept_id from concept_name where name = "6m PTO, Died" and voided = 0 and locale = "en"), 3);
call add_concept_set_members((select concept_id from concept_name where name = "6 month Post Treatment Outcome Template"), (select concept_id from concept_name where name = "6m PTO, If there is recurrence" and voided = 0 and locale = "en"), 4);
call add_concept_set_members((select concept_id from concept_name where name = "6 month Post Treatment Outcome Template"), (select concept_id from concept_name where name = "6m PTO, LTFU" and voided = 0 and locale = "en"), 5);
call add_concept_set_members((select concept_id from concept_name where name = "6 month Post Treatment Outcome Template"), (select concept_id from concept_name where name = "6m PTO, Not evaluated" and voided = 0 and locale = "en"), 6);

update concept_name set name = "Final post-treatment outcome" where voided = 0 and name = "6 month Post Treatment Outcome";
