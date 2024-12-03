# Deploy PowerShell Universal Action

This action deploys a PowerShell Universal configuration to a Universal server. It uses the current repository as the source of the configuration.

## Inputs

## `url`

**Required** The URL of the PowerShell Universal

## `apptoken`

**Required** The app token for the PowerShell Universal server.

## `name`

**Required** The name of the configuration to deploy. Defaults to `PowerShellUniversal`.

## `version`

**Required** The version of the configuration to deploy. Defaults to `1.0.0`.

## Example usage

```
uses: ironmansoftware/deploy-universal@v1
with:
  url: 'http://localhost:5000'
  apptoken: ${{ secrets.UNIVERSAL_APP_TOKEN }}
  name: 'PowerShellUniversal'
  version: '1.0.0'
```
