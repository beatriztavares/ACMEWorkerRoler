<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="ACMEWorkerRoler" generation="1" functional="0" release="0" Id="5412de00-69a2-43de-9561-2e96612727b2" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="ACMEWorkerRolerGroup" generation="1" functional="0" release="0">
      <settings>
        <aCS name="Coiote:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/MapCoiote:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="CoioteInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/MapCoioteInstances" />
          </maps>
        </aCS>
        <aCS name="Papaleguas:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/MapPapaleguas:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="PapaleguasInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/MapPapaleguasInstances" />
          </maps>
        </aCS>
      </settings>
      <maps>
        <map name="MapCoiote:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/Coiote/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapCoioteInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/CoioteInstances" />
          </setting>
        </map>
        <map name="MapPapaleguas:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/Papaleguas/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapPapaleguasInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/PapaleguasInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="Coiote" generation="1" functional="0" release="0" software="C:\Users\Beatriz Tavares\Desktop\projetos\ACMEWorkerRolers\ACMEWorkerRoler\ACMEWorkerRoler\csx\Debug\roles\Coiote" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;Coiote&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;Coiote&quot; /&gt;&lt;r name=&quot;Papaleguas&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/CoioteInstances" />
            <sCSPolicyUpdateDomainMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/CoioteUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/CoioteFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
        <groupHascomponents>
          <role name="Papaleguas" generation="1" functional="0" release="0" software="C:\Users\Beatriz Tavares\Desktop\projetos\ACMEWorkerRolers\ACMEWorkerRoler\ACMEWorkerRoler\csx\Debug\roles\Papaleguas" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;Papaleguas&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;Coiote&quot; /&gt;&lt;r name=&quot;Papaleguas&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/PapaleguasInstances" />
            <sCSPolicyUpdateDomainMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/PapaleguasUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/PapaleguasFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="CoioteUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyUpdateDomain name="PapaleguasUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="CoioteFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyFaultDomain name="PapaleguasFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="CoioteInstances" defaultPolicy="[1,1,1]" />
        <sCSPolicyID name="PapaleguasInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
</serviceModel>