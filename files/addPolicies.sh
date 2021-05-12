version=$(curl -q -k -u $TL_USER:$TL_PASS -H 'Content-Type: application/json' -X GET https://$TL_CONSOLE/api/v1/version | sed -e 's/"//' |cut -d. -f1)

if [ "$version" -lt 21 ]
then
 #version<21"
 runtime_payload='{"_id":"containerRuntime","rules":[{"modified":"2021-03-19T15:08:13.110Z","owner":"srohatyn_paloaltonetworks_com","name":"Demo_Rule_Runtime","previousName":"Demo_Rule_Runtime","collections":[{"hosts":["*"],"images":["*evilpetclinic*"],"labels":["*"],"containers":["*"],"functions":["*"],"namespaces":["*"],"appIDs":["*"],"accountIDs":["*"],"codeRepos":["*"],"clusters":["*"],"name":"evilpetclinic","owner":"srohatyn_paloaltonetworks_com","modified":"2021-01-20T09:55:41.982Z","color":"#68DCFC","system":false}],"advancedProtection":true,"processes":{"effect":"prevent","blacklist":[],"whitelist":["bash"],"checkCryptoMiners":true,"checkLateralMovement":true},"network":{"effect":"alert","blacklistIPs":[],"blacklistListeningPorts":[],"whitelistListeningPorts":[],"blacklistOutboundPorts":[],"whitelistOutboundPorts":[],"whitelistIPs":[],"skipModifiedProc":false,"detectPortScan":true,"skipRawSockets":false},"dns":{"effect":"prevent","whitelist":["cdn.twistlock.com","storage.googleapis.com"],"blacklist":["github.com"]},"filesystem":{"effect":"prevent","blacklist":["/secret"],"whitelist":[],"checkNewFiles":true,"backdoorFiles":true},"kubernetesEnforcement":true,"cloudMetadataEnforcement":true,"customRules":[{"name":"Twistlock Labs - Suspicious networking tool","_id":16,"type":"processes","script":"proc.name in (\"nc.openbsd\", \"nc\", \"ncat\", \"nmap\", \"socat\")","description":"Detect launching of suspicious networking tool","message":"Suspicious networking tool %proc.name was launched by %proc.user","owner":"system","modified":1611075844,"effect":"prevent","action":"audit"}]},{"modified":"2020-12-31T16:25:36.271Z","owner":"srohatyn_paloaltonetworks_com","name":"demo_build - Ignore Infra","previousName":"","notes":"demo_build - Ignore Infra","collections":[{"hosts":["*"],"images":["*gogs*","*jenkins*","*maildev*","*nexus3*","*openldap*","*postgres*","*selenium*","*splunk*","*twistlock/defender*","*twistlock/console*"],"labels":["*"],"containers":["*"],"namespaces":["*"],"accountIDs":["*"],"clusters":["*"],"name":"Infrastructure-Components","owner":"srohatyn_paloaltonetworks_com","modified":"2021-01-19T17:21:40.083Z","color":"#a5a219","description":"Infrastructure Components","system":false}],"advancedProtection":false,"processes":{"effect":"disable","blacklist":[],"whitelist":[],"checkCryptoMiners":true,"checkLateralMovement":true},"network":{"effect":"disable","blacklistIPs":[],"blacklistListeningPorts":[],"whitelistListeningPorts":[],"blacklistOutboundPorts":[],"whitelistOutboundPorts":[],"whitelistIPs":[],"skipModifiedProc":false,"detectPortScan":true,"skipRawSockets":false},"dns":{"effect":"disable","whitelist":[],"blacklist":[]},"filesystem":{"effect":"disable","blacklist":[],"whitelist":[],"checkNewFiles":true,"backdoorFiles":true},"kubernetesEnforcement":false,"cloudMetadataEnforcement":false},{"modified":"2020-12-31T16:25:35.921Z","owner":"srohatyn_paloaltonetworks_com","name":"Default - alert on suspicious runtime behavior","previousName":"","collections":[{"hosts":["*"],"images":["*"],"labels":["*"],"containers":["*"],"functions":["*"],"namespaces":["*"],"appIDs":["*"],"accountIDs":["*"],"codeRepos":["*"],"clusters":["*"],"name":"All","owner":"system","modified":"2021-01-19T17:04:04.288Z","color":"#3FA2F7","description":"System - all resources collection","system":true}],"advancedProtection":true,"processes":{"effect":"alert","blacklist":[],"whitelist":[],"checkCryptoMiners":true,"checkLateralMovement":true,"checkParentChild":true},"network":{"effect":"alert","blacklistIPs":[],"blacklistListeningPorts":[],"whitelistListeningPorts":[],"blacklistOutboundPorts":[],"whitelistOutboundPorts":[],"whitelistIPs":[],"skipModifiedProc":false,"detectPortScan":true,"skipRawSockets":false},"dns":{"effect":"alert","whitelist":[],"blacklist":[]},"filesystem":{"effect":"alert","blacklist":[],"whitelist":[],"checkNewFiles":true,"backdoorFiles":true},"kubernetesEnforcement":true,"cloudMetadataEnforcement":true,"customRules":[{"_id":26,"action":"audit","effect":"alert"},{"_id":23,"action":"audit","effect":"alert"},{"_id":19,"action":"audit","effect":"alert"}]}],"learningDisabled":false}' 
 waas_payload='{"_id":"containerAppFirewall","rules":[{"applicationsSpec":[{"banDurationMinutes":5,"apiSpec":{"endpoints":[{"host":"*","internalPort":80,"basePath":"*"}],"effect":"disable","fallbackEffect":"disable","paths":[]},"botProtectionSpec":{"userDefinedBots":[],"knownBotProtectionsSpec":{"searchEngineCrawlers":"disable","businessAnalytics":"disable","educational":"disable","news":"disable","financial":"disable","contentFeedClients":"disable","archiving":"disable","careerSearch":"disable","mediaSearch":"disable"},"unknownBotProtectionSpec":{"generic":"disable","webAutomationTools":"disable","webScrapers":"disable","apiLibraries":"disable","httpLibraries":"disable","botImpersonation":"disable","browserImpersonation":"disable","requestAnomalies":{"effect":"disable","threshold":9}},"sessionValidation":"disable","jsInjectionSpec":{"enabled":false,"timeoutEffect":"disable"}},"dosConfig":{"effect":"disable","matchCriteria":[],"matchConditions":[]},"networkControls":{"advancedProtectionEffect":"prevent","deniedSubnets":[],"deniedSubnetsEffect":"alert","allowedSubnets":[],"deniedCountries":[],"deniedCountriesEffect":"alert","allowedCountries":[],"allowedCountriesEffect":"alert"},"xss":{"effect":"prevent","exceptionFields":[]},"sqli":{"effect":"prevent","exceptionFields":[]},"cmdi":{"effect":"prevent","exceptionFields":[]},"lfi":{"effect":"prevent","exceptionFields":[]},"codeInjection":{"effect":"prevent","exceptionFields":[]},"attackTools":{"effect":"prevent","exceptionFields":[]},"shellshock":{"effect":"prevent"},"malformedReq":{"effect":"prevent"},"headerSpecs":[],"csrfEnabled":true,"clickjackingEnabled":true,"intelGathering":{"infoLeakageEffect":"prevent","removeFingerprintsEnabled":true},"maliciousUpload":{"effect":"disable","allowedFileTypes":[],"allowedExtensions":[]},"body":{"skip":false,"inspectionSizeBytes":131072},"certificate":{}}],"collections":[{"hosts":["*"],"images":["*evilpetclinic*"],"labels":["*"],"containers":["*"],"functions":["*"],"namespaces":["*"],"appIDs":["*"],"accountIDs":["*"],"codeRepos":["*"],"clusters":["*"],"name":"evilpetclinic","owner":"srohatyn_paloaltonetworks_com","modified":"2021-01-20T09:55:41.982Z","color":"#68DCFC","system":false,"selected":true}],"name":"Evil_WAAS_Rule","owner":"srohatyn_paloaltonetworks_com","modified":"2021-01-20T10:11:29.411Z"},{"modified":"2021-01-19T17:22:07.956Z","owner":"srohatyn_paloaltonetworks_com","name":"demo_build - DVWA","previousName":"","collections":[{"hosts":["*"],"images":["vulnerables/web-dvwa:latest"],"labels":["*"],"containers":["*"],"namespaces":["*"],"accountIDs":["*"],"clusters":["*"],"name":"DVWA","owner":"srohatyn_paloaltonetworks_com","modified":"2021-01-19T17:21:40.349Z","color":"#033ea6","description":"DVWA for WAAS Demo","system":false}],"applicationsSpec":[{"banDurationMinutes":5,"certificate":{"encrypted":""},"dosConfig":{"effect":"disable"},"apiSpec":{"description":"DVWA","endpoints":[{"host":"*","basePath":"*","exposedPort":0,"internalPort":80,"tls":false,"http2":false}],"effect":"disable","fallbackEffect":"disable"},"botProtectionSpec":{"userDefinedBots":[],"knownBotProtectionsSpec":{"searchEngineCrawlers":"alert","businessAnalytics":"alert","educational":"alert","news":"alert","financial":"alert","contentFeedClients":"alert","archiving":"alert","careerSearch":"alert","mediaSearch":"alert"},"unknownBotProtectionSpec":{"generic":"alert","webAutomationTools":"alert","webScrapers":"alert","apiLibraries":"alert","httpLibraries":"alert","botImpersonation":"alert","browserImpersonation":"alert","requestAnomalies":{"threshold":9,"effect":"alert"}},"sessionValidation":"disable","interstitialPage":false,"jsInjectionSpec":{"enabled":false,"timeoutEffect":"disable"}},"networkControls":{"advancedProtectionEffect":"alert","deniedSubnetsEffect":"alert","deniedCountriesEffect":"alert","allowedCountriesEffect":"alert"},"body":{"inspectionSizeBytes":131072},"intelGathering":{"infoLeakageEffect":"disable","removeFingerprintsEnabled":true},"maliciousUpload":{"effect":"disable","allowedFileTypes":[],"allowedExtensions":[]},"csrfEnabled":true,"clickjackingEnabled":true,"sqli":{"effect":"alert","exceptionFields":[]},"xss":{"effect":"alert","exceptionFields":[]},"attackTools":{"effect":"alert","exceptionFields":[]},"shellshock":{"effect":"alert","exceptionFields":[]},"malformedReq":{"effect":"alert","exceptionFields":[]},"cmdi":{"effect":"alert","exceptionFields":[]},"lfi":{"effect":"alert","exceptionFields":[]},"codeInjection":{"effect":"alert","exceptionFields":[]},"remoteHostForwarding":{}}]}],"minPort":30000,"maxPort":31000}' 
else
 #version>=21
 runtime_payload='{ "_id": "containerRuntime", "rules": [ { "modified": "2021-03-19T15:08:13.110Z", "owner": "srohatyn_paloaltonetworks_com", "name": "Demo_Rule_Runtime", "previousName": "Demo_Rule_Runtime", "collections": [ { "hosts": [ "*" ], "images": [ "*evilpetclinic*" ], "labels": [ "*" ], "containers": [ "*" ], "functions": [ "*" ], "namespaces": [ "*" ], "appIDs": [ "*" ], "accountIDs": [ "*" ], "codeRepos": [ "*" ], "clusters": [ "*" ], "name": "evilpetclinic", "owner": "srohatyn_paloaltonetworks_com", "modified": "2021-01-20T09:55:41.982Z", "color": "#68DCFC", "system": false } ], "advancedProtection": true, "wildFireAnalysis": "alert", "processes": { "effect": "alert", "blacklist": [], "whitelist": [ "bash" ], "checkCryptoMiners": true, "checkLateralMovement": true }, "network": { "effect": "alert", "blacklistIPs": [], "blacklistListeningPorts": [], "whitelistListeningPorts": [], "blacklistOutboundPorts": [], "whitelistOutboundPorts": [], "whitelistIPs": [], "skipModifiedProc": false, "detectPortScan": true, "skipRawSockets": false }, "dns": { "effect": "prevent", "whitelist": [ "cdn.twistlock.com", "storage.googleapis.com", "*.paloaltonetworks.com" ], "blacklist": [ "github.com" ] }, "filesystem": { "effect": "alert", "blacklist": [ "/secret" ], "whitelist": [], "checkNewFiles": true, "backdoorFiles": true }, "kubernetesEnforcement": true, "cloudMetadataEnforcement": true, "customRules": [ { "name": "Twistlock Labs - Suspicious networking tool", "_id": 16, "type": "processes", "script": "proc.name in (\"nc.openbsd\", \"nc\", \"ncat\", \"nmap\", \"socat\")", "description": "Detect launching of suspicious networking tool", "message": "Suspicious networking tool %proc.name was launched by %proc.user", "owner": "system", "modified": 1611075844, "effect": "block", "action": "audit" } ] }, { "modified": "2020-12-31T16:25:36.271Z", "owner": "srohatyn_paloaltonetworks_com", "name": "demo_build - Ignore Infra", "previousName": "", "notes": "demo_build - Ignore Infra", "collections": [ { "hosts": [ "*" ], "images": [ "*gogs*", "*jenkins*", "*maildev*", "*nexus3*", "*openldap*", "*postgres*", "*selenium*", "*splunk*", "*twistlock/defender*", "*twistlock/console*" ], "labels": [ "*" ], "containers": [ "*" ], "namespaces": [ "*" ], "accountIDs": [ "*" ], "clusters": [ "*" ], "name": "Infrastructure-Components", "owner": "srohatyn_paloaltonetworks_com", "modified": "2021-01-19T17:21:40.083Z", "color": "#a5a219", "description": "Infrastructure Components", "system": false } ], "advancedProtection": false, "wildFireAnalysis": "alert", "processes": { "effect": "disable", "blacklist": [], "whitelist": [], "checkCryptoMiners": true, "checkLateralMovement": true }, "network": { "effect": "disable", "blacklistIPs": [], "blacklistListeningPorts": [], "whitelistListeningPorts": [], "blacklistOutboundPorts": [], "whitelistOutboundPorts": [], "whitelistIPs": [], "skipModifiedProc": false, "detectPortScan": true, "skipRawSockets": false }, "dns": { "effect": "disable", "whitelist": [], "blacklist": [] }, "filesystem": { "effect": "disable", "blacklist": [], "whitelist": [], "checkNewFiles": true, "backdoorFiles": true }, "kubernetesEnforcement": false, "cloudMetadataEnforcement": false }, { "modified": "2020-12-31T16:25:35.921Z", "owner": "srohatyn_paloaltonetworks_com", "name": "Default - alert on suspicious runtime behavior", "previousName": "", "collections": [ { "hosts": [ "*" ], "images": [ "*" ], "labels": [ "*" ], "containers": [ "*" ], "functions": [ "*" ], "namespaces": [ "*" ], "appIDs": [ "*" ], "accountIDs": [ "*" ], "codeRepos": [ "*" ], "clusters": [ "*" ], "name": "All", "owner": "system", "modified": "2021-01-19T17:04:04.288Z", "color": "#3FA2F7", "description": "System - all resources collection", "system": true } ], "advancedProtection": true, "wildFireAnalysis": "alert", "processes": { "effect": "alert", "blacklist": [], "whitelist": [], "checkCryptoMiners": true, "checkLateralMovement": true, "checkParentChild": true }, "network": { "effect": "alert", "blacklistIPs": [], "blacklistListeningPorts": [], "whitelistListeningPorts": [], "blacklistOutboundPorts": [], "whitelistOutboundPorts": [], "whitelistIPs": [], "skipModifiedProc": false, "detectPortScan": true, "skipRawSockets": false }, "dns": { "effect": "alert", "whitelist": [], "blacklist": [] }, "filesystem": { "effect": "alert", "blacklist": [], "whitelist": [], "checkNewFiles": true, "backdoorFiles": true }, "kubernetesEnforcement": true, "cloudMetadataEnforcement": true, "customRules": [ { "_id": 26, "action": "audit", "effect": "alert" }, { "_id": 23, "action": "audit", "effect": "alert" }, { "_id": 19, "action": "audit", "effect": "alert" } ] } ], "learningDisabled": false }' 
 waas_payload='{ "_id": "containerAppFirewall", "rules": [ { "applicationsSpec": [ { "appID": "1337", "banDurationMinutes": 5, "apiSpec": { "endpoints": [ { "host": "*", "internalPort": 8080, "basePath": "*" } ], "effect": "disable", "fallbackEffect": "disable", "paths": [] }, "botProtectionSpec": { "userDefinedBots": [], "knownBotProtectionsSpec": { "searchEngineCrawlers": "disable", "businessAnalytics": "disable", "educational": "disable", "news": "disable", "financial": "disable", "contentFeedClients": "disable", "archiving": "disable", "careerSearch": "disable", "mediaSearch": "disable" }, "unknownBotProtectionSpec": { "generic": "disable", "webAutomationTools": "disable", "webScrapers": "disable", "apiLibraries": "disable", "httpLibraries": "disable", "botImpersonation": "disable", "browserImpersonation": "disable", "requestAnomalies": { "effect": "disable", "threshold": 9 } }, "sessionValidation": "disable", "jsInjectionSpec": { "enabled": false, "timeoutEffect": "disable" } }, "dosConfig": { "effect": "disable", "matchCriteria": [], "matchConditions": [] }, "networkControls": { "advancedProtectionEffect": "prevent", "subnets": { "enabled": false, "allowMode": true, "allow": [], "fallbackEffect": "alert", "alert": null, "prevent": null, "blockingMode": "allowed" }, "countries": { "enabled": false, "allowMode": true, "allow": [], "fallbackEffect": "alert", "alert": null, "prevent": null, "blockingMode": "allowed" }, "exceptionSubnets": [] }, "xss": { "effect": "prevent", "exceptionFields": [] }, "sqli": { "effect": "prevent", "exceptionFields": [] }, "cmdi": { "effect": "prevent", "exceptionFields": [] }, "lfi": { "effect": "prevent", "exceptionFields": [] }, "codeInjection": { "effect": "prevent", "exceptionFields": [] }, "attackTools": { "effect": "prevent", "exceptionFields": [] }, "shellshock": { "effect": "prevent" }, "malformedReq": { "effect": "prevent" }, "headerSpecs": [], "csrfEnabled": true, "clickjackingEnabled": true, "intelGathering": { "infoLeakageEffect": "prevent", "removeFingerprintsEnabled": true }, "maliciousUpload": { "effect": "disable", "allowedFileTypes": [], "allowedExtensions": [] }, "body": { "skip": false, "inspectionSizeBytes": 131072 }, "certificate": {} } ], "collections": [ { "hosts": [ "*" ], "images": [ "*evilpetclinic*" ], "labels": [ "*" ], "containers": [ "*" ], "functions": [ "*" ], "namespaces": [ "*" ], "appIDs": [ "*" ], "accountIDs": [ "*" ], "codeRepos": [ "*" ], "clusters": [ "*" ], "name": "evilpetclinic", "owner": "srohatyn_paloaltonetworks_com", "modified": "2021-01-20T09:55:41.982Z", "color": "#68DCFC", "system": false, "selected": true } ], "name": "Evil_WAAS_Rule", "owner": "srohatyn_paloaltonetworks_com", "modified": "2021-01-20T10:11:29.411Z" }, { "modified": "2021-01-19T17:22:07.956Z", "owner": "srohatyn_paloaltonetworks_com", "name": "demo_build - DVWA", "previousName": "", "collections": [ { "hosts": [ "*" ], "images": [ "vulnerables/web-dvwa:latest" ], "labels": [ "*" ], "containers": [ "*" ], "namespaces": [ "*" ], "accountIDs": [ "*" ], "clusters": [ "*" ], "name": "DVWA", "owner": "srohatyn_paloaltonetworks_com", "modified": "2021-01-19T17:21:40.349Z", "color": "#033ea6", "description": "DVWA for WAAS Demo", "system": false } ], "applicationsSpec": [ { "appID": "1338", "banDurationMinutes": 5, "certificate": { "encrypted": "" }, "dosConfig": { "effect": "disable" }, "apiSpec": { "description": "DVWA", "endpoints": [ { "host": "*", "basePath": "*", "exposedPort": 0, "internalPort": 80, "tls": false, "http2": false } ], "effect": "disable", "fallbackEffect": "disable" }, "botProtectionSpec": { "userDefinedBots": [], "knownBotProtectionsSpec": { "searchEngineCrawlers": "alert", "businessAnalytics": "alert", "educational": "alert", "news": "alert", "financial": "alert", "contentFeedClients": "alert", "archiving": "alert", "careerSearch": "alert", "mediaSearch": "alert" }, "unknownBotProtectionSpec": { "generic": "alert", "webAutomationTools": "alert", "webScrapers": "alert", "apiLibraries": "alert", "httpLibraries": "alert", "botImpersonation": "alert", "browserImpersonation": "alert", "requestAnomalies": { "threshold": 9, "effect": "alert" } }, "sessionValidation": "disable", "interstitialPage": false, "jsInjectionSpec": { "enabled": false, "timeoutEffect": "disable" } }, "networkControls": { "advancedProtectionEffect": "alert", "subnets": { "enabled": false, "allowMode": true, "allow": [], "fallbackEffect": "alert", "alert": null, "prevent": null, "blockingMode": "allowed" }, "countries": { "enabled": false, "allowMode": true, "allow": [], "fallbackEffect": "alert", "alert": null, "prevent": null, "blockingMode": "allowed" }, "exceptionSubnets": [] }, "body": { "inspectionSizeBytes": 131072 }, "intelGathering": { "infoLeakageEffect": "disable", "removeFingerprintsEnabled": true }, "maliciousUpload": { "effect": "disable", "allowedFileTypes": [], "allowedExtensions": [] }, "csrfEnabled": true, "clickjackingEnabled": true, "sqli": { "effect": "alert", "exceptionFields": [] }, "xss": { "effect": "alert", "exceptionFields": [] }, "attackTools": { "effect": "alert", "exceptionFields": [] }, "shellshock": { "effect": "alert", "exceptionFields": [] }, "malformedReq": { "effect": "alert", "exceptionFields": [] }, "cmdi": { "effect": "alert", "exceptionFields": [] }, "lfi": { "effect": "alert", "exceptionFields": [] }, "codeInjection": { "effect": "alert", "exceptionFields": [] }, "remoteHostForwarding": {} } ] } ], "minPort": 30000, "maxPort": 31000 }' 
fi

curl -k \
  -u $TL_USER:$TL_PASS \
  -H 'Content-Type: application/json' \
  -X POST \
  -d '{"name":"evilpetclinic","containers":["*"],"hosts":["*"],"images":["*evilpetclinic*"],"labels":["*"],"appIDs":["*"],"functions":["*"],"namespaces":["*"],"accountIDs":["*"],"codeRepos":["*"],"clusters":["*"],"color":"#68DCFC"}' \
  https://$TL_CONSOLE/api/v1/collections


curl -k \
  -u $TL_USER:$TL_PASS \
  -H 'Content-Type: application/json' \
  -X PUT \
  -d "$runtime_payload" \
  https://$TL_CONSOLE/api/v1/policies/runtime/container


status=$?

if [ $status -eq 0 ]
then
  echo "Successfully installed Runtime policies, among which Demo_Rule"
else
  echo "Runtime policy install failed, $status"
fi


curl -k \
  -u $TL_USER:$TL_PASS \
  -H 'Content-Type: application/json' \
  -X PUT \
  -d '{"rules":[{"modified":"2021-01-20T10:10:13.396Z","owner":"srohatyn_paloaltonetworks_com","name":"Demo_Vuln_Rule","previousName":"Demo_Vuln_Rule","effect":"alert","collections":[{"hosts":["*"],"images":["*evilpetclinic*"],"labels":["*"],"containers":["*"],"functions":["*"],"namespaces":["*"],"appIDs":["*"],"accountIDs":["*"],"codeRepos":["*"],"clusters":["*"],"name":"evilpetclinic","owner":"srohatyn_paloaltonetworks_com","modified":"2021-01-20T09:55:41.982Z","color":"#68DCFC","system":false}],"action":["*"],"condition":{"readonly":false,"device":"","vulnerabilities":[]},"group":["*"],"alertThreshold":{"disabled":false,"value":1},"blockThreshold":{"enabled":false,"value":0},"graceDays":0,"verbose":false,"allCompliance":false,"onlyFixed":false,"cveRules":[],"tags":[]},{"modified":"2020-12-31T16:25:29.357Z","owner":"srohatyn_paloaltonetworks_com","name":"ATO-FrontEnd","previousName":"","disabled":true,"effect":"alert","collections":[{"hosts":["*"],"images":["*"],"labels":["ato:ATO-FrontEnd"],"containers":["*"],"accountIDs":["*"],"name":"ATO-FrontEnd","owner":"srohatyn_paloaltonetworks_com","modified":"2021-01-19T17:21:40.415Z","color":"#207f62","description":"ATO for all containers accessed through the NGINX ingress controller","system":false}],"action":["*"],"condition":{"readonly":false,"device":"","vulnerabilities":[]},"group":["*"],"alertThreshold":{"disabled":false,"value":1},"blockThreshold":{"enabled":true,"value":1},"onlyFixed":true,"tags":[{"effect":"ignore","name":"ATO-FrontEnd-Mitigating_Controls","description":"Ignore mitigating controls for 1 yr","expiration":{"enabled":true,"date":"2021-07-02T05:00:00Z"}},{"effect":"ignore","name":"ATO-FrontEnd-POAM","description":"Ignore POAMed vulnerabilities for 6 months","expiration":{"enabled":true,"date":"2021-01-02T06:00:00Z"}}],"graceDays":0},{"modified":"2020-12-31T16:25:29.357Z","owner":"srohatyn_paloaltonetworks_com","name":"demo_build - Product Sock Shop","previousName":"","effect":"alert","collections":[{"hosts":["*"],"images":["*"],"labels":["*"],"containers":["*"],"namespaces":["sock-shop"],"accountIDs":["*"],"name":"Sock-Shop","owner":"srohatyn_paloaltonetworks_com","modified":"2021-01-19T17:21:40.548Z","color":"#86a21a","description":"Sock-Shop Namespace","system":false}],"action":["*"],"condition":{"readonly":false,"device":"","vulnerabilities":[]},"group":["*"],"alertThreshold":{"disabled":false,"value":4},"blockThreshold":{"enabled":false,"value":0},"onlyFixed":true,"graceDays":0},{"modified":"2020-12-31T16:25:29.357Z","owner":"system","name":"Default - ignore Twistlock components","previousName":"","effect":"alert","collections":[{"hosts":["*"],"images":["*twistlock*"],"labels":["*"],"containers":["*"],"functions":["*"],"namespaces":["*"],"appIDs":["*"],"accountIDs":["*"],"codeRepos":["*"],"clusters":["*"],"name":"Prisma Cloud resources","owner":"system","modified":"2021-01-19T17:04:04.288Z","color":"#021745","description":"System - Prisma Cloud images and containers collection","system":true}],"action":["*"],"condition":{"readonly":false,"device":"","vulnerabilities":[]},"group":["*"],"alertThreshold":{"disabled":false,"value":4},"blockThreshold":{"enabled":false,"value":0},"onlyFixed":true,"graceDays":0},{"modified":"2020-12-31T16:25:29.357Z","owner":"system","name":"Default - alert all components","previousName":"","effect":"alert","collections":[{"hosts":["*"],"images":["*"],"labels":["*"],"containers":["*"],"functions":["*"],"namespaces":["*"],"appIDs":["*"],"accountIDs":["*"],"codeRepos":["*"],"clusters":["*"],"name":"All","owner":"system","modified":"2021-01-19T17:04:04.288Z","color":"#3FA2F7","description":"System - all resources collection","system":true}],"condition":{"readonly":false,"device":"","vulnerabilities":[]},"alertThreshold":{"disabled":false,"value":0},"blockThreshold":{"enabled":false,"value":0},"graceDays":0}],"policyType":"containerVulnerability","_id":"containerVulnerability","type":"vulnerability","policyContext":"images"}' \
  https://$TL_CONSOLE/api/v1/policies/vulnerability/images

status=$?

if [ $status -eq 0 ]
then
  echo "Successfully installed image vulnerability policies, among which Demo_Vuln_Rule"
else
  echo "Vulnerability policy install failed, $status"
fi


curl -k \
  -u $TL_USER:$TL_PASS \
  -H 'Content-Type: application/json' \
  -X PUT \
  -d "$waas_payload" \
   https://$TL_CONSOLE/api/v1/policies/firewall/app/container

status=$?

if [ $status -eq 0 ]
then
  echo "Successfully installed container WAAS policies, among which Demo_WAAS_Rule"
else
  echo "Container WAAS policy install failed, $status"
fi
