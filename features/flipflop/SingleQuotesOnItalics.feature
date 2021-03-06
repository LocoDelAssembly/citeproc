Feature: flipflop
  As a CSL cite processor hacker
  I want the test flipflop_SingleQuotesOnItalics to pass

  @citation @flipflop
  Scenario: Single Quotes On Italics
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
          <text variable="title"/>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","title":"It is official (\"<i>My Title</i>\") now"}]
    """
    When I cite all items
    Then the result should be:
    """
    It is official (“<i>My Title</i>”) now
    """
