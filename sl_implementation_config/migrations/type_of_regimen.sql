call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "Regimen type, All oral short regimen", "Short regimen", "N/A","Misc", FALSE);
set @concept24_id = (select concept_id from concept_name where name="Regimen type, All oral short regimen" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED");

call add_concept(@concept_id, @concept_name_short_id, @concept_name_full_id, "Regimen type", "Regimen type", "Coded","Misc", FALSE);
set @concept25_id = (select concept_id from concept_name where name="Regimen type" and voided = 0 and locale="en" and concept_name_type="FULLY_SPECIFIED");

call add_concept_answer (@concept25_id,@concept24_id,1);

insert into program_attribute_type(name, description, datatype, datatype_config, min_occurs, creator, date_created, uuid) values("Regimen type","Regimen type", "org.bahmni.module.bahmnicore.customdatatype.datatype.CodedConceptDatatype", @concept25_id, 0, 1, NOW(), UUID());
