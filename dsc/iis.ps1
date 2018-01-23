Configuration InstallIIS
{
	Node $machineName {
		WindowsFeature IIS {
			Ensure = "Present"
			Name = "Web-Server"
		}
	}
|