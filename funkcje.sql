-- FUNKCJE DODAWANIA NOWYCH REKORDYCH DO BAZY DANYCH
-- AAAAAAAAAAAAAAaaaaaaaaaaaaaaaaaaaaa
-- DODAJ FUNKCJE CO BEDZIĘ LICZYC CR NA PODSTAWIE EXPAAAAAAA
-- W MOMENCIE W KTORYM PODAJEMY TYP OBRAZEN NIECH SPRAWDZI PODATNOSC
-- POLICZ SPELL SAVE DC

-- Function to add a new entity
CREATE PROCEDURE addEntity 
    @entity_id integer,
    @aligment_id integer,
    @type nvarchar(255),
    @initiative_bonus integer,
    @size nvarchar(255),
    @name nvarchar(255),
    @ac integer,
    @hp integer,
    @str integer,
    @dex integer,
    @con integer,
    @int integer,
    @wis integer,
    @char integer
AS
BEGIN
    INSERT INTO entities VALUES (@entity_id, @aligment_id, @type, @initiative_bonus, @size, @name, @ac, @hp, @str, @dex, @con, @int, @wis, @char);
END;
GO

-- Function to add a new equipment
CREATE PROCEDURE addEquipment
    @entity_id integer,
    @weapon_id integer
AS
BEGIN
    INSERT INTO equipment VALUES (@entity_id, @weapon_id);
END;
GO

-- Function to add a new alignment
CREATE PROCEDURE addAlignment
    @aligment_id integer,
    @x_axis nvarchar(255),
    @y_axis nvarchar(255)
AS
BEGIN
    INSERT INTO aligment VALUES (@aligment_id, @x_axis, @y_axis);
END;
GO

-- Function to add a new monster
CREATE PROCEDURE addMonster
    @entity_id integer
AS
BEGIN
    INSERT INTO monsters VALUES (@entity_id);
END;
GO

--Function to add a new npc
CREATE PROCEDURE addNpc
    @entity_id integer,
    @exp integer,
    @race nvarchar(255)
AS
BEGIN
    INSERT INTO npc VALUES (@entity_id, @exp, @race);
END;
GO

-- Function to add a new pc
CREATE PROCEDURE addPc
    @entity_id integer,
    @pc_id integer,
    @class nvarchar(255),
    @subclass nvarchar(255),
    @background nvarchar(255)
AS
BEGIN
    INSERT INTO pc VALUES (@entity_id, @pc_id, @class, @subclass, @background);
END;
GO

-- Function to add a new feat
CREATE PROCEDURE addFeat
    @feat_id integer,
    @name nvarchar(255),
    @description nvarchar(255)
AS
BEGIN
    INSERT INTO feats VALUES (@feat_id, @name, @description);
END;
GO

-- Function to add a new proficiency
CREATE PROCEDURE addProficiency
    @proficiency_id integer,
    @name nvarchar(255)
AS
BEGIN
    INSERT INTO proficiences VALUES (@proficiency_id, @name);
END;
GO

-- Function to add a new weapon type
CREATE PROCEDURE addWeaponType
    @proficiency_id integer,
    @type_id integer,
    @name nvarchar(255)
AS
BEGIN
    INSERT INTO weapon_types VALUES (@proficiency_id, @type_id, @name);
END;
GO

-- Function to add a new weapon
CREATE PROCEDURE addWeapon
    @weapon_id integer,
    @type_id integer,
    @name integer,
    @damage nvarchar(255),
    @damage_type_id integer,
    @stat nvarchar(255)
AS
BEGIN
    INSERT INTO weapon VALUES (@weapon_id, @type_id, @name, @damage, @damage_type_id, @stat);
END;
GO

-- Function to add a new spell
CREATE PROCEDURE addSpell
    @spell_id integer,
    @spell_lvl integer,
    @name nvarchar(255),
    @damage nvarchar(255),
    @damege_type_id integer,
    @casting_time integer,
    @range nvarchar(255),
    @area bit,
    @duration integer
AS
BEGIN
    INSERT INTO spells VALUES (@spell_id, @spell_lvl, @name, @damage, @damege_type_id, @casting_time, @range, @area, @duration);
END;
GO

-- Function to add a new skill
CREATE PROCEDURE addSkill
    @skill_id integer,
    @name nvarchar(255),
    @stat nvarchar(255)
AS
BEGIN
    INSERT INTO skills VALUES (@skill_id, @name, @stat);
END;
GO

-- Function to add a new damage type
CREATE PROCEDURE addDamageType
    @damage_type_id integer,
    @name nvarchar(255)
AS
BEGIN
    INSERT INTO damage_types VALUES (@damage_type_id, @name);
END;
GO

-- Function to add a new entity spellslots
CREATE PROCEDURE addEntitySpellslots
    @entity_id integer,
    @spell_lvl integer,
    @number integer
AS
BEGIN
    INSERT INTO entity_spellslots VALUES (@entity_id, @spell_lvl, @number);
END;
GO
