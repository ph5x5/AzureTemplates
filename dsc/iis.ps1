Configuration InstallIIS
{
	param (
		[string]$machineName
	)
	Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
	Node $machineName {
		WindowsFeature IIS {
			Ensure = "Present"
			Name = "Web-Server"
		}
	}
|