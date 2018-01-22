Configuration IIS
{
	param ($machineName, $bindPort)
	Import-DscResource -ModuleName 'PSDesiredStateConfiguration','xWebAdministration'
	Node $machineName {
		WindowsFeature IIS {
			Ensure = "Present"
			Name = "Web-Server"
		}
		xWebSite Website
		{
			Name = 'Website'
			PhysicalPath = 'D:\Webroot\website\'
			ApplicationPool = 'AppPool'
			BindingInfo = @(
				MSFT_xWebBindingInformation
				{
					Protocol = 'HTTP'
					Port = $bindPort
					IPAddress = '*'
				}
			)
		}
	}
}