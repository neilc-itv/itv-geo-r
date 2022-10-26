
# How to set up and use Google Analytics Data API (GA4):

In order to be able to extract data from GA4 in Python we must set up the Google API. Below details the process for setting the Google Analytics Reporting API.

1) Create a new project in Google Cloud. Helpful reference: https://cloud.google.com/resource-manager/docs/creating-managing-projects
2) Give your project access to Google Analytics Data API. You can find Reference: https://developers.google.com/analytics/devguides/reporting/data/v1
3) Create service account credentials for the project and generate/download keys for it.
4) Add your service account as a read and analyze user to your GA account. In GA Admin panel, give your service account (looks like an email address) read access to your site's GA data.


API Schema : https://developers.google.com/analytics/devguides/reporting/data/v1/api-schema
