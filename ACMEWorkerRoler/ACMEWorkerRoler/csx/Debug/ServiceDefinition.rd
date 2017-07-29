<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="ACMEWorkerRoler" generation="1" functional="0" release="0" Id="35d42b84-d548-43f4-b56f-2d8c3eae012d" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="ACMEWorkerRolerGroup" generation="1" functional="0" release="0">
      <settings>
        <aCS name="Coyote:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/MapCoyote:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="CoyoteInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/MapCoyoteInstances" />
          </maps>
        </aCS>
        <aCS name="Papa-leguas:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/MapPapa-leguas:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="Papa-leguasInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/MapPapa-leguasInstances" />
          </maps>
        </aCS>
      </settings>
      <maps>
        <map name="MapCoyote:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/Coyote/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapCoyoteInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/CoyoteInstances" />
          </setting>
        </map>
        <map name="MapPapa-leguas:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/Papa-leguas/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapPapa-leguasInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/Papa-leguasInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="Coyote" generation="1" functional="0" release="0" software="C:\Users\Beatriz Tavares\Desktop\projetos\ACMEWorkerRoler\ACMEWorkerRoler\ACMEWorkerRoler\csx\Debug\roles\Coyote" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;Coyote&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;Coyote&quot; /&gt;&lt;r name=&quot;Papa-leguas&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/CoyoteInstances" />
            <sCSPolicyUpdateDomainMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/CoyoteUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/CoyoteFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
        <groupHascomponents>
          <role name="Papa-leguas" generation="1" functional="0" release="0" software="C:\Users\Beatriz Tavares\Desktop\projetos\ACMEWorkerRoler\ACMEWorkerRoler\ACMEWorkerRoler\csx\Debug\roles\Papa-leguas" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;Papa-leguas&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;Coyote&quot; /&gt;&lt;r name=&quot;Papa-leguas&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/Papa-leguasInstances" />
            <sCSPolicyUpdateDomainMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/Papa-leguasUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/ACMEWorkerRoler/ACMEWorkerRolerGroup/Papa-leguasFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="CoyoteUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyUpdateDomain name="Papa-leguasUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="CoyoteFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyFaultDomain name="Papa-leguasFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="CoyoteInstances" defaultPolicy="[1,1,1]" />
        <sCSPolicyID name="Papa-leguasInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
</serviceModel>