// Copyright (c) rAthena Dev Teams - Licensed under GNU GPL
// For more information, see LICENCE in the main folder

/**
 * Custom Atcommands
 * Place the body of custom atcommands in this file.
 * Format:
 *	ACMD_FUNC(command_name)
 *	{
 *		<code>;
 *	}
 **/

//ACMD_FUNC(newcommand)
//{
//	clif_displaymessage(fd, "It works!");
//	clif_specialeffect(&sd->bl, EF_HEARTCASTING, AREA);
//	return 0;
//}

/*==========================================
 *------------------------------------------*/
ACMD_FUNC(hideview)
{
	int val = 0, view = 0;
	char type[CHAT_SIZE_MAX];
	
	nullpo_retr(-1, sd);
	memset(atcmd_output, '\0', sizeof(atcmd_output));
	
	parent_cmd = atcommand_alias_db.checkAlias(command+1);
	
	if( strcmp(parent_cmd, "hideview") == 0 ){
		if((sscanf(message, "%s %11d", &type, &view)) < 1 || (view > 15 || view < 1)){
			clif_displaymessage(fd, "วิธีใช้: @hideview {<ประเภท>} {<ตำแหน่ง>}");
			clif_displaymessage(fd, "ประเภท: all - ผู้เล่นทุกคน {<ตำแหน่ง>} view | other - ผู้เล่นอื่น {<ตำแหน่ง>} view");
			clif_displaymessage(fd, "ตำแหน่ง: 1 - หัว | 2 - หู | 4 - ปาก | 8 - ผ้าคลุม");
			clif_displaymessage(fd, "ตัวอย่าง: \"@hideview other 7\"  \nคือ ( 1 + 2 + 4 = 7 จะซ่อนของสวมใส่ในส่วน หัว,หู,ปาก ของผู้เล่นอื่น)");
			return -1;
		}
		if((strncmp(type, "all", 3) == 0))
			val += 16;

		if(view&1) val += 1;
		if(view&2) val += 2;
		if(view&4) val += 4;
		if(view&8) val += 8;
		
		sd->state.hideview = val;
		clif_refresh(sd);
		if((strncmp(message, "others", 3) == 0) || (val&16)){
			clif_refreshlook(&sd->bl,sd->bl.id,LOOK_HEAD_TOP,sd->status.head_top,SELF);
			clif_refreshlook(&sd->bl,sd->bl.id,LOOK_HEAD_MID,sd->status.head_mid,SELF);
			clif_refreshlook(&sd->bl,sd->bl.id,LOOK_HEAD_BOTTOM,sd->status.head_bottom,SELF);
			clif_refreshlook(&sd->bl,sd->bl.id,LOOK_ROBE,sd->status.robe,SELF);
		}
		if(val&16){
			if(val&1) clif_refreshlook(&sd->bl,sd->bl.id,LOOK_HEAD_TOP,0,SELF);
			if(val&2) clif_refreshlook(&sd->bl,sd->bl.id,LOOK_HEAD_MID,0,SELF);
			if(val&4) clif_refreshlook(&sd->bl,sd->bl.id,LOOK_HEAD_BOTTOM,0,SELF);
			if(val&8) clif_refreshlook(&sd->bl,sd->bl.id,LOOK_ROBE,0,SELF);
		}
		sprintf(atcmd_output, "อุปกรณ์สวมใส่ของผู้เล่น %s ถูกซ่อนแล้ว",(strncmp(type, "others", 3)) ? "อื่น":"มั้งหมด");
		clif_displaymessage(fd, atcmd_output);
		clif_displaymessage(fd, "ใช้คำสั่ง @showview เพื่อแสดงอุปกรณ์สวมใส่ทั้งหมด");
	} else if(strcmp(parent_cmd, "showview") == 0){
		sd->state.hideview = 0;
		clif_displaymessage(fd, "อุปกรณ์สวมใส่ของผู้เล่นทั้งหมดถูกแสดงแล้ว.)");
		clif_refresh(sd);
		clif_refreshlook(&sd->bl,sd->bl.id,LOOK_HEAD_TOP,sd->status.head_top,SELF);
		clif_refreshlook(&sd->bl,sd->bl.id,LOOK_HEAD_MID,sd->status.head_mid,SELF);
		clif_refreshlook(&sd->bl,sd->bl.id,LOOK_HEAD_BOTTOM,sd->status.head_bottom,SELF);
		clif_refreshlook(&sd->bl,sd->bl.id,LOOK_ROBE,sd->status.robe,SELF);
	}
	
	return 0;
}



