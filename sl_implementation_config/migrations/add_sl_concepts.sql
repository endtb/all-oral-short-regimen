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
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "6m PTO, no recurrence", "No recurrence", 'N/A', 'MISC', TRUE);
set @concept9_id = @concept_id;
call add_concept_set_members(@concept9_id,(select concept_id from concept_name where name = "6m PTO, If no recurrence"),0);


-- Answers to recurrence on 6m PTO
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "6m PTO, If there is recurrence", "Recurrence", 'Coded', 'MISC', FALSE);
set @concept8_id = @concept_id;
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "6m PTO, Two positive cultures (taken on different days) irrespective of the presence of clinical signs or symptoms of TB", "Two positive cultures", 'N/A', 'MISC', FALSE);
set @answerconcept10_id = @concept_id;
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "6m PTO, One positive culture with clinical signs or symptoms or radiographic deterioration", "One positive culture", 'N/A', 'MISC', FALSE);
set @answerconcept11_id = @concept_id;
call add_concept_answer (@concept8_id,@answerconcept10_id,1);
call add_concept_answer (@concept8_id,@answerconcept11_id,2);
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "6m PTO, Recurrence", "Recurrence", 'N/A', 'MISC', TRUE);
set @concept10_id = @concept_id;
call add_concept_set_members(@concept10_id,(select concept_id from concept_name where name = "6m PTO, If there is recurrence"),0);

-- Addition to the 6MPTO from
delete from concept_set where concept_set = (select concept_id from concept_name where name = "6 month Post Treatment Outcome Template" and voided = 0 and locale = "en");

call add_concept_set_members((select concept_id from concept_name where name = "6 month Post Treatment Outcome Template"), (select concept_id from concept_name where name = "6m PTO, 6 month post treatment outcome date" and voided = 0 and locale = "en"), 0);
call add_concept_set_members((select concept_id from concept_name where name = "6 month Post Treatment Outcome Template"), (select concept_id from concept_name where name = "6m PTO, 6 month post treatment outcome" and voided = 0 and locale = "en"), 1);
call add_concept_set_members((select concept_id from concept_name where name = "6 month Post Treatment Outcome Template"), (select concept_id from concept_name where name = "6m PTO, no recurrence" and voided = 0 and locale = "en"), 2);
call add_concept_set_members((select concept_id from concept_name where name = "6 month Post Treatment Outcome Template"), (select concept_id from concept_name where name = "6m PTO, Died" and voided = 0 and locale = "en"), 3);
call add_concept_set_members((select concept_id from concept_name where name = "6 month Post Treatment Outcome Template"), (select concept_id from concept_name where name = "6m PTO, recurrence" and voided = 0 and locale = "en"), 4);
call add_concept_set_members((select concept_id from concept_name where name = "6 month Post Treatment Outcome Template"), (select concept_id from concept_name where name = "6m PTO, LTFU" and voided = 0 and locale = "en"), 5);
call add_concept_set_members((select concept_id from concept_name where name = "6 month Post Treatment Outcome Template"), (select concept_id from concept_name where name = "6m PTO, Not evaluated" and voided = 0 and locale = "en"), 6);

update concept_name set name = "Final post-treatment outcome" where voided = 0 and name = "6 month Post Treatment Outcome";

-- Follow-up Visit Form
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "Followup, Present symptoms and issues", "Present symptoms and issues", 'Text', 'MISC', FALSE);
set @concept11_id = @concept_id;
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "Followup, Screening for on-going symptoms of active TB", "On-going symptoms of active TB screen", 'Coded', 'MISC', FALSE);
set @concept12_id = @concept_id;
set @answerconcept12_id = (select concept_id from concept_name where name = "Cough" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED");
set @answerconcept13_id = (select concept_id from concept_name where name = "Massive hemoptysis" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED");
set @answerconcept14_id = (select concept_id from concept_name where name = "Dyspnea" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED");
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "Followup, Night sweats", "Night sweats", 'N/A', 'MISC', FALSE);
set @answerconcept15_id = @concept_id;
set @answerconcept16_id = (select concept_id from concept_name where name = "Fever (oral)" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED");
set @answerconcept17_id = (select concept_id from concept_name where name = "Weight loss" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED");

call add_concept_answer (@concept12_id,@answerconcept12_id,1);
call add_concept_answer (@concept12_id,@answerconcept13_id,2);
call add_concept_answer (@concept12_id,@answerconcept14_id,3);
call add_concept_answer (@concept12_id,@answerconcept15_id,4);
call add_concept_answer (@concept12_id,@answerconcept16_id,5);
call add_concept_answer (@concept12_id,@answerconcept17_id,6);


call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "Followup, Present symptoms, issues and clinical exam", "Present symptoms, issues and clinical exam", 'N/A', 'MISC', TRUE);
set @concept13_id = @concept_id;
call add_concept_set_members(@concept13_id,(select concept_id from concept_name where name = "Followup, Present symptoms and issues" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED"), 0);
call add_concept_set_members(@concept13_id,(select concept_id from concept_name where name = "Followup, Screening for on-going symptoms of active TB" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED"), 1);



delete from concept_set where concept_set = (select concept_id from concept_name where name = "Followup Template" and voided = 0 and locale = "en");

set @concept14_id =  (select concept_id from concept_name where voided = 0 and locale = "en" and name = "Followup, Visit Date");
set @concept15_id =  (select concept_id from concept_name where voided = 0 and locale = "en" and name = "Followup, Visit details");
set @concept16_id =  (select concept_id from concept_name where voided = 0 and locale = "en" and name = "Followup, Clinical Examination");
set @concept17_id =  (select concept_id from concept_name where voided = 0 and locale = "en" and name = "Followup, Followup questions for clinician reminder");
set @concept18_id =  (select concept_id from concept_name where voided = 0 and locale = "en" and name = "Followup, Optional followup questions");
set @concept19_id =  (select concept_id from concept_name where voided = 0 and locale = "en" and name = "Followup, Next visit");

call add_concept_set_members((select concept_id from concept_name where name = "Followup Template" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED"), @concept14_id,0);
call add_concept_set_members((select concept_id from concept_name where name = "Followup Template" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED"), @concept15_id,1);
call add_concept_set_members((select concept_id from concept_name where name = "Followup Template" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED"), @concept13_id,2);
call add_concept_set_members((select concept_id from concept_name where name = "Followup Template" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED"), @concept16_id,3);
call add_concept_set_members((select concept_id from concept_name where name = "Followup Template" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED"), @concept17_id,4);
call add_concept_set_members((select concept_id from concept_name where name = "Followup Template" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED"), @concept18_id,5);
call add_concept_set_members((select concept_id from concept_name where name = "Followup Template" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED"), @concept19_id,6);

