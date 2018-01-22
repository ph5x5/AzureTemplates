Configuration IIS
{
	param ($machineName, $bindPort)
	Node $machineName {
		WindowsFeature IIS {
			Ensure = "Present"
			Name = "Web-Server"
		}
	}
}