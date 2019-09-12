## Main features on monitoring

```mermaid
graph TD;
    monitoring-->metrics;
    monitoring-->alerts;
    alerts-->silencing;
    alerts-->simple-conditions;
    monitoring-->graphing;
```

## Open source monitoring solutions

```mermaid
graph TD;
    monitoring-->nagios;
    monitoring-->zabbix;
    monitoring-->prometheus;
    monitoring-->icinga;
    icinga-->cpp
    icinga-->postgresql;
```
