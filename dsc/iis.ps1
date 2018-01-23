Configuration InstallIIS
{
	param (
		[string]$machineName
	)
	Node $machineName {
		WindowsFeature IIS {
			Ensure = "Present"
			Name = "Web-Server"
		}
	}
|