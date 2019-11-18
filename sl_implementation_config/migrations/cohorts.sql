call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Cohort, endTB', 'endTB', 'N/A','Misc', FALSE);
set @answerconcept_id26 = @concept_id;
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Cohort, non endTB', 'non endTB', 'N/A','Misc', FALSE);
set @answerconcept_id27 = @concept_id;
call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, 'Belongs to external cohort', ' cohort', 'Coded','Misc', FALSE);
set @concept28_id = @concept_id;

call add_concept_answer (@concept28_id,@answerconcept_id26,1);
call add_concept_answer (@concept28_id,@answerconcept_id27,2);

insert into program_attribute_type(name, description, datatype, datatype_config, min_occurs, creator, date_created, uuid) values('Belongs to external cohort','Cohort', 'org.bahmni.module.bahmnicore.customdatatype.datatype.CodedConceptDatatype', @concept28_id, 0, 1, NOW(), UUID());
