Feature: magic
  As a CSL cite processor hacker
  I want the test magic_SubsequentAuthorSubstituteNotFooled to pass

  @bibliography @magic
  Scenario: Subsequent Author Substitute Not Fooled
    Given the following style:
    """
    <style 
          xmlns="http://purl.org/net/xbiblio/csl"
          class="note"
          version="1.0">
      <info>
        <title>Chicago Manual of Style (Note with Bibliography)</title>
        <id>http://www.zotero.org/styles/chicago-note-bibliography</id>
        <link rel="self" href="http://www.zotero.org/styles/chicago-note-bibliography" />
        <link href="http://www.chicagomanualofstyle.org/tools_citationguide.html" rel="documentation" />
        <author>
          <name>Julian Onions</name>
          <email>julian.onions@gmail.com</email>
        </author>
        <contributor>
          <name>Simon Kornblith</name>
          <email>simon@simonster.com</email>
        </contributor>
        <contributor>
          <name>Elena Razlogova</name>
          <email>elena.razlogova@gmail.com</email>
        </contributor>
        <summary>Chicago format with short notes and full bibliography</summary>
        <category field="generic-base" />
        <category citation-format="numeric" />
        <updated>2009-08-10T04:49:00+09:00</updated>
      </info>
      <macro name="secondary-contributors">
        <choose>
          <if match="none" type="chapter">
            <group delimiter=". ">
              <choose>
                <if variable="author">
                  <names delimiter=". " variable="editor">
                    <label form="verb" suffix=" " text-case="capitalize-first" />
                    <name and="text" delimiter=", " />
                  </names>
                </if>
              </choose>
              <choose>
                <if match="any" variable="author editor">
                  <names delimiter=". " variable="translator">
                    <label form="verb" suffix=" " text-case="capitalize-first" />
                    <name and="text" delimiter=", " />
                  </names>
                </if>
              </choose>
            </group>
          </if>
        </choose>
      </macro>
      <macro name="container-contributors">
        <choose>
          <if type="chapter">
            <group delimiter=", ">
              <choose>
                <if variable="author">
                  <names delimiter=", " variable="editor">
                    <label form="verb" suffix=" " text-case="lowercase" />
                    <name and="text" delimiter=", " />
                  </names>
                </if>
              </choose>
              <choose>
                <if match="any" variable="author editor">
                  <names delimiter=", " variable="translator">
                    <label form="verb" suffix=" " text-case="lowercase" />
                    <name and="text" delimiter=", " />
                  </names>
                </if>
              </choose>
            </group>
          </if>
        </choose>
      </macro>
      <macro name="editor">
        <names variable="editor">
          <name and="text" delimiter=", " delimiter-precedes-last="always" name-as-sort-order="first" sort-separator=", " />
          <label form="short" prefix=", " suffix="." />
        </names>
      </macro>
      <macro name="translator">
        <names variable="translator">
          <name and="text" delimiter=", " delimiter-precedes-last="always" name-as-sort-order="first" sort-separator=", " />
          <label form="short" prefix=", " suffix="." />
        </names>
      </macro>
      <macro name="recipient-note">
        <names delimiter=", " variable="recipient">
          <label form="verb" prefix=" " suffix=" " text-case="lowercase" />
          <name and="text" delimiter=", " />
        </names>
      </macro>
      <macro name="recipient">
        <choose>
          <if type="personal_communication">
            <choose>
              <if variable="genre">
                <text text-case="capitalize-first" variable="genre" />
              </if>
              <else>
                <text term="letter" text-case="capitalize-first" />
              </else>
            </choose>
          </if>
        </choose>
        <text macro="recipient-note" prefix=" " />
      </macro>
      <macro name="contributors">
        <names variable="author">
          <name and="text" delimiter=", " delimiter-precedes-last="always" name-as-sort-order="first" sort-separator=", " />
          <substitute>
            <text macro="editor" />
            <text macro="translator" />
          </substitute>
        </names>
        <text macro="recipient" prefix=". " />
      </macro>
      <macro name="recipient-short">
        <names variable="recipient">
          <label form="verb" prefix=" " suffix=" " text-case="lowercase" />
          <name and="text" delimiter=", " form="short" />
        </names>
      </macro>
      <macro name="contributors-short">
        <names variable="author">
          <name and="text" delimiter=", " form="short" />
          <substitute>
            <names variable="editor" />
            <names variable="translator" />
          </substitute>
        </names>
        <text macro="recipient-short" />
      </macro>
      <macro name="contributors-sort">
        <names variable="author">
          <name and="text" delimiter=", " delimiter-precedes-last="always" name-as-sort-order="all" sort-separator=", " />
          <label form="short" prefix=", " suffix="." />
          <substitute>
            <names variable="editor" />
            <names variable="translator" />
          </substitute>
        </names>
      </macro>
      <macro name="interviewer">
        <names delimiter=", " variable="interviewer">
          <label form="verb" prefix=" " suffix=" " text-case="capitalize-first" />
          <name and="text" delimiter=", " />
        </names>
      </macro>
      <macro name="title">
        <choose>
          <if match="none" variable="title">
            <choose>
              <if match="none" type="personal_communication">
                <text text-case="capitalize-first" variable="genre" />
              </if>
            </choose>
          </if>
          <else-if type="book">
            <text font-style="italic" variable="title" />
          </else-if>
          <else>
            <text quotes="true" variable="title" />
          </else>
        </choose>
      </macro>
      <macro name="title-short">
        <choose>
          <if match="none" variable="title">
            <choose>
              <if type="interview">
                <text term="interview" text-case="lowercase" />
              </if>
              <else-if match="any" type="manuscript speech">
                <text form="short" variable="genre" />
              </else-if>
              <else-if type="personal_communication">
                <text macro="issued" />
              </else-if>
            </choose>
          </if>
          <else-if type="book">
            <text font-style="italic" form="short" variable="title" />
          </else-if>
          <else>
            <text form="short" quotes="true" variable="title" />
          </else>
        </choose>
      </macro>
      <macro name="description">
        <group delimiter=", ">
          <group delimiter=". ">
            <text macro="interviewer" />
            <text text-case="capitalize-first" variable="medium" />
          </group>
          <choose>
            <if match="none" variable="title"> </if>
            <else-if match="any" type="thesis speech"> </else-if>
            <else>
              <text text-case="capitalize-first" variable="genre" />
            </else>
          </choose>
        </group>
      </macro>
      <macro name="container-title">
        <choose>
          <if type="chapter">
            <text suffix=" " term="in" text-case="capitalize-first" />
          </if>
        </choose>
        <choose>
          <if match="none" type="legal_case">
            <text font-style="italic" variable="container-title" />
          </if>
        </choose>
      </macro>
      <macro name="edition">
        <choose>
          <if match="any" type="book chapter">
            <choose>
              <if is-numeric="edition">
                <group delimiter=" ">
                  <number form="ordinal" variable="edition" />
                  <text form="short" suffix="." term="edition" />
                </group>
              </if>
              <else>
                <text suffix="." text-case="capitalize-first" variable="edition" />
              </else>
            </choose>
          </if>
        </choose>
      </macro>
      <macro name="collection-title">
        <text variable="collection-title" />
        <text prefix=" " variable="collection-number" />
      </macro>
      <macro name="locators">
        <choose>
          <if type="article-journal">
            <text prefix=" " variable="volume" />
            <text prefix=", no. " variable="issue" />
          </if>
          <else-if type="legal_case">
            <text prefix=", " variable="volume" />
            <text prefix=" " variable="container-title" />
            <text prefix=" " variable="page" />
          </else-if>
          <else-if match="any" type="book chapter">
            <group delimiter=". " prefix=". ">
              <group>
                <text form="short" suffix=". " term="volume" text-case="capitalize-first" />
                <number form="numeric" variable="volume" />
              </group>
              <group>
                <number form="numeric" variable="number-of-volumes" />
                <text form="short" plural="true" prefix=" " suffix="." term="volume" />
              </group>
              <text macro="edition" />
            </group>
          </else-if>
        </choose>
      </macro>
      <macro name="locators-newspaper">
        <choose>
          <if type="article-newspaper">
            <group delimiter=", ">
              <group>
                <text suffix=" " variable="edition" />
                <text prefix=" " term="edition" />
              </group>
              <group>
                <text form="short" suffix=". " term="section" />
                <text variable="section" />
              </group>
            </group>
          </if>
        </choose>
      </macro>
      <macro name="event">
        <group>
          <text suffix=" " term="presented at" />
          <text variable="event" />
        </group>
      </macro>
      <macro name="publisher">
        <group delimiter=": ">
          <text variable="publisher-place" />
          <text variable="publisher" />
        </group>
      </macro>
      <macro name="issued">
        <choose>
          <if match="any" type="graphic report">
            <date variable="issued">
              <date-part name="month" suffix=" " />
              <date-part name="day" suffix=", " />
              <date-part name="year" />
            </date>
          </if>
          <else-if type="legal_case">
            <text suffix=" " variable="authority" />
            <date variable="issued">
              <date-part name="year" />
            </date>
          </else-if>
          <else-if match="any" type="book chapter thesis">
            <date variable="issued">
              <date-part name="year" />
            </date>
          </else-if>
          <else>
            <date variable="issued">
              <date-part name="month" suffix=" " />
              <date-part name="day" suffix=", " />
              <date-part name="year" />
            </date>
          </else>
        </choose>
      </macro>
      <macro name="pages-chapter">
        <choose>
          <if type="chapter">
            <text suffix=":" variable="volume" />
            <text variable="page" />
          </if>
        </choose>
      </macro>
      <macro name="pages-article">
        <choose>
          <if type="article-journal">
            <text prefix=": " variable="page" />
          </if>
        </choose>
      </macro>
      <macro name="point-locators-subsequent">
        <group>
          <choose>
            <if locator="page" match="none">
              <choose>
                <if type="book">
                  <group suffix=", ">
                    <text form="short" suffix=". " term="volume" text-case="lowercase" />
                    <number form="numeric" variable="volume" />
                  </group>
                </if>
              </choose>
              <label form="short" suffix=" " variable="locator" />
            </if>
            <else-if type="book">
              <number form="numeric" suffix=":" variable="volume" />
            </else-if>
          </choose>
          <text variable="locator" />
        </group>
      </macro>
      <macro name="archive">
        <group delimiter=". ">
          <text text-case="capitalize-first" variable="archive_location" />
          <text variable="archive" />
          <text variable="archive-place" />
        </group>
      </macro>
      <macro name="issue">
        <choose>
          <if match="any" type="article-journal legal_case">
            <text macro="issued" prefix=" (" suffix=")" />
          </if>
          <else-if type="speech">
            <choose>
              <if match="none" variable="title"> </if>
              <else>
                <text prefix=". " text-case="capitalize-first" variable="genre" />
              </else>
            </choose>
            <text macro="event" prefix=" " />
            <text prefix=", " variable="event-place" />
            <text macro="issued" prefix=", " />
          </else-if>
          <else-if match="any" variable="publisher-place publisher">
            <group delimiter=", " prefix=". ">
              <choose>
                <if type="thesis">
                  <text text-case="capitalize-first" variable="genre" />
                </if>
              </choose>
              <text macro="publisher"/>
              <text macro="issued"/>
            </group>
          </else-if>
          <else>
            <text macro="issued" prefix=", " />
          </else>
        </choose>
      </macro>
      <macro name="access">
        <group delimiter=". ">
          <choose>
            <if match="any" type="graphic report">
              <text macro="archive" />
            </if>
            <else-if match="none" type="book thesis chapter article-journal article-newspaper article-magazine">
              <text macro="archive" />
            </else-if>
          </choose>
          <choose>
            <if match="none" type="legal_case">
              <text variable="URL" />
            </if>
          </choose>
        </group>
      </macro>
      <macro name="sort-key">
        <text macro="contributors-sort" suffix=" " />
        <text suffix=" " variable="title" />
        <text variable="genre" />
      </macro>
      <citation 
             disambiguate-add-names="true"
             et-al-min="4"
             et-al-subsequent-min="4"
             et-al-subsequent-use-first="1"
             et-al-use-first="1">
        <layout delimiter="; " prefix="" suffix=".">
          <choose>
            <if position="ibid-with-locator">
              <group delimiter=", ">
                <text suffix="." term="ibid" text-case="capitalize-first" />
                <text macro="point-locators-subsequent" />
              </group>
            </if>
            <else-if position="ibid">
              <text suffix="." term="ibid" text-case="capitalize-first" />
            </else-if>
            <else>
              <group delimiter=", ">
                <text macro="contributors-short" />
                <text macro="title-short" />
                <text macro="point-locators-subsequent" />
              </group>
            </else>
          </choose>
        </layout>
      </citation>
      <bibliography 
             entry-spacing="0"
             et-al-min="11"
             et-al-use-first="7"
             hanging-indent="true"
             subsequent-author-substitute="&#8212;&#8212;&#8212;">
        <sort>
          <key macro="sort-key" />
          <key variable="issued" />
        </sort>
        <layout suffix=".">
          <group delimiter=". ">
            <text macro="contributors" />
            <text macro="title" />
            <text macro="description" />
            <text macro="secondary-contributors" />
            <group delimiter=", ">
              <text macro="container-title" />
              <text macro="container-contributors" />
              <text macro="pages-chapter" />
            </group>
          </group>
          <text macro="locators" />
          <text macro="collection-title" prefix=". " />
          <text macro="issue"/>
          <text macro="locators-newspaper" prefix=", " />
          <text macro="pages-article" />
          <text macro="access" prefix=". " />
        </layout>
      </bibliography>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","issued":{"date-parts":[["1974"]]},"publisher":"University of Chicago Press","publisher-place":"Chicago","title":"Sir Gawain and the Green Knight","translator":[{"family":"Silverstein","given":"Theodore","static-ordering":false}],"type":"chapter"},{"editor":[{"family":"Soltes","given":"Ori A.","static-ordering":false}],"id":"ITEM-2","issued":{"date-parts":[[1999]]},"publisher":"Philip Wilson","publisher-place":"London","title":"Georgia: Art and Civilization through the Ages","type":"chapter"},{"id":"ITEM-3","issued":{"date-parts":[[1993]]},"publisher":"University of Chicago Press","publisher-place":"Chicago","title":"The Chicago Manual of Style","type":"chapter"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">Silverstein, Theodore, tran. “Sir Gawain and the Green Knight”. Chicago: University of Chicago Press, 1974.</div>
      <div class="csl-entry">Soltes, Ori A., ed. “Georgia: Art and Civilization through the Ages”. London: Philip Wilson, 1999.</div>
      <div class="csl-entry">“The Chicago Manual of Style”. Chicago: University of Chicago Press, 1993.</div>
    </div>
    """