void atcommand_battlestats_sub(int fd, map_session_data *sd) {
	status_data *status = status_get_status_data(&sd->bl);
	char output[CHAT_SIZE_MAX];

#define battlestats_msg(__msg__) (__msg__); clif_displaymessage(fd, output)

	battlestats_msg(sprintf(output, "Battle Status: %s", sd->status.name));

	clif_displaymessage(fd, "|--- Basic Info ---|");
	battlestats_msg(sprintf(output, "  -> HP: %d | SP: %d", sd->status.hp, sd->status.sp));
	battlestats_msg(sprintf(output, "  -> ATK: %d + %d", pc_leftside_atk(sd), pc_rightside_atk(sd)));
	battlestats_msg(sprintf(output, "  -> MATK: %d + %d", pc_leftside_matk(sd), pc_rightside_matk(sd)));
	battlestats_msg(sprintf(output, "  -> พลังโจมตีระยะใกล้ : + %d%% | พลังโจมตีระยะไกล : + %d%%", sd->bonus.short_attack_atk_rate, sd->bonus.long_attack_atk_rate));
	battlestats_msg(sprintf(output, "  -> โอกาสโจมตีคริคิคอล : %d | โจมตีคริติคอลแรงขึ้น : + %d%%", status->cri / 10, sd->bonus.crit_atk_rate));
	battlestats_msg(sprintf(output, "  -> DEF: %d + %d | RES: %d%", pc_leftside_def(sd), pc_rightside_def(sd), status->res));
	battlestats_msg(sprintf(output, "  -> MDEF: %d + %d | MRES: %d%", pc_leftside_mdef(sd), pc_rightside_mdef(sd), status->mres));
	battlestats_msg(sprintf(output, "  -> HIT: %d | FLEE: %d", status->hit, status->flee));
	battlestats_msg(sprintf(output, "  -> PERFECT DODGE : %d", status->flee2 / 10));
	battlestats_msg(sprintf(output, "  -> SKILLDELAY : %d%%", sd->bonus.delayrate));

	clif_displaymessage(fd, "|--- Bonus Physical Damages ---|");
	battlestats_msg(sprintf(output, "  -> Small Size: %d%% | Medium Size: %d%% | Large Size: %d%%", sd->right_weapon.addsize[SZ_SMALL] + sd->left_weapon.addsize[SZ_SMALL] + sd->right_weapon.addsize[SZ_ALL] + sd->left_weapon.addsize[SZ_ALL], sd->right_weapon.addsize[SZ_MEDIUM] + sd->left_weapon.addsize[SZ_MEDIUM] + sd->right_weapon.addsize[SZ_ALL] + sd->left_weapon.addsize[SZ_ALL], sd->right_weapon.addsize[SZ_BIG] + sd->left_weapon.addsize[SZ_BIG] + sd->right_weapon.addsize[SZ_ALL] + sd->left_weapon.addsize[SZ_ALL]));
	battlestats_msg(sprintf(output, "  -> Normal Class: %d%% | Boss Class: %d%%", sd->right_weapon.addclass[CLASS_NORMAL] + sd->left_weapon.addclass[CLASS_NORMAL] + sd->right_weapon.addclass[CLASS_ALL] + sd->left_weapon.addclass[CLASS_ALL], sd->right_weapon.addclass[CLASS_BOSS] + sd->left_weapon.addclass[CLASS_BOSS] + sd->right_weapon.addclass[CLASS_ALL] + sd->left_weapon.addclass[CLASS_ALL]));
	struct {
		const char *format;
		int value;
	} race_atk_info[] = {
		{ "  -> Human-Player: %d%%", sd->right_weapon.addrace[RC_PLAYER_HUMAN] + sd->left_weapon.addrace[RC_PLAYER_HUMAN] + sd->right_weapon.addrace[RC_ALL] + sd->left_weapon.addrace[RC_ALL] },
		{ "  -> Human-Monster: %d%%", sd->right_weapon.addrace[RC_DEMIHUMAN] + sd->left_weapon.addrace[RC_DEMIHUMAN] + sd->right_weapon.addrace[RC_ALL] + sd->left_weapon.addrace[RC_ALL] },
		{ "  -> Doram-Player: %d%%", sd->right_weapon.addrace[RC_PLAYER_DORAM] + sd->left_weapon.addrace[RC_PLAYER_DORAM] + sd->right_weapon.addrace[RC_ALL] + sd->left_weapon.addrace[RC_ALL] },
		{ "  -> Formless: %d%%", sd->right_weapon.addrace[RC_FORMLESS] + sd->left_weapon.addrace[RC_FORMLESS] + sd->right_weapon.addrace[RC_ALL] + sd->left_weapon.addrace[RC_ALL] },
		{ "  -> Undead: %d%%", sd->right_weapon.addrace[RC_UNDEAD] + sd->left_weapon.addrace[RC_UNDEAD] + sd->right_weapon.addrace[RC_ALL] + sd->left_weapon.addrace[RC_ALL] },
		{ "  -> Beast: %d%%", sd->right_weapon.addrace[RC_BRUTE] + sd->left_weapon.addrace[RC_BRUTE] + sd->right_weapon.addrace[RC_ALL] + sd->left_weapon.addrace[RC_ALL] },
		{ "  -> Plant: %d%%", sd->right_weapon.addrace[RC_PLANT] + sd->left_weapon.addrace[RC_PLANT] + sd->right_weapon.addrace[RC_ALL] + sd->left_weapon.addrace[RC_ALL] },
		{ "  -> Insect: %d%%", sd->right_weapon.addrace[RC_INSECT] + sd->left_weapon.addrace[RC_INSECT] + sd->right_weapon.addrace[RC_ALL] + sd->left_weapon.addrace[RC_ALL] },
		{ "  -> Fish: %d%%", sd->right_weapon.addrace[RC_FISH] + sd->left_weapon.addrace[RC_FISH] + sd->right_weapon.addrace[RC_ALL] + sd->left_weapon.addrace[RC_ALL] },
		{ "  -> Demon: %d%%", sd->right_weapon.addrace[RC_DEMON] + sd->left_weapon.addrace[RC_DEMON] + sd->right_weapon.addrace[RC_ALL] + sd->left_weapon.addrace[RC_ALL] },
		{ "  -> Angel: %d%%", sd->right_weapon.addrace[RC_ANGEL] + sd->left_weapon.addrace[RC_ANGEL] + sd->right_weapon.addrace[RC_ALL] + sd->left_weapon.addrace[RC_ALL] },
		{ "  -> Dragon: %d%%", sd->right_weapon.addrace[RC_DRAGON] + sd->left_weapon.addrace[RC_DRAGON] + sd->right_weapon.addrace[RC_ALL] + sd->left_weapon.addrace[RC_ALL] },
	};
	for (int i = 0; i < ARRAYLENGTH(race_atk_info); i++) {
		if (race_atk_info[i].value == 0)
			continue;
		battlestats_msg(sprintf(output, race_atk_info[i].format, race_atk_info[i].value));
	}
	clif_displaymessage(fd, "|--- Bonus Magic Damages ---|");
	battlestats_msg(sprintf(output, "  -> Small Size: %d%% | Medium Size: %d%% | Large Size: %d%%", sd->indexed_bonus.magic_addsize[SZ_SMALL] + sd->indexed_bonus.magic_addsize[SZ_ALL], sd->indexed_bonus.magic_addsize[SZ_MEDIUM] + sd->indexed_bonus.magic_addsize[SZ_ALL], sd->indexed_bonus.magic_addsize[SZ_BIG] + sd->indexed_bonus.magic_addsize[SZ_ALL]));
	battlestats_msg(sprintf(output, "  -> Normal Class: %d%% | Boss Class: %d%%", sd->indexed_bonus.magic_addclass[CLASS_NORMAL] + sd->indexed_bonus.magic_addclass[CLASS_ALL], sd->indexed_bonus.magic_addclass[CLASS_BOSS] + sd->indexed_bonus.magic_addclass[CLASS_ALL]));
	struct {
		const char *format;
		int value;
	} race_matk_info[] = {
		{ "  -> Human-Player: %d%%", sd->indexed_bonus.magic_addrace[RC_PLAYER_HUMAN] + sd->indexed_bonus.magic_addrace[RC_ALL] },
		{ "  -> Human-Monster: %d%%", sd->indexed_bonus.magic_addrace[RC_DEMIHUMAN] + sd->indexed_bonus.magic_addrace[RC_ALL] },
		{ "  -> Doram-Player: %d%%", sd->indexed_bonus.magic_addrace[RC_PLAYER_DORAM] + sd->indexed_bonus.magic_addrace[RC_ALL] },
		{ "  -> Formless: %d%%", sd->indexed_bonus.magic_addrace[RC_FORMLESS] + sd->indexed_bonus.magic_addrace[RC_ALL] },
		{ "  -> Undead: %d%%", sd->indexed_bonus.magic_addrace[RC_UNDEAD] + sd->indexed_bonus.magic_addrace[RC_ALL] },
		{ "  -> Beast: %d%%", sd->indexed_bonus.magic_addrace[RC_BRUTE] + sd->indexed_bonus.magic_addrace[RC_ALL] },
		{ "  -> Plant: %d%%", sd->indexed_bonus.magic_addrace[RC_PLANT] + sd->indexed_bonus.magic_addrace[RC_ALL] },
		{ "  -> Insect: %d%%", sd->indexed_bonus.magic_addrace[RC_INSECT] + sd->indexed_bonus.magic_addrace[RC_ALL] },
		{ "  -> Fish: %d%%", sd->indexed_bonus.magic_addrace[RC_FISH] + sd->indexed_bonus.magic_addrace[RC_ALL] },
		{ "  -> Demon: %d%%", sd->indexed_bonus.magic_addrace[RC_DEMON] + sd->indexed_bonus.magic_addrace[RC_ALL] },
		{ "  -> Angel: %d%%", sd->indexed_bonus.magic_addrace[RC_ANGEL] + sd->indexed_bonus.magic_addrace[RC_ALL] },
		{ "  -> Dragon: %d%%", sd->indexed_bonus.magic_addrace[RC_DRAGON] + sd->indexed_bonus.magic_addrace[RC_ALL] },
	};
	for (int i = 0; i < ARRAYLENGTH(race_matk_info); i++) {
		if (race_matk_info[i].value == 0)
			continue;
		battlestats_msg(sprintf(output, race_matk_info[i].format, race_matk_info[i].value));
	}
	if ( sd->indexed_bonus.subrace[RC_PLAYER_HUMAN]
		|| sd->indexed_bonus.subrace[RC_PLAYER_DORAM]
		|| sd->indexed_bonus.subrace[RC_FORMLESS]
		|| sd->indexed_bonus.subrace[RC_UNDEAD]
		|| sd->indexed_bonus.subrace[RC_BRUTE]
		|| sd->indexed_bonus.subrace[RC_PLANT]
		|| sd->indexed_bonus.subrace[RC_INSECT]
		|| sd->indexed_bonus.subrace[RC_FISH]
		|| sd->indexed_bonus.subrace[RC_DEMIHUMAN]
		|| sd->indexed_bonus.subrace[RC_ANGEL]
		|| sd->indexed_bonus.subrace[RC_DRAGON]
		|| sd->indexed_bonus.subrace[RC_ALL] )
	{
		clif_displaymessage(fd, "|--- Race Resistance ---|");
		struct {
			const char *format;
			int value;
		} race_resist_info[] = {
			{ "  -> Human-Player: %d%% (Max 85%%)", sd->indexed_bonus.subrace[RC_PLAYER_HUMAN] + sd->indexed_bonus.subrace[RC_ALL] },
			{ "  -> Human-Monster: %d%% (Max 85%%)", sd->indexed_bonus.subrace[RC_DEMIHUMAN] + sd->indexed_bonus.subrace[RC_ALL] },
			{ "  -> Doram-Player: %d%% (Max 85%%)", sd->indexed_bonus.subrace[RC_PLAYER_DORAM] + sd->indexed_bonus.subrace[RC_ALL] },
			{ "  -> Formless: %d%% (Max 85%%)", sd->indexed_bonus.subrace[RC_FORMLESS] + sd->indexed_bonus.subrace[RC_ALL] },
			{ "  -> Undead: %d%% (Max 85%%)", sd->indexed_bonus.subrace[RC_UNDEAD] + sd->indexed_bonus.subrace[RC_ALL] },
			{ "  -> Beast: %d%% (Max 85%%)", sd->indexed_bonus.subrace[RC_BRUTE] + sd->indexed_bonus.subrace[RC_ALL] },
			{ "  -> Plant: %d%% (Max 85%%)", sd->indexed_bonus.subrace[RC_PLANT] + sd->indexed_bonus.subrace[RC_ALL] },
			{ "  -> Insect: %d%% (Max 85%%)", sd->indexed_bonus.subrace[RC_INSECT] + sd->indexed_bonus.subrace[RC_ALL] },
			{ "  -> Fish: %d%% (Max 85%%)", sd->indexed_bonus.subrace[RC_FISH] + sd->indexed_bonus.subrace[RC_ALL] },
			{ "  -> Demon: %d%% (Max 85%%)", sd->indexed_bonus.subrace[RC_DEMON] + sd->indexed_bonus.subrace[RC_ALL] },
			{ "  -> Angel: %d%% (Max 85%%)", sd->indexed_bonus.subrace[RC_ANGEL] + sd->indexed_bonus.subrace[RC_ALL] },
			{ "  -> Dragon: %d%% (Max 85%%)", sd->indexed_bonus.subrace[RC_DRAGON] + sd->indexed_bonus.subrace[RC_ALL] },
		};
		for (int i = 0; i < ARRAYLENGTH(race_resist_info); i++) {
			if (race_resist_info[i].value == 0)
				continue;
			battlestats_msg(sprintf(output, race_resist_info[i].format, race_resist_info[i].value));
		}
	}
	if ( sd->indexed_bonus.subclass[CLASS_BOSS]
		|| sd->indexed_bonus.subclass[CLASS_NORMAL]
		|| sd->indexed_bonus.subclass[CLASS_ALL]  )
	{
		clif_displaymessage(fd, "|--- Monster Class Resistance ---|");
		battlestats_msg(sprintf(output, "  -> Normal Class: %d%% (Max 85%%) | Boss Class: %d%% (Max 85%%)", sd->indexed_bonus.subclass[CLASS_NORMAL] + sd->indexed_bonus.subclass[CLASS_ALL], sd->indexed_bonus.subclass[CLASS_BOSS] + sd->indexed_bonus.subclass[CLASS_ALL]));	
	}
	if ( sd->indexed_bonus.subsize[SZ_SMALL]
		|| sd->indexed_bonus.subsize[SZ_MEDIUM]
		|| sd->indexed_bonus.subsize[SZ_BIG]
		|| sd->indexed_bonus.subsize[SZ_ALL] )
	{
		clif_displaymessage(fd, "|--- Monster Size Resistance ---|");
		battlestats_msg(sprintf(output, "  -> Small Size: %d%% (Max 85%%) | Medium Size: %d%% (Max 85%%) | Large Size: %d%% (Max 85%%)", sd->indexed_bonus.subsize[SZ_SMALL] + sd->indexed_bonus.subsize[SZ_ALL], sd->indexed_bonus.subsize[SZ_MEDIUM] + sd->indexed_bonus.subsize[SZ_ALL], sd->indexed_bonus.subsize[SZ_BIG] + sd->indexed_bonus.subsize[SZ_ALL]));
	}
	if ( sd->indexed_bonus.subele_script[ELE_NEUTRAL]
		|| sd->indexed_bonus.subele_script[ELE_WATER]
		|| sd->indexed_bonus.subele_script[ELE_EARTH]
		|| sd->indexed_bonus.subele_script[ELE_FIRE]
		|| sd->indexed_bonus.subele_script[ELE_WIND]
		|| sd->indexed_bonus.subele_script[ELE_POISON]
		|| sd->indexed_bonus.subele_script[ELE_HOLY]
		|| sd->indexed_bonus.subele_script[ELE_DARK]
		|| sd->indexed_bonus.subele_script[ELE_GHOST]
		|| sd->indexed_bonus.subele_script[ELE_UNDEAD]
		|| sd->indexed_bonus.subele_script[ELE_ALL] )
	{
		clif_displaymessage(fd, "|--- Elemental Resistance ---|");
		struct {
			const char *format;
			int value;
		} ele_resist_info[] = {
			{ "  -> Neutral: %d%%(Max 85%%)", sd->indexed_bonus.subele_script[ELE_NEUTRAL] + sd->indexed_bonus.subele_script[ELE_ALL] },
			{ "  -> Water: %d%% (Max 85%%)", sd->indexed_bonus.subele_script[ELE_WATER] + sd->indexed_bonus.subele_script[ELE_ALL] },
			{ "  -> Earth: %d%% (Max 85%%)", sd->indexed_bonus.subele_script[ELE_EARTH] + sd->indexed_bonus.subele_script[ELE_ALL] },
			{ "  -> Fire: %d%% (Max 85%%)", sd->indexed_bonus.subele_script[ELE_FIRE] + sd->indexed_bonus.subele_script[ELE_ALL] },
			{ "  -> Wind: %d%% (Max 85%%)", sd->indexed_bonus.subele_script[ELE_WIND] + sd->indexed_bonus.subele_script[ELE_ALL] },
			{ "  -> Poison: %d%% (Max 85%%)", sd->indexed_bonus.subele_script[ELE_POISON] + sd->indexed_bonus.subele_script[ELE_ALL] },
			{ "  -> Holy: %d%% (Max 85%%)", sd->indexed_bonus.subele_script[ELE_HOLY] + sd->indexed_bonus.subele_script[ELE_ALL] },
			{ "  -> Dark: %d%% (Max 85%%)", sd->indexed_bonus.subele_script[ELE_DARK] + sd->indexed_bonus.subele_script[ELE_ALL] },
			{ "  -> Ghost: %d%% (Max 85%%)", sd->indexed_bonus.subele_script[ELE_GHOST] + sd->indexed_bonus.subele_script[ELE_ALL] },
			{ "  -> Undead: %d%% (Max 85%%)", sd->indexed_bonus.subele_script[ELE_UNDEAD] + sd->indexed_bonus.subele_script[ELE_ALL] },
		};
		for (int i = 0; i < ARRAYLENGTH(ele_resist_info); i++) {
			if (ele_resist_info[i].value == 0)
				continue;
			battlestats_msg(sprintf(output, ele_resist_info[i].format, ele_resist_info[i].value));
		}
	}
	clif_displaymessage(fd, "|--- Other Info ---|");
	battlestats_msg(sprintf(output, "  -> Drop: + %d%%", sd->indexed_bonus.dropaddclass[CLASS_ALL] + sd->indexed_bonus.dropaddrace[RC_ALL]));
	if ( sd->bonus.near_attack_def_rate
		|| sd->bonus.long_attack_def_rate 
		|| sd->bonus.magic_def_rate
		|| sd->bonus.reduce_damage_return )
	{
		struct {
			const char *format;
			int value;
		} other_resis_info[] = {
			{ "  -> ป้องกันระยะใกล้: +%d%%", sd->bonus.near_attack_def_rate },
			{ "  -> ป้องกันระยะไกล: +%d%%", sd->bonus.long_attack_def_rate },
			{ "  -> ป้องกันระยะเวทย์มนต์: +%d%%", sd->bonus.magic_def_rate },	
			{ "  -> ลดดาเมจจาการสะท้อน: +%d%%", sd->bonus.reduce_damage_return },	
		};
		for (int i = 0; i < ARRAYLENGTH(other_resis_info); i++) {
			if (other_resis_info[i].value == 0)
				continue;
			battlestats_msg(sprintf(output, other_resis_info[i].format, other_resis_info[i].value));
		}
	}

#undef battlestats_msg
}

ACMD_FUNC(mystats) {
	nullpo_retr(-1, sd);
	atcommand_battlestats_sub(fd, sd);
	return 0;
}

ACMD_FUNC(enemystats) {
	map_session_data *pl_sd;

	nullpo_retr(-1, sd);

	memset(atcmd_player_name, '\0', sizeof atcmd_player_name);

	if (!message || !*message || sscanf(message, "%23[^\n]", atcmd_player_name) < 1) {
		clif_displaymessage(fd, "Please enter a player name (usage: @enemystats <char name>)");
		return -1;
	}

	pl_sd = map_nick2sd(atcmd_player_name, true);
	if (pl_sd == NULL ||
		strncmp(pl_sd->status.name, atcmd_player_name, NAME_LENGTH) != 0) {
		clif_displaymessage(fd, msg_txt(sd, 3)); // Character not found.
		return -1;
	}

	atcommand_battlestats_sub(fd, pl_sd);
	return 0;
}

