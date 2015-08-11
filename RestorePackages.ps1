# Save current settings prior to changing
$currentConfig = $env:Configuration
$currentPlatform = $env:Platform

# Workaround for nuget 3.1 weirdness:
# These need to be default, otherwise
# Nuget will try to assert things based
# on the build configuration.  Since
# some configurations don't exist in some
# projects (by design), this causes it to
# fail.
$env:Configuration = ''
$env:Platform = ''
nuget restore

# Restore
$env:Configuration = $currentConfig
$env:Platform = $currentPlatform
