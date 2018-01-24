Configuration InstallIIS
{
	param (
		[string]$machineName,
		[int]$bindPort
	)
		
	Import-DscResource -ModuleName PSDesiredStateConfiguration,xWebAdministration,xNetworking
	
	Node $machineName {
		WindowsFeature IIS {
			Ensure = "Present"
			Name = "Web-Server"
		}
		WindowsFeature IISConsole {
			Ensure = "Present"
			Name = "Web-Mgmt-Console"
		}
		
		xWebsite DefaultSite {
			Ensure = "Present"
			Name = "Default Web Site"
			State = "Started"
			PhysicalPath = "C:\inetpub\wwwroot"
			DependsOn = "[WindowsFeature]IIS"
			BindingInfo = MSFT_xWebBindingInformation {
				Protocol = "HTTP"
				Port = $bindPort
			}
		}
		
		xFirewall Firewall
		{
			Name = "IIS $bindPort Rule"
			DisplayName = "IIS $bindPort Rule"
			Ensure = "Present"
			Profile = ("Domain", "Private", "Public")
			Direction = "Inbound"
			LocalPort = $bindPort
			Protocol = "TCP"
			Description = "IIS $bindPort Rule"
		}
	}
}