CREATE DATABASE [dnd]

CREATE TABLE [entities] (
  [entity_id] integer PRIMARY KEY,
  [aligment_id] integer NOT NULL,
  [type] creature_type NOT NULL,
  [initiative_bonus] integer NOT NULL,
  [size] nvarchar(255) NOT NULL,
  [name] nvarchar(255) NOT NULL,
  [ac] integer NOT NULL,
  [hp] integer NOT NULL,
  [str] integer NOT NULL,
  [dex] integer NOT NULL,
  [con] integer NOT NULL,
  [int] integer NOT NULL,
  [wis] integer NOT NULL,
  [char] integer NOT NULL
)
GO

CREATE TABLE [equipment] (
  [entity_id] integer,
  [weapon_id] integer,
  PRIMARY KEY ([entity_id], [weapon_id])
)
GO

CREATE TABLE [aligment] (
  [aligment_id] integer PRIMARY KEY,
  [x_axis] nvarchar(255) NOT NULL CHECK ([x_axis] IN ('chaotic', 'neutral', 'lawful')) NOT NULL,
  [y_axis] nvarchar(255) NOT NULL CHECK ([y_axis] IN ('good', 'neutral', 'evil')) NOT NULL
)
GO

CREATE TABLE [monsters] (
  [entity_id] integer PRIMARY KEY,
  [exp] integer NOT NULL,
  [type] nvarchar(255) NOT NULL CHECK ([type] IN ('aberration', 'beast', 'celestial', 'construct', 'dragon', 'elemental', 'fey', 'fiend', 'giant', 'monstrolity', 'ooze', 'plant', 'undead')) NOT NULL
)
GO

CREATE TABLE [entity_skills] (
  [entity_id] integer,
  [skill_id] integer,
  PRIMARY KEY ([entity_id], [skill_id])
)
GO

CREATE TABLE [skills] (
  [skill_id] integer PRIMARY KEY,
  [name] nvarchar(255) UNIQUE NOT NULL,
  [stat] nvarchar(255) NOT NULL CHECK ([stat] IN ('charisma', 'dexterity', 'constitution', 'inteligence', 'wisdom', 'strength')) NOT NULL
)
GO

