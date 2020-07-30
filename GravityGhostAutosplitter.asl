state("GravityGhost")
{
	float inGameTimer			: "gameoverlayrenderer.dll", 0x165BB8;
	int levelsCompleted			: "mono.dll", 0x001F494C, 0x80, 0x658, 0xF4, 0x294, 0x50;
	int currentLevel			: "GravityGhost.exe", 0x9FD408; // Main menu is 3 & 1, first cutscene is 7, final planet is 2
	byte reachedBoatTrigger		: "mono.dll", 0x001F2648, 0x198, 0x94, 0x10, 0x7C, 0x4C, 0xC, 0x4, 0x20, 0x14, 0x28;
}


start 
{
	return (current.currentLevel == 7 && (old.currentLevel == 3 || old.currentLevel == 1));
}


reset 
{
	return (current.currentLevel == 7 && (old.currentLevel == 3 || old.currentLevel == 1));
}


split
{
	return ((current.levelsCompleted > old.levelsCompleted)) ||
	((current.currentLevel == 2) && (current.reachedBoatTrigger == 1) && (old.reachedBoatTrigger == 0));
}