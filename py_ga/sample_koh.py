"""Hello Analytics Reporting API V4."""

from apiclient.discovery import build
from oauth2client.service_account import ServiceAccountCredentials

SCOPES  = ['https://www.googleapis.com/auth/analytics.readonly']
KEY_FILE_LOCATION = 'Analytic-ec432c9b9d86.json'
VIEW_ID = '134960289' # SEARCH_MONOPOLY > analytic view ID
# VIEW_ID = '150525409' # KOHLIFE > analytic view ID

def initialize_analyticsreporting():
  """Initializes an Analytics Reporting API V4 service object.
  Returns: An authorized Analytics Reporting API V4 service object.
  """
  credentials = ServiceAccountCredentials.from_json_keyfile_name(KEY_FILE_LOCATION, SCOPES)

  # Build the service object.
  analytics = build('analytics', 'v4', credentials=credentials)

  return analytics

def get_report(analytics):
  """Queries the Analytics Reporting API V4.

  Args:
    analytics: An authorized Analytics Reporting API V4 service object.
  Returns:
    The Analytics Reporting API V4 response.
  """
  return analytics.reports().batchGet(
      body={
        # request syntax
        'reportRequests': [
        {
          'viewId': VIEW_ID,                                                # app view id
          'dateRanges': [{'startDate': '1daysAgo', 'endDate': 'today'}],   # date range of analytic tracker
          'metrics': [{'expression': 'ga:sessions'}],                       # valid metrics
          'dimensions': [{'name': 'ga:country'}]                            # valid dimensional tricker
          # "metrics": [{"expression": "ga:users"}]
        }]
      }
  ).execute()


def print_response(response):
  """Parses and prints the Analytics Reporting API V4 response.

  Args:
    response: An Analytics Reporting API V4 response.
  """
  for report in response.get('reports', []):
    columnHeader = report.get('columnHeader', {})
    dimensionHeaders = columnHeader.get('dimensions', [])
    metricHeaders = columnHeader.get('metricHeader', {}).get('metricHeaderEntries', [])

    for row in report.get('data', {}).get('rows', []):
      dimensions = row.get('dimensions', [])
      dateRangeValues = row.get('metrics', [])

      for header, dimension in zip(dimensionHeaders, dimensions):
        print header + ': ' + dimension

      for i, values in enumerate(dateRangeValues):
        print 'Date range: ' + str(i)
        for metricHeader, value in zip(metricHeaders, values.get('values')):
          print metricHeader.get('name') + ': ' + value


def main():
  analytics = initialize_analyticsreporting()   # easy business logic to find lead in last 7 days
  response = get_report(analytics)
  print_response(response)

if __name__ == '__main__':
  main()
