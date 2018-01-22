Configuration IIS
{
	param ($machineName, $bindPort)
	Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
	Node $machineName {
		WindowsFeature IIS {
			Ensure = "Present"
			Name = "Web-Server"
		}
	}
}