class CfgRemoteExec
{
	class Functions
	{
		mode = 2;
		jip = 0;
		class fnc_AdminReq { allowedTargets=2; };
		class ExileServer_system_network_dispatchIncomingMessage { allowedTargets=2; };
		class APOC_srv_startAirdrop { allowedTargets=2;};
		class ExileSecurity_AlarmLights { allowedTargets=1; };
	};
	class Commands
	{
		mode=0;
		jip=0;
	};
};