CREATE TABLE [npc] (
  [entity_id] integer PRIMARY KEY,
  [exp] integer NOT NULL,
  [race] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [pc] (
  [entity_id] integer,
  [pc_id] integer,
  [class] nvarchar(255) NOT NULL,
  [subclass] nvarchar(255) NOT NULL,
  [background] nvarchar(255) NOT NULL,
  PRIMARY KEY ([entity_id], [pc_id])
)
GO

CREATE TABLE [pc_feats] (
  [pc_id] integer,
  [feat_id] integer,
  PRIMARY KEY ([pc_id], [feat_id])
)
GO

CREATE TABLE [feats] (
  [feat_id] integer PRIMARY KEY,
  [name] nvarchar(255) NOT NULL,
  [description] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [proficiences] (
  [proficiency_id] integer PRIMARY KEY,
  [name] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [entity_proficiences] (
  [entity_id] integer,
  [proficiency_id] integer,
  PRIMARY KEY ([entity_id], [proficiency_id])
)
GO

CREATE TABLE [weapon_types] (
  [proficiency_id] integer,
  [type_id] integer,
  [name] nvarchar(255) NOT NULL,
  PRIMARY KEY ([proficiency_id], [type_id])
)
GO

CREATE TABLE [weapon] (
  [weapon_id] integer PRIMARY KEY,
  [type_id] integer NOT NULL,
  [name] integer NOT NULL,
  [damage] nvarchar(255) NOT NULL,
  [damage_type_id] integer NOT NULL,
  [stat] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [spells] (
  [spell_id] integer PRIMARY KEY,
  [spell_lvl] integer NOT NULL,
  [name] nvarchar(255) NOT NULL,
  [damage] nvarchar(255) NOT NULL,
  [damege_type_id] integer NOT NULL,
  [casting_time] integer NOT NULL,
  [range] nvarchar(255) NOT NULL,
  [area] bool NOT NULL,
  [duration] integer NOT NULL
)
GO

CREATE TABLE [entity_spells_known] (
  [entity_id] integer,
  [spell_id] integer,
  PRIMARY KEY ([entity_id], [spell_id])
)
GO

CREATE TABLE [entity_spellslots] (
  [entity_id] integer,
  [spell_lvl] integer,
  [number] integer NOT NULL,
  PRIMARY KEY ([entity_id], [spell_lvl])
)
GO

CREATE TABLE [damage_types] (
  [damage_type_id] integer PRIMARY KEY,
  [name] nvarchar(255) UNIQUE NOT NULL
)
GO

CREATE TABLE [entity_resistances_and_vulnerabilities] (
  [demage_type_id] integer,
  [entity_id] integer,
  [type] nvarchar(255) NOT NULL,
  PRIMARY KEY ([demage_type_id], [entity_id])
)
GO

ALTER TABLE [pc_feats] ADD FOREIGN KEY ([pc_id]) REFERENCES [pc] ([pc_id])
GO

ALTER TABLE [pc_feats] ADD FOREIGN KEY ([feat_id]) REFERENCES [feats] ([feat_id])
GO

ALTER TABLE [npc] ADD FOREIGN KEY ([entity_id]) REFERENCES [entities] ([entity_id])
GO

ALTER TABLE [monsters] ADD FOREIGN KEY ([entity_id]) REFERENCES [entities] ([entity_id])
GO

ALTER TABLE [pc] ADD FOREIGN KEY ([entity_id]) REFERENCES [entities] ([entity_id])
GO

ALTER TABLE [entities] ADD FOREIGN KEY ([aligment_id]) REFERENCES [aligment] ([aligment_id])
GO

ALTER TABLE [entity_spellslots] ADD FOREIGN KEY ([entity_id]) REFERENCES [entities] ([entity_id])
GO

ALTER TABLE [entity_skills] ADD FOREIGN KEY ([entity_id]) REFERENCES [entities] ([entity_id])
GO

ALTER TABLE [entity_spells_known] ADD FOREIGN KEY ([entity_id]) REFERENCES [entities] ([entity_id])
GO

ALTER TABLE [entity_spells_known] ADD FOREIGN KEY ([spell_id]) REFERENCES [spells] ([spell_id])
GO

ALTER TABLE [entity_skills] ADD FOREIGN KEY ([skill_id]) REFERENCES [skills] ([skill_id])
GO

ALTER TABLE [entity_proficiences] ADD FOREIGN KEY ([entity_id]) REFERENCES [entities] ([entity_id])
GO

ALTER TABLE [entity_proficiences] ADD FOREIGN KEY ([proficiency_id]) REFERENCES [proficiences] ([proficiency_id])
GO

ALTER TABLE [weapon_types] ADD FOREIGN KEY ([proficiency_id]) REFERENCES [proficiences] ([proficiency_id])
GO

ALTER TABLE [weapon] ADD FOREIGN KEY ([type_id]) REFERENCES [weapon_types] ([type_id])
GO

ALTER TABLE [weapon] ADD FOREIGN KEY ([damage_type_id]) REFERENCES [damage_types] ([damage_type_id])
GO

ALTER TABLE [entity_resistances_and_vulnerabilities] ADD FOREIGN KEY ([demage_type_id]) REFERENCES [damage_types] ([damage_type_id])
GO

ALTER TABLE [entity_resistances_and_vulnerabilities] ADD FOREIGN KEY ([entity_id]) REFERENCES [entities] ([entity_id])
GO

ALTER TABLE [equipment] ADD FOREIGN KEY ([entity_id]) REFERENCES [entities] ([entity_id])
GO

ALTER TABLE [equipment] ADD FOREIGN KEY ([weapon_id]) REFERENCES [weapon] ([weapon_id])
GO


