/* automatically generated by ./store_modules.sh diskd aufs coss ufs
 * do not edit
 */
#include "squid.h"

extern STSETUP storeFsSetup_diskd;
extern STSETUP storeFsSetup_aufs;
extern STSETUP storeFsSetup_coss;
extern STSETUP storeFsSetup_ufs;
void storeFsSetup(void)
{
	storeFsAdd("diskd", storeFsSetup_diskd);
	storeFsAdd("aufs", storeFsSetup_aufs);
	storeFsAdd("coss", storeFsSetup_coss);
	storeFsAdd("ufs", storeFsSetup_ufs);
}
