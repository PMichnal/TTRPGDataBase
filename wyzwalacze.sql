-- wyzwalacze
CREATE TRIGGER afterDeletePC
ON pc
AFTER DELETE
AS
BEGIN
	DELETE FROM pc_feats WHERE pc_id IN (SELECT pc_id FROM DELETED);
	DELETE FROM entities WHERE entity_id IN (SELECT entity_id FROM DELETED);
END
GO;

CREATE TRIGGER afterDeleteNPC
ON npc
AFTER DELETE
AS
BEGIN
	DELETE FROM entities WHERE entity_id IN (SELECT entity_id FROM DELETED);
END
GO;

CREATE TRIGGER afterDeleteMonster
ON monsters
AFTER DELETE 
AS
BEGIN
	DELETE FROM entities WHERE entity_id IN (SELECT entity_id FROM DELETED);
END
GO;

CREATE TRIGGER afterDeleteEntity
ON monsters
AFTER DELETE
AS 
BEGIN
	DELETE FROM entity_proficiences WHERE entity_id IN (SELECT entity_id FROM DELETED);
	DELETE FROM entity_resistances_and_vulnerabilities WHERE entity_id IN (SELECT entity_id FROM DELETED);
	DELETE FROM entity_skills WHERE entity_id IN (SELECT entity_id FROM DELETED);
	DELETE FROM entity_spells_known WHERE entity_id IN (SELECT entity_id FROM DELETED);
	DELETE FROM entity_spellslots WHERE entity_id IN (SELECT entity_id FROM DELETED);
END
GO;

CREATE TRIGGER afterDeleteSpell
ON spells 
AFTER DELETE
AS
BEGIN 
	DELETE FROM entity_spells_known WHERE spell_id IN (SELECT spell_id FROM DELETED);
END
GO;

CREATE TRIGGER afterDeleteWeapon
ON weapon
AFTER DELETE 
AS
BEGIN
	DELETE FROM equipment WHERE weapon_id IN (SELECT weapon_id FROM DELETED);
END
GO;