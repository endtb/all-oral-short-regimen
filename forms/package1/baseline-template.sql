-- INOUT new_concept_id INT, INOUT concept_name_short_id INT, INOUT concept_name_full_id INT, name_of_concept VARCHAR(255),
-- concept_short_name VARCHAR(255), data_type_name VARCHAR(255), class_name VARCHAR(255), is_set BOOLEAN

-- All Oral STR, Baseline Assessment
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'All Oral STR, Baseline Assessment', 'STR Baseline Assessment', 'N/A', 'Misc', true);
-- dote of baseline
set @date_of_baseline = (select concept_id from concept_name where name = "Baseline, Date of baseline" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
-- social history section
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'All Oral STR, Baseline, Social History', 'Social History', 'N/A', 'Misc', true);

set @baseline_social_history = (select concept_id from concept_name where name = "All Oral STR, Baseline, Social History" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_prison_status = (select concept_id from concept_name where name = "Baseline, Prison" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_prison_status_yes = (select concept_id from concept_name where name = "Baseline, Is prison past or present" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_alchol = (select concept_id from concept_name where name = "Baseline, Is alcoholic" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_alchol_yes = (select concept_id from concept_name where name = "Baseline, How many alcoholic drinks per week" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_cigarette = (select concept_id from concept_name where name = "Baseline, Cigarette a day" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_drug_iv = (select concept_id from concept_name where name = "Baseline, Used intravenous drugs in the past year" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_drug_non_iv = (select concept_id from concept_name where name = "Baseline, Used any of the non prescribed non injectable drugs" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");

call add_concept_set_members(@baseline_social_history, @baseline_prison_status, 1);
call add_concept_set_members(@baseline_social_history, @baseline_prison_status_yes, 2);
call add_concept_set_members(@baseline_social_history, @baseline_alchol, 3);
call add_concept_set_members(@baseline_social_history, @baseline_alchol_yes, 4);
call add_concept_set_members(@baseline_social_history, @baseline_cigarette, 5);
call add_concept_set_members(@baseline_social_history, @baseline_drug_iv, 6);
call add_concept_set_members(@baseline_social_history, @baseline_drug_non_iv, 7);

-- Baseline, TB History
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'All Oral STR, Baseline, TB History', 'TB History', 'N/A', 'Misc', true);
set @baseline_tb_history = (select concept_id from concept_name where name = "All Oral STR, Baseline, TB History" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_past_tb_drugs = (select concept_id from concept_name where name = "Baseline, List of drugs taken for more than a month" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_other_past_tb_drugs = (select concept_id from concept_name where name = "Baseline, Other drug taken for more than a month" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");

call add_concept_set_members(@baseline_tb_history, @baseline_past_tb_drugs, 1);
call add_concept_set_members(@baseline_tb_history, @baseline_other_past_tb_drugs, 2);

-- Baseline, Past medical history
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'All Oral STR, Baseline, Past Medical History', 'Past Medical History / Comorbidities', 'N/A', 'Misc', true);
set @baseline_past_medical_history = (select concept_id from concept_name where name = "All Oral STR, Baseline, Past Medical History" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_hiv_serostatus = (select concept_id from concept_name where name = "Baseline, HIV serostatus result" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_hiv_diagnosis_date = (select concept_id from concept_name where name = "Date of HIV diagnosis" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_hiv_cd4_count = (select concept_id from concept_name where name = "Baseline, CD4 count details" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_hiv_cd4_count_date = (select concept_id from concept_name where name = "CD4 date" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_hiv_viral_load = (select concept_id from concept_name where name = "Baseline, HIV Viral Load Details" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_hiv_viral_load_date = (select concept_id from concept_name where name = "Baseline, Viral Load Date" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");

set @baseline_arv = (select concept_id from concept_name where name = "Baseline, On ARV treatment" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_arv_date = (select concept_id from concept_name where name = "Antiretroviral treatment start date" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_arv_regimen = (select concept_id from concept_name where name = "Baseline, Drugs used in ARV treatment" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");

set @baseline_diabetes = (select concept_id from concept_name where name = "Diabetes Mellitus" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");

set @baseline_hba1c = (select concept_id from concept_name where name = "glycosylated hemoglobin A measurement" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_hepb = (select concept_id from concept_name where name = "Baseline, Hepatitis B" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_hepc = (select concept_id from concept_name where name = "Baseline, Hepatitis C" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_neuropathy = (select concept_id from concept_name where name = "Baseline, Pre-existing neuropathy" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");
set @baseline_neuropathy_grading = (select concept_id from concept_name where name = "Baseline, Neuropathy grade" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");

call add_concept_set_members(@baseline_past_medical_history, @baseline_hiv_serostatus, 1);
call add_concept_set_members(@baseline_past_medical_history, @baseline_hiv_diagnosis_date, 2);
call add_concept_set_members(@baseline_past_medical_history, @baseline_hiv_cd4_count, 3);
call add_concept_set_members(@baseline_past_medical_history, @baseline_hiv_cd4_count_date, 4);
call add_concept_set_members(@baseline_past_medical_history, @baseline_hiv_viral_load, 5);
call add_concept_set_members(@baseline_past_medical_history, @baseline_hiv_viral_load_date, 6);
call add_concept_set_members(@baseline_past_medical_history, @baseline_arv, 7);
call add_concept_set_members(@baseline_past_medical_history, @baseline_arv_date, 8);
call add_concept_set_members(@baseline_past_medical_history, @baseline_arv_regimen, 9);
call add_concept_set_members(@baseline_past_medical_history, @baseline_diabetes, 10);
call add_concept_set_members(@baseline_past_medical_history, @baseline_hba1c, 11);
call add_concept_set_members(@baseline_past_medical_history, @baseline_hepb, 12);
call add_concept_set_members(@baseline_past_medical_history, @baseline_hepc, 13);
call add_concept_set_members(@baseline_past_medical_history, @baseline_neuropathy, 14);
call add_concept_set_members(@baseline_past_medical_history, @baseline_neuropathy_grading, 15);


-- Add sections to the baseline form
set @str_baseline_form_concept_id = (select concept_id from concept_name where name = "All Oral STR, Baseline Assessment" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");

call add_concept_set_members(@str_baseline_form_concept_id, @date_of_baseline, 1);
call add_concept_set_members(@str_baseline_form_concept_id, @baseline_social_history, 2);
call add_concept_set_members(@str_baseline_form_concept_id, @baseline_tb_history, 3);
call add_concept_set_members(@str_baseline_form_concept_id, @baseline_past_medical_history, 4);

-- Add new form to the parent template
set @parent_template_concept_id = (select concept_id from concept_name where name = "All Observation Templates" and voided = 0 and
                         concept_name_type = "FULLY_SPECIFIED");

call add_concept_set_members(@parent_template_concept_id, @str_baseline_form_concept_id, 23)


