Feature: name
  As a CSL cite processor hacker
  I want the test name_ArticularWithCommaNameAsSortOrder to pass

  @citation @name
  Scenario: Articular With Comma Name As Sort Order
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
          <names variable="author">
            <name name-as-sort-order="all"/>
          </names>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"author":[{"comma-suffix":true,"family":"Doe","given":"James","static-ordering":false,"suffix":"Jr"}],"id":"item-1","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    Doe, James, Jr
    """
