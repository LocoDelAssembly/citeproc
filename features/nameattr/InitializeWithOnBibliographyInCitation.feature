Feature: nameattr
  As a CSL cite processor hacker
  I want the test nameattr_InitializeWithOnBibliographyInCitation to pass

  @citation @nameattr
  Scenario: Initialize With On Bibliography In Citation
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
            <name />
          </names>
        </layout>
      </citation>
      <bibliography
          initialize-with=". ">
        <layout>
          <names variable="author">
            <name />
          </names>
        </layout>
      </bibliography>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Doe","given":"John-Lee"}],"id":"ITEM-1","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    John-Lee Doe
    """
