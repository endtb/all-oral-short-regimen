call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "TI, patient eligible for treatment with All Oral STR (according to OR protocol)?", "Eligible for treatment with All Oral STR?",'Boolean', 'MISC', FALSE);

call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "TI, If YES date that patient was determined to be eligible for All Oral STR?", "Date that patient was determined to be eligible for All Oral STR",'Date', 'MISC', FALSE);

call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "TI, If YES does the patient meet ALL the following eligibility criteria listed below for inclusion in the All Oral STR (check all that apply)?", "Patient meets ALL eligibility criteria for inclusion in the All Oral STR (check all that apply)?",'Coded', 'MISC', FALSE);
set @concept27_id = @concept_id;

call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id,"TI, Willing and able to give informed consent to be enrolled in the research project and follow-up (signed or witnessed consent if the patient is illiterate. Signed or witnessed consent from a childs parent or legal guardian)", "Willing and able to give informed consent to be enrolled in the research project and follow-up", "N/A", "MISC", FALSE);
set @answerconcept28_id = @concept_id;

call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id,"TI, Has given informed consent (MANDATORY) for participation within the study. If aged greater or equal 3 to 17 years an assent form must be signed", "Has given informed consent for participation within the study", "N/A", "MISC", FALSE);
set @answerconcept29_id = @concept_id;

call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id,"TI, Has bacteriologically confirmed MDR/RR-TB","Bacteriologically confirmed MDR/RR-TB","N/A", "MISC", FALSE);
set @answerconcept30_id = @concept_id;

call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id,"TI, Has not been a confirmed or suspected to have resistance to FQ","Has not been a confirmed or suspected to have resistance to FQ","N/A", "MISC", FALSE);
set @answerconcept31_id = @concept_id;

call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id,"TI, Has no history of adverse effect to any of the drugs or hypersensitivity","No history of AE to any of the drugs or hypersensitivity","N/A", "MISC", FALSE);
set @answerconcept32_id = @concept_id;

call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id,"TI, Is willing to adhere to the follow-up schedule and to study procedures", "Willing to adhere to the follow-up schedule and to study procedures","N/A", "MISC", FALSE);
set @answerconcept33_id = @concept_id;

call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id,"TI, Is not a close contact of FQ resistance MDR patient", "Not a close contact of FQ resistance MDR patient","N/A", "MISC", FALSE);
set @answerconcept34_id = @concept_id;

call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id,"TI, Is aged greater or equal to 3 years and above", "Age greater or equal to 3 years and above","N/A", "MISC", FALSE);
set @answerconcept35_id = @concept_id;

call add_concept_answer(@concept27_id,@answerconcept28_id,0); 
call add_concept_answer(@concept27_id,@answerconcept29_id,1); 
call add_concept_answer(@concept27_id,@answerconcept30_id,2); 
call add_concept_answer(@concept27_id,@answerconcept31_id,3); 
call add_concept_answer(@concept27_id,@answerconcept32_id,4); 
call add_concept_answer(@concept27_id,@answerconcept33_id,5); 
call add_concept_answer(@concept27_id,@answerconcept34_id,6);
call add_concept_answer(@concept27_id,@answerconcept35_id,7); 

update concept_name set name = "All Oral Shorter Regimen Eligibility" where name = "New Treatment Eligibility" and voided = 0 and concept_name_type = "SHORT" and locale = "en";
set @concept36_id = (select concept_id from concept_name where voided = 0 and locale = "en" and concept_name_type = "FULLY_SPECIFIED" and name = "TI, New treatment eligibility");

call add_concept_set_members(@concept36_id,@concept27_id,0);
