create table dmgtable
(
    id      int auto_increment
        primary key,
    realDmg int null
);

INSERT INTO minecraft.dmgtable (id, realDmg) VALUES (1, 2);
INSERT INTO minecraft.dmgtable (id, realDmg) VALUES (2, 4);
INSERT INTO minecraft.dmgtable (id, realDmg) VALUES (3, 6);
INSERT INTO minecraft.dmgtable (id, realDmg) VALUES (4, 8);
create table miningtable
(
    id    int auto_increment
        primary key,
    level char(255) null
);

INSERT INTO minecraft.miningtable (id, level) VALUES (1, 'Dirt');
INSERT INTO minecraft.miningtable (id, level) VALUES (2, 'Stone');
INSERT INTO minecraft.miningtable (id, level) VALUES (3, 'CoalOre');
INSERT INTO minecraft.miningtable (id, level) VALUES (4, 'IronOre');
create table tools
(
    id       int auto_increment
        primary key,
    toolName char(255) null,
    itemID   int       null
);

INSERT INTO minecraft.tools (id, toolName, itemID) VALUES (1, 'StonePickaxe', null);
INSERT INTO minecraft.tools (id, toolName, itemID) VALUES (2, 'StoneSword', null);
INSERT INTO minecraft.tools (id, toolName, itemID) VALUES (3, 'DiamondPickaxe', null);
INSERT INTO minecraft.tools (id, toolName, itemID) VALUES (4, 'DiamondSword', null);
create table toolsjoin
(
    id       int auto_increment
        primary key,
    toolId   int null,
    miningId int null,
    dmgId    int null,
    constraint toolsjoin_dmgtable_id_fk
        foreign key (dmgId) references dmgtable (id),
    constraint toolsjoin_miningtable_id_fk
        foreign key (miningId) references miningtable (id),
    constraint toolsjoin_tools_id_fk
        foreign key (toolId) references tools (id)
);

INSERT INTO minecraft.toolsjoin (id, toolId, miningId, dmgId) VALUES (1, 1, 2, 1);
INSERT INTO minecraft.toolsjoin (id, toolId, miningId, dmgId) VALUES (2, 2, 1, 2);
INSERT INTO minecraft.toolsjoin (id, toolId, miningId, dmgId) VALUES (3, 3, 4, 1);
INSERT INTO minecraft.toolsjoin (id, toolId, miningId, dmgId) VALUES (4, 4, 1, 4);