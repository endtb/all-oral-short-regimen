/*Might be chnaged
select count(*) from person_attribute_type where retired = 1 and name="dateOfDRTB";
update person_attribute_type set retired = 0 where name="dateOfDRTB";
select count(*) from person_attribute_type where retired = 1 and name="previousTBTreatmentCenter";
update person_attribute_type set retired = 0 where name="previousTBTreatmentCenter";
*/

select count(*) from person_attribute_type where retired = 0 and name="patientAddres";
update person_attribute_type set description = "Address (Residential)" where name = "patientAddress"

select count(*) from person_attribute_type where retired = 0 and name="patientAddressLine2";
update person_attribute_type set description = "Address (Work)" where name = "patientAddressLine2";

update person_attribute_type set sort_weight = 18 where name = "patientCountry";
update person_attribute_type set sort_weight = 19 where name = "patientDistrict";

update person_attribute_type set description = "Address (Next of Kin)" where name = "patientCountry";
update person_attribute_type set name = "nextofKinAddress" where description = "Address (Next of Kin)"


update person_attribute_type set description = "Telephone Number (Home)"  where name = "facilityPatientID";
update person_attribute_type set name = "telephoneNumberHome" where description= "Telephone Number (Home)";
update person_attribute_type set name = "telephoneNumberCell" where description= "Telephone Number";
update person_attribute_type set description= "Telephone Number (cell)" where name = "telephoneNumberCell";
update person_attribute_type set description = "Telephone Number (Next of Kin)"  where name = "previousDRTBNumber";
update person_attribute_type set name = "telephoneNumberNextOfKin" where description = "Telephone Number (Next of Kin)";
update person_attribute_type set retired = 0 where name = "telephoneNumberHome";
update person_attribute_type set retired_by = NULL where name = "telephoneNumberHome";
update person_attribute_type set retire_reason = NULL where name = "telephoneNumberHome";
update person_attribute_type set date_retired = NULL where name = "telephoneNumberHome";
update person_attribute_type set retired = 0 where name = "telephoneNumberNextOfKin"
update person_attribute_type set retired_by = NULL where name = "telephoneNumberNextOfKin";
update person_attribute_type set retire_reason = NULL where name = "telephoneNumberNextOfKin";
update person_attribute_type set date_retired = NULL where name = "telephoneNumberNextOfKin";

update person_attribute_type set sort_weight = 0 where description = "Address (Residential)";
update person_attribute_type set sort_weight = 1 where description = "Address (Work)";
update person_attribute_type set sort_weight = 2 where description = "Address (Next of Kin)";
update person_attribute_type set sort_weight = 3 where description = "Telephone Number (cell)";
update person_attribute_type set sort_weight = 4 where description = "Telephone Number (Home)";
update person_attribute_type set sort_weight = 5 where description = "Telephone Number (Next of Kin)";
update person_attribute_type set sort_weight = 6 where description = "District of Residence";
