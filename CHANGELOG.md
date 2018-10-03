# Changelog

# 1.9.1 - Release date: 2018-10-03
* Fixed module nesting to avoid rails autoloading weirdness


# 1.9.0 - Release date: 2018-01-06
* Changed all instances of policy_holder to policyholder to be more consistent


# 1.8.0 - Release date: 2018-17-05
* Removed old replace_policy method
* Add support to filter on id number when listing policy holders
* Added support to include oblects when getting a list of policy holders and a individual policy holder
* Added more documentation


# 1.7.4 - Release date: 2018-16-05
* Added claim and call documentation


# 1.7.3 - Release date: 2018-16-05
* One more documentation fix


# 1.7.2 - Release date: 2018-16-05
* Documentation fix


# 1.7.1 - Release date: 2018-16-05
* Documentation fixes


# 1.7.0 - Release date: 2018-16-05
* Added missing support for funeral and term modules when creating application


# 1.6.1 - Release date: 2018-16-05
* Fixed variable in payment method spec
* Add initial documentation to test rdoc and yard


# 1.6.0 - Release date: 2018-16-05
* Added support for policy holder app_data


# 1.5.0 - Release date: 2018-14-05
* Added functionality to allow policies to be updated


# 1.4.0 - Release date: 2018-14-05
* Added functionality to filter policy list by holder's national id


# 1.3.0 - Release date: 2018-14-05
* Added functionality to update claims


# 1.2.0 - Release date: 2018-14-05
* Support all params for claim creation


# 1.1.2 - Release date: 2018-14-05
* Make claim events api consistent


# 1.1.1 - Release date: 2018-11-05
* Fix gemspec to allow publishing to rubygems.org


# 1.1.0 - Release date: 2018-11-05
* Added support for claim attachments
* Added support to get calls
* Added support to add and attach payment methods
* When issuing a polidy app data can be attached


# 1.0.0 - Release date: 2018-09-05
* Renamed gem to root_insurance
* Removed unnecessarily complicated module nesting (it's now just RootInsurance)
* Removed dependency on 'root' gem


# 0.2.1 - Release date: 2018-24-01
* Spec cleanups


# 0.2.0 - Release date: 2017-14-12
* Quote api also works for term and funeral insurance


# 0.1.0 - Release date: 2017-13-12
* Added events endpoints for policy holders, policies and claims
* Fixed method naming inconsistency (it's actually a breaking change, but yolo)
* DRYed up some specs


# 0.0.4 - Release date: 2017-13-12
* Fixed claim list filtering


# 0.0.3 - Release date: 2017-13-12
* Fix dependency ordering


# 0.0.2 - Release date: 2017-13-12
* Fix broken version require


# 0.0.1 - Release date: 2017-13-12
* Initial release

