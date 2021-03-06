Feature: etal
  As a CSL cite processor hacker
  I want the test etal_ShortFormOfName to pass

  @citation @etal
  Scenario: Short Form Of Name
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
      <citation
          et-al-min="3"
          et-al-use-first="1">
        <layout>
          <names variable="author">
            <name form="short"/>
            <et-al font-style="italic"/>
          </names>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Doe","given":"John"},{"family":"Roe","given":"Jane"},{"family":"Noakes","given":"Richard"}],"id":"ITEM-1","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    Doe <i>et al.</i>
    """
