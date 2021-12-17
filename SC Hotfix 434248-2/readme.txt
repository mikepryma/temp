Hotfix 391528-2 should be installed on Sitecore 9.3.0 rev. 003498

This hotfix should contain 2 items as below:
1. SC Hotfix 434248-2.zip
2. CreateFilteredIndex.sql

==========================

Installation instructions:

- Extract the 'SC Hotfix*.update' file from the 'SC Hotfix*.zip' package.
- Use the Update Installation Wizard to install the package.
- Run the SQL script CreateFilteredIndex.sql provided in the hotfix against master database.

Notes:
- Make sure the 'ContentSearch.Indexing.DisableDatabaseCaches' and 'Caching.DisableCacheSizeLimits' settings are disabled on the Indexing instance:
    <setting name="ContentSearch.Indexing.DisableDatabaseCaches" value="false"/>
    <setting name="Caching.DisableCacheSizeLimits" value="false" />

- Tune capacity of caches according to available memory and requirement regarding memory consumption

- Role In Role for UserRoleCondition personalization, make sure to set the setting 'Rules.UserRoleCondition.IncludeRolesInRoles' in the config file 'Sitecore.Rules.UserRoleConditionPatch.config' to true
	Default value is false, enabling this can cause a performance impact.

- As part of the fix for #177155 'LinkManager.GetItemUrl gets the wrong site' please add 'disableTrailingWildcard="true"' attribute to the site configuration under <sites> node for every site involved in the issue.

- Add the following setting to the Sitecore configuration:
    <setting name="ContentSearch.IndexingManager.DisplayShortStatistic" value="true" />
  It will eliminate requests to Solr which don't go through a load balancer. When the setting is enabled, the Indexing Manager Wizard will display only short statistic for indexes. 

- Only if you don't want to limit the usage of sitecore cache during loading translation logic, add the following setting to the Sitecore configuration:
    <setting name="Translation.LimitSitecoreCacheUsage" value="false" />
  It will keep all visited translation items inside Sitecore caches 
  
  Default value: True
  It wil add visited translation items to Sitecore cache and once done processing it, it will remove it from sitecore cahce
