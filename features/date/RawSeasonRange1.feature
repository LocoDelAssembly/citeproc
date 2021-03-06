Feature: date
  As a CSL cite processor hacker
  I want the test date_RawSeasonRange1 to pass

  @citation @date
  Scenario: Raw Season Range1
    Given the following style:
    """
    <style 
          xmlns="http://purl.org/net/xbiblio/csl"
          class="note"
          version="1.0">
      <info>
        <id />
        <title />
        <updated>2009-08-10T04:49:00+09:00</updated>
      </info>
      <citation>
        <layout>
    	  <date variable="issued" date-parts="year-month-day" form="text"/>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","issued":{"date-parts":[["1965","6","1"]],"raw":"Spring 1999 - Summer 2001"},"type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    Spring 1999–Summer 2001
    """
