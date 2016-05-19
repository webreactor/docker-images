
<Processor pdb-json-server>
    Module      pm_pattern
    PatternFile /etc/nxlog/patterndb.xml
</Processor>

<Output json-server>
    Module          om_tcp
    Host            {json-server-host}
    Port            {json-server-port}
    Exec    delete($EventReceivedTime); \
            delete($SourceModuleType); \
            delete($SyslogFacilityValue); \
            delete($SyslogFacility); \
            delete($SyslogSeverityValue); \
            delete($SyslogSeverity); \
            delete($PatternID); \
            delete($SeverityValue); \
            $type = '{json-server-log-type}'; \
            to_json();
</Output>

<Route 1>
    Path    syslog => pdb-json-server => json-server
</Route>